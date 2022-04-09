import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:life_at_iitk/hive_extension.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:life_at_iitk/domain/database/posts/post_db_interface.dart';
import 'package:life_at_iitk/domain/models/hive/council.dart';
import 'package:life_at_iitk/domain/models/hive/people.dart';
import 'package:life_at_iitk/domain/models/hive/user.dart';
import 'package:life_at_iitk/domain/notfs/notifs_model.dart';
import 'package:life_at_iitk/infrastructure/database/hive_class.dart';

import '../../domain/api/api_failure.dart';
import '../../domain/api/api_interface.dart';
import '../../domain/auth/auth_map.dart';
import '../../domain/auth/user.dart' as u;
import '../../domain/database/database_failure.dart';
import '../../domain/database/database_interface.dart';
import '../../domain/models/posts.dart';
import '../core/extensions.dart';
import 'api_endpoints.dart';

@LazySingleton(as: ApiInterface)
class APIImplementation implements ApiInterface {
	final FirebaseMessaging _fcm;
	final DBInterface repository;
	// final AuthInterface _authInterface;
	final FirebaseAuth firebaseAuth;
	final PostDBInterface postDB;

  APIImplementation(this._fcm, this.repository, this.postDB, this.firebaseAuth, /*this._authInterface*/);

	final Notfs schema = Notfs();

	/// gets authMap or crashes the app
	Future<AuthIdMap> authMap() async{
		final authMap = await repository.getAuthMap();
		return authMap.getOrElse(() => 
		// const AuthIdMap("", "")
		AuthIdMap.fromUser(
			u.User.fromFirebaseUser(firebaseAuth.currentUser))
		// 	_authInterface.getCurrentUser().getOrCrash)
		);
	}

	/// throws ApiFailure for- 
	/// 
	/// * NoInternet
	/// * Nothing in body i.e. either null or not empty
	/// * Different Status code
	/// * Any other Error
	static Future<Response> apiConstructor({
		required String url,
		required bool isPost,
		String? body,
		bool hasNoTimeLimit = false,
	})async{
		const Map<String, String> headers = {"Content-type": "application/json"};
		try {
      final Response res = isPost ? await post(Uri.parse(url), headers: headers, body: body)
				: await get(Uri.parse(url));
      log('RESPONSE STATUSCODE from $url : ${res.statusCode}');
      // print('RESPONSE BODY from $url : ${res.body}');
      if(res.statusCode == 200){
        if(res.body.isNotEmpty == true || url == ApiEndpoints.updateStudentData || url == ApiEndpoints.createUserAtDatabase){
					return res;
				}
        else {
          throw const ApiFailure.failTofetchRequest();}
			}
			if((res.statusCode/100).floor() == 5) throw const ApiFailure.serverError();
			if( (res.statusCode/100).floor() == 4) throw const ApiFailure.unknownError();
      throw const ApiFailure.errorWhileMakingRequest();
    } on TimeoutException{
			throw const ApiFailure.failTofetchRequest();
		}on SocketException {
      throw const ApiFailure.noInternet();
		}on ApiFailure {
			rethrow;
    } catch(e){
      log('ERROR IN APICALL : $e');
      throw const ApiFailure.unknownError();
    }
	}
	@override
	Future<Either<ApiFailure, Unit>> createUserDataAtDatabase({required AuthEmailMap auth}) async {
			await apiConstructor(
				url: ApiEndpoints.createUserAtDatabase, 
				isPost: true,
				body: auth.toMap.toJson);
			return right(unit);
	}
  @override
  Future<Either<ApiFailure, Unit>> deletePost({required Post post}) async{
    try {
			final Map<String,dynamic> mapData = post.toPostMap();
			final AuthIdMap auth = await authMap();
			await apiConstructor(
				isPost: true,
				url: ApiEndpoints.deletePost, 
				body: 
				mapData.putOrUpdate("auth",() => auth.toMap).toJson
			);
			return right(unit);
		} on ApiFailure catch (e) {
			return left(e);
		} catch(e){
			log(e.toString());
			return left(const ApiFailure.unknownError());
		}
  }

  @override
  Future<Either<ApiFailure, Response>> fetchAllPost({required int timeStamp}) async{
    try {
			final AuthIdMap auth = await authMap();
			// log("$timeStamp", name: 'FETCH ALL POST');
			final res = await apiConstructor(
				isPost: true,
				url: ApiEndpoints.fetchAllPost, 
				body: auth.toAuthMap.putOrUpdate("timeStamp", () => timeStamp).toJson
			);
			// log("${res.body}", name: 'FETCH ALL POST');
			await postDB.insertMultiplePost(
					data: jsonDecode(res.body) as List,
					owner: auth.id);
			return right(res);
		}on DBFailure{
			return left(const ApiFailure.unknownError());
		}on ApiFailure catch (e) {
			return left(e);
		} catch(e){
			log(e.toString());
			return left(const ApiFailure.unknownError());
		}
  }


  @override
  Future<Either<ApiFailure, Response>> fetchAllStudentsData() async{
    try {
			final res = await apiConstructor(
				isPost: false,
				url: ApiEndpoints.fetchAllStudentsData
			);
			await repository.insertStudentData(listvalues: jsonDecode(res.body) as List);
			// print(res.body );
			return right(res);
		} on ApiFailure catch (e) {
			return left(e);
		} catch(e){
			log(e.toString());
			return left(const ApiFailure.unknownError());
		}
  }

  @override
  Future<Either<ApiFailure, Unit>> fetchCouncilData() async {
    try {
			final AuthIdMap auth = await authMap();
			final res = await apiConstructor(
				isPost: false,
				url: ApiEndpoints.fetchCouncilData,
				body: auth.toString()
			);
						final councilDataBox = Hive.box<Council>(hiveDBName[HiveBoxType.councilData]!);
						final councilData = Council.fromJson(res.body);
						councilDataBox.isEmpty ? await councilDataBox.add(councilData)
							:	await councilDataBox.put(0, councilData);
						log("CouncilDone");
						return right(unit);
			// return failureOrSuccess;
		} on ApiFailure catch (e) {
			log(e.toString(), name: 'Error Fetch CouncilData');
			return left(e);
		}
		catch(e){
			log(e.toString(), name: 'Error Fetch CouncilData');
			return left(const ApiFailure.unknownError());
		}
  }

  @override
  Future<Either<ApiFailure, Response>> fetchPostWithId({required String postUid}) async {
    try {
			final AuthIdMap auth = await authMap();
			print(jsonEncode(auth.toAuthMap.putOrUpdate("id", () => postUid)));
			final res = await apiConstructor(
				isPost: true,
				url: ApiEndpoints.fetchPostWithId,
				body: jsonEncode(auth.toAuthMap.putOrUpdate("id", () => postUid)));
			await postDB.insertPost(Post.fromJson(res.body));
			
			return right(res);
		} on ApiFailure catch (e) {
			return left(e);
		} catch(e){
			log(e.toString());
			return left(const ApiFailure.unknownError());
		}
  }

  @override
  Future<Either<ApiFailure, Response>> fetchPostWithTypeCouncil({
		required String council}) async{
		try {
			final AuthIdMap auth = await authMap();
			final res = await apiConstructor(
				isPost: true,
				url: ApiEndpoints.fetchPostWithTypeCouncil,
				body: auth.toAuthMap
					.putOrUpdate("type", () => schema.typePermisssion)
					.putOrUpdate("council", () => council).toJson
				);
			await postDB.insertPost(Post.fromJson(res.body));
			
			return right(res);
		} on ApiFailure catch (e) {
			return left(e);
		} catch(e){
			log(e.toString());
			return left(const ApiFailure.unknownError());
		}
  }

  @override
  Future<Either<ApiFailure, Unit>> fetchSUserData({
		required List<String> reminder, 
		required List<String> bookmark}) {
    // TODO: implement fetchSUserData
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiFailure, bool>> fetchUserData() async {
		try {
			final AuthIdMap auth = await authMap();
			final res = await apiConstructor(
				isPost: true,
				url: ApiEndpoints.fetchUserData,
				body: auth.toString());
			log(res.body, name: 'User DATA');
			final userBox = Hive.box<User>(hiveDBName[HiveBoxType.user]!);
			if(res.body is bool)
				return right(false);
			final userData = User.fromJson(res.body);
			userBox.isEmpty? await userBox.add(userData)
					:	await userBox.put(0, userData.copyWith(gender: userBox.getUser.gender));
						log("UserDone & admin: ${userData.admin}", name: 'USERS');
			return right(userData.admin ?? false);
		} on ApiFailure catch (e) {
			return left(e);
		} catch(e){
			log(e.toString());
			return left(const ApiFailure.unknownError());
		}
  }
	
  @override
  Future<Either<ApiFailure, Unit>> fetchPeopleData() async {
    try {
			final AuthIdMap auth = await authMap();
			final res = await apiConstructor(
				isPost: true,
				url: ApiEndpoints.fetchPeopleData,
				body: auth.toString());
			log(res.body, name:'FECTHPEOPLEDATA');
			final peopleBox = Hive.box<People>(hiveDBName[HiveBoxType.people]!);
			final peopleData = People.fromJson(res.body);
			if(peopleData.id?.isNotEmpty == true){
				peopleBox.isEmpty ? await peopleBox.add(peopleData)
								:	await peopleBox.put(0, peopleData);
			}
			
			log("PeopleDone");
			return right(unit);
		} on ApiFailure catch (e) {
			return left(e);
		} catch(e){
			log(e.toString());
			return left(const ApiFailure.unknownError());
		}
  }
  @override
  Future<Either<ApiFailure, Unit>> makeCoordinator({
		required String id, 
		required String council, 
		required String sub}) async{
    try {
			final map = {"id": id, "council": council, "por": sub};
			final AuthIdMap auth = await authMap();
			// print((auth.toAuthMap..addAll(map)).toJson);
			await apiConstructor(
				isPost: true,
				url: ApiEndpoints.makeCoordinator,
				body: (auth.toAuthMap..addAll(map)).toJson);
			await fetchPeopleData();
				return right(unit);
		} on ApiFailure catch (e) {
			return left(e);
		} catch(e){
			log(e.toString());
			return left(const ApiFailure.unknownError());
		}
  }

  @override
  Future<Either<ApiFailure, Unit>> makeDraft({required Post post}) async{
    try {
			final AuthIdMap auth = await authMap();
			await apiConstructor(
				isPost: true,
				url: ApiEndpoints.makeDraft,
				body: (auth.toAuthMap..addAll(post.toPostMap())).toJson);
				return right(unit);
		} on ApiFailure catch (e) {
			return left(e);
		} catch(e){
			log(e.toString());
			return left(const ApiFailure.unknownError());
		}
  }

  @override
  Future<Either<ApiFailure, Unit>> publishDraft({required String postId}) async{
    try {
			final AuthIdMap auth = await authMap();
			await apiConstructor(
				isPost: true,
				url: ApiEndpoints.publishDraft,
				body: auth.toAuthMap.putOrUpdate("id", () => postId).toJson);
				return right(unit);
		} on ApiFailure catch (e) {
			return left(e);
		} catch(e){
			log(e.toString());
			return left(const ApiFailure.unknownError());
		}
  }

  @override
  Future<Either<ApiFailure, Unit>> publishPost({required String postUid}) async{
    try {
			final AuthIdMap auth = await authMap();

			log(auth.toAuthMap.putOrUpdate("id", () => postUid).toJson,name: 'PublishPostData');
			await apiConstructor(
				isPost: true,
				url: ApiEndpoints.publishPost,
				body: auth.toAuthMap.putOrUpdate("id", () => postUid).toJson);
				return right(unit);
		} on ApiFailure catch (e) {
			return left(e);
		} catch(e){
			log(e.toString());
			return left(const ApiFailure.unknownError());
		}
  }

  @override
  Future<Either<ApiFailure, Unit>> requestPostApproval({required Post post}) async{
    try {
			final AuthIdMap auth = await authMap();
			log((auth.toAuthMap..addAll(post.toPostMap())).toJson,name: 'PublishPostData');
			final res = await apiConstructor(
				isPost: true,
				url: ApiEndpoints.requestPostApproval,
				body: (auth.toAuthMap..addAll(post.toPostMap())).toJson);
				log(res.body,name:"RequestApproval");
				return right(unit);
		} on ApiFailure catch (e) {
			return left(e);
		} catch(e){
			log(e.toString());
			return left(const ApiFailure.unknownError());
		}
  }

  @override
  Future<Either<ApiFailure, Unit>> sendDeviceToken({
		required AuthIdMap auth}) async {
			final token = await _fcm.getToken();
			// print(jsonEncode(auth.toAuthMap.putOrUpdate("deviceid", () => token)));
			await apiConstructor(
				isPost: true,
				url: ApiEndpoints.sendDeviceToken,
				body: jsonEncode(auth.toAuthMap.putOrUpdate("deviceid", () => token)));
			return right(unit);
  }

  @override
  Future<Either<ApiFailure, Unit>> updatePost({required Post post}) async{
    try {
			final AuthIdMap auth = await authMap();
			log((auth.toAuthMap..addAll(post.toPostMap())).toJson, name:'UpdatePost');
			await apiConstructor(
				isPost: true,
				url: ApiEndpoints.updatePost,
				body: (auth.toAuthMap..addAll(post.toPostMap())).toJson);
				return right(unit);
		} on ApiFailure catch (e) {
			return left(e);
		} catch(e){
			log(e.toString());
			return left(const ApiFailure.unknownError());
		}
  }

  @override
  Future<Either<ApiFailure, Unit>> updatePreferences({required Map<String, dynamic> council}) async{
    try {
			// log(council.toJson, name: 'Update Prefs');
			final AuthIdMap auth = await authMap();
			await apiConstructor(
				isPost: true,
				url: ApiEndpoints.updatePrferences,
				body: (auth.toAuthMap..addAll({"council": council})).toJson);
				return right(unit);
		} on ApiFailure catch (e) {
			return left(e);
		} catch(e){
			log(e.toString());
			return left(const ApiFailure.unknownError());
		}
  }

  @override
  Future<Either<ApiFailure, Unit>> updateSUserData({
		required List<String> reminder, 
		required List<String> bookmark}) {
    // TODO: implement updateSUserData
    throw UnimplementedError();
  }

  @override
  Future<Either<ApiFailure, Unit>> updateStudentData({
		required String rollNo, 
		required MapEntry<String,String> value}) async{
		try {
			final AuthIdMap auth = await authMap();
			await apiConstructor(
				isPost: true,
				url: ApiEndpoints.updateStudentData,
				body: (auth.toAuthMap..addEntries([MapEntry("roll", rollNo),value])).toJson);
			return right(unit);
		} on ApiFailure catch (e) {
			return left(e);
		} catch(e){
			log(e.toString(),name:'UpdateStudent');
			return left(const ApiFailure.unknownError());
		}
  }

	
}

extension MapX<V, T> on Map<V, T> {
	String get toJson => jsonEncode(this);
}