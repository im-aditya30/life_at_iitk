import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../infrastructure/database/hive_class.dart';
import '../auth/auth_map.dart';
import '../models/posts.dart';
import '../models/student.dart';
import 'database_failure.dart';

// @freezed
abstract class DBInterface {
	/* Shared Preferences*/
	Future<Either<DBFailure,int>> getLastTime();
	Future<Either<DBFailure,Unit>> saveLastTime();
	Future<Either<DBFailure, Unit>> deleteSharedPrefs();
	Future<Either<DBFailure, AuthIdMap>> getAuthMap();
	Future<Either<DBFailure, Unit>> saveAuthMap({required AuthIdMap authIdMap});

	/*SqlLite*/
	Future<void> deleteAllData();
	Future<Either<DBFailure,Student>> updateStudentData({
		required String queryColumn, 
		required String queryData, 
		required String rollno});

	Future<Either<DBFailure,Unit>> insertStudentData({
		required List<dynamic> listvalues});
	Future<Either<DBFailure,List<Student>>> getAllStudentData();
	Future<Either<DBFailure,Student>> getUserStudentData({
		required String queryColumn,
		required String queryData,
	});
}


abstract class SharedPrefsInterface {
	const SharedPrefsInterface._();
	Future<Either<DBFailure,int>> getLastTime();
	Future<Either<DBFailure,Unit>> saveLastTime();
}

abstract class SQLiteInterface {
	Future<Either<DBFailure,Post>> getPostWithId({
		required String postId,
	});
	Future<Either<DBFailure,List<Post>>> getAllPost();
	Future<Either<DBFailure,Unit>> insertPost({required Post post});
	Future<Either<DBFailure,Unit>> updatePostWithId({required Post post});
	Future<Either<DBFailure,Unit>> deletePost({required Post post});
}

abstract class HiveInterface {
	Future<Either<DBFailure,Box<T>>> getBox<T>({required HiveBoxType boxtype});
	Future<Either<DBFailure,Unit>> saveUserBox();
}