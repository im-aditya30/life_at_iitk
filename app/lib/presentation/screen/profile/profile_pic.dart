import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart';
import 'package:drift/drift.dart';

import 'package:life_at_iitk/domain/api/api_failure.dart';
import 'package:life_at_iitk/domain/database/database_interface.dart';
import 'package:life_at_iitk/domain/models/hive/user.dart';
import 'package:life_at_iitk/domain/models/student.dart';
import 'package:life_at_iitk/hive_extension.dart';
import 'package:life_at_iitk/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';


// ignore: constant_identifier_names
const String PROFILE_PIC_URL = "http://home.iitk.ac.in/";
/// url for default profile picture
// ignore: constant_identifier_names
const String PROFILE_PIC_URL_DEFAULT = String.fromEnvironment('PROFILE_PIC_URL_DEFAULT');

String defaultProfileUrl(String gender) => 'assets/${gender.toLowerCase()}profile.png';
String oarsProfileUrl(String rollno) =>  '$PROFILE_PIC_URL_DEFAULT${rollno}_0.jpg';
String directoryProfileUrl(String username) => '$PROFILE_PIC_URL${'~$username/dp'}';


  // File file(String filename, ) {
	// 	// print(dir);
		
  //   final pathName = join(getIt<Directory>().path, filename);
  //   return File(pathName);
  // }

// @injectable
class ProfilePic{
  late SharedPreferences _profilePicName;
  /// user whose profile pic is needed
  final Student user;
  ProfilePic(this.user);
  
		final userBox = Hive.getBox<User>();
  /// first try to fetch image from directory and if not found
  /// calls `getSavedProfilePic` function
  Future<Either<ApiFailure, ImageProvider>> getProfilePic() async{
    try{
      _profilePicName = await SharedPreferences.getInstance();
      final Response res = await get(Uri.parse(directoryProfileUrl(user.username)));
      // print("RESPONSE STATUS CODE - ${res.statusCode}" );
      if(res.statusCode == 200 && res.bodyBytes.isNotEmpty){
        if(user.username == userBox.getUser.id){
					await UserProfilePic(user).saveUserProfilePic(res.bodyBytes, userBox);
        }else{
					await _profilePicName.setString(user.username, jsonEncode(res.bodyBytes.toList()));
				}
        return right(MemoryImage(res.bodyBytes));
      }
      return right(await getSavedProfilePic());
    }catch(e){
      final res = await getSavedProfilePic();
			return right(res);
    }
  }
  /// first tries to get image from storage and if not found calls
  /// `getOarsProfile` function
  Future<ImageProvider> getSavedProfilePic()async{
    try{
     	final picBytes = jsonDecode(_profilePicName.getString(user.username)?? jsonEncode([])) as List<int>;
        if(picBytes.isNotEmpty == true){
          return MemoryImage(Uint8List.fromList(picBytes));
        }else{
					log('Getting OARS', name: 'ProfilePIC');
          return await getOarsProfile();
        }
    }catch(e){
      return getOarsProfile();
    }
  }

  /// fetches image from oars and saves it locally
  Future<ImageProvider> getOarsProfile() async {
    try{
      final Response res = await get(Uri.parse(oarsProfileUrl(user.rollNo)));
      if(res.statusCode == 200 && res.bodyBytes.isNotEmpty){
				await _profilePicName.setString(user.username, jsonEncode(res.bodyBytes.toList()));
        return MemoryImage(res.bodyBytes);
      }else{
        return AssetImage(defaultProfileUrl(user.gender));
      }
    }catch(e){
      return AssetImage(defaultProfileUrl(user.gender));
    }
  }
}


class UserProfilePic {
  final Student user;
  UserProfilePic(this.user);
	
	final userBox = Hive.getBox<User>();
	// final BasicSchema schema = BasicSchema();
	// final student = getIt<DBInterface>().getUserStudentData(queryColumn: queryColumn, queryData: queryData)
  Future<Either<ApiFailure, ImageProvider<Object>>> getUserProfilePic() async{
    try{
			if(userBox.getUser.profile.isNotEmpty ){
				return right(MemoryImage(userBox.getUser.profile));
			}
			await getDirectoryProfilePic();
			return right(MemoryImage(userBox.getUser.profile));
    }
		on ApiFailure catch(e){
			return left(e);
		} 
		catch(e){
			// return right(AssetImage(defaultProfileUrl(user.gender)));
			return left(const ApiFailure.unknownError());
    }
  }

	Future<Unit> saveUserProfilePic(Uint8List data, Box<User> userBox) async{
		try{
			await userBox.put(0, userBox.getUser.copyWith(
				profile: data
			));
			return unit;
    } catch(e){
      throw const ApiFailure.unknownError();
    }
	}

  Future<Unit> getDirectoryProfilePic()async{
    try{
      final Response res = await get(Uri.parse(directoryProfileUrl(user.username)));
      // print("RESPONSE STATUS CODE - ${res.statusCode}" );
      if(res.statusCode == 200 && res.bodyBytes.isNotEmpty){
				userBox.put(0, userBox.getUser.copyWith(profile: res.bodyBytes));
        return unit;
      }
      return await getOarsProfilePic();
    } on SocketException{
			throw const ApiFailure.noInternet();
		} on ApiFailure{
			rethrow;
		} catch(e){
      return await getOarsProfilePic();
    }
  }

  /// fetches image from oars and saves it locally
  Future<Unit> getOarsProfilePic() async {
    try{
      final Response res = await get(Uri.parse(oarsProfileUrl(user.rollNo)));
      if(res.statusCode == 200 && res.bodyBytes.isNotEmpty){
				userBox.put(0, userBox.getUser.copyWith(profile: res.bodyBytes));
        return unit;
      }
      if(res.statusCode == 200){
        if(res.body.isNotEmpty == true){return unit;}
        else {throw const ApiFailure.failTofetchRequest();}
			}
			if((res.statusCode/100).floor() == 5) throw const ApiFailure.serverError();
			if((res.statusCode/100).floor() == 4) throw const ApiFailure.failTofetchRequest();
      throw const ApiFailure.errorWhileMakingRequest();
    }on SocketException{
			throw const ApiFailure.noInternet();
		}on ApiFailure {
			rethrow;
		}catch(e){
      throw const ApiFailure.unknownError();
    }
  }
}