import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import '../auth/auth_map.dart';
import '../models/posts.dart';
import 'api_failure.dart';

abstract class ApiInterface{
	Future<Either<ApiFailure, Unit>> fetchCouncilData();
	Future<Either<ApiFailure, bool>> fetchUserData();
	Future<Either<ApiFailure, Unit>> fetchPeopleData();
	Future<Either<ApiFailure,Unit>> createUserDataAtDatabase({required AuthEmailMap auth});
	Future<Either<ApiFailure, Unit>> makeCoordinator({
		required String id,
		required String council,
		required String sub,
	});
	Future<Either<ApiFailure, Unit>> updatePreferences({
		required Map<String,dynamic> council,
	});
	Future<Either<ApiFailure, Unit>> publishPost({
		required String postUid,
	});
	Future<Either<ApiFailure, Unit>> requestPostApproval({
		required Post post,
	});
	Future<Either<ApiFailure, Unit>> updatePost({
		required Post post,
	});
	Future<Either<ApiFailure, Unit>> deletePost({
		required Post post,
	});
	Future<Either<ApiFailure, Unit>> makeDraft({
		required Post post,
	});
	Future<Either<ApiFailure, Unit>> publishDraft({
		required String postId
	});
	Future<Either<ApiFailure, Unit>> updateSUserData({
		required List<String> reminder,
		required List<String> bookmark,
	});
	Future<Either<ApiFailure, Unit>> fetchSUserData({
		required List<String> reminder,
		required List<String> bookmark,
	});
	
	Future<Either<ApiFailure, Response>> fetchAllPost({
		required int timeStamp,
	});
	
	Future<Either<ApiFailure, Response>> fetchPostWithId({
		required String postUid,
	});
	
	/// type = permission
	Future<Either<ApiFailure, Response>> fetchPostWithTypeCouncil({
		required String council,
	});
	
	Future<Either<ApiFailure, Unit>> sendDeviceToken({
		required AuthIdMap auth,
	});
	
	Future<Either<ApiFailure, Response>> fetchAllStudentsData();
	
	/// value can be anything
	Future<Either<ApiFailure, Unit>> updateStudentData({
		required String rollNo,
		required MapEntry<String,String> value
	});
}