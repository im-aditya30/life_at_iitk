import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:life_at_iitk/domain/auth/auth_map.dart';
import 'package:life_at_iitk/domain/models/student.dart';
import 'package:life_at_iitk/infrastructure/database/hive_class.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';
import '../../domain/database/database_failure.dart';
import '../../domain/database/database_interface.dart';
import '../../domain/notfs/notifs_model.dart';
import '../database/database_class.dart';


@LazySingleton(as: DBInterface)
class Repository implements DBInterface {
	final SharedPreferences _sharedPreferences;
	final GetDatabase _database;
	final GetSSDatabase _studentDB;
	final Notfs _notfs = Notfs();
	final HiveDatabase _hiveDatabase;
	static const String lastTime = 'lastTime';
	static const String authKey = 'authMap';

  Repository(this._sharedPreferences, this._database, this._hiveDatabase, this._studentDB,);

  /*Shared Prefernces */

	bool checkIfExists(String key) => _sharedPreferences.containsKey(key);

  @override
  Future<Either<DBFailure, int>> getLastTime() async{
		try{
			return right(checkIfExists(lastTime) ? _sharedPreferences.getInt(lastTime)??0 : 0);
		}catch(e){
			log("$e");
			return left(const DBFailure.unknownError());
		}
  }

  @override
  Future<Either<DBFailure, Unit>> saveLastTime() async {
		try {
			if(checkIfExists(lastTime)) await _sharedPreferences.remove(lastTime);
			await _sharedPreferences.setInt(lastTime, DateTime.now().millisecondsSinceEpoch);
			return right(unit);
		} catch (e) {
			log(e.toString());
			return left(const DBFailure.unknownError());
		}
  }	

	@override
  Future<Either<DBFailure, Unit>> deleteSharedPrefs() async{
		try {
			await _sharedPreferences.clear();
			return right(unit);
		} catch (e) {
			log(e.toString());
			return left(const DBFailure.unknownError());
		}
  }
	@override
  Future<Either<DBFailure, AuthIdMap>> getAuthMap() async{
		try{
			return right(checkIfExists(authKey) ? 
				AuthIdMap.fromJson(_sharedPreferences.getString(authKey)!) 
				: const AuthIdMap("", ""));
		}catch(e){
			log("$e");
			return left(const DBFailure.unknownError());
		}
	}
	@override
  Future<Either<DBFailure, Unit>> saveAuthMap({
		required AuthIdMap authIdMap
	}) async{
		try {
			if(checkIfExists(authKey)) await _sharedPreferences.remove(authKey);
			await _sharedPreferences.setString(authKey, authIdMap.toString());
			return right(unit);
		} catch (e) {
			log(e.toString());
			return left(const DBFailure.unknownError());
		}
	}
  /*Sqlite */

	@override
  Future<Either<DBFailure, List<Student>>> getAllStudentData() async {
		try {
			final db = await _studentDB.database;
			final res= await 
			// db.rawQuery("SELECT * FROM ${_studentDB.table} WHERE username LIKE ?",['%20']);
			db.query(_studentDB.table, orderBy: _studentDB.name);
			// print(res);
			final List<Student> v = [];
					return right<DBFailure, List<Student>>(v..addAll(
						res.map((p) => Student.fromMap(p))));
		} catch (e) {
			log(e.toString());
			return left(const DBFailure.unknownError());
		// 	throw const DBFailure.unknownError();
		}
  }

  @override
  Future<Either<DBFailure, Student>> getUserStudentData({
		required String queryColumn, required dynamic queryData}) async {
		try{
			// print(queryColumn);
			final db = await _studentDB.database;
			final res = await db.query(_studentDB.table,
				where: "$queryColumn = ?", whereArgs: [queryData],limit: 1);
			// print(res);
			return right(Student.fromMap(res.first));
		}on DBFailure{
			return left(const DBFailure.dataNotExists());
		}catch (e) {
			log(e.toString(), name: 'GetUserStudentData DB');
			return left(const DBFailure.unknownError());
		}
	}
	
		@override
		Future<Either<DBFailure, Unit>> insertStudentData({
			required List listvalues}) async {
			try {
			final db = await _studentDB.database;
			final batch = db.batch();
			listvalues.forEach((student) {
				final data= Student.defaultData('');
				// print(data.fromMaptoMap(student as Map<String,dynamic>));
				batch.insert(_studentDB.table, data.fromMaptoMap(student as Map<String,dynamic>));
			});
				await batch.commit(noResult: true, continueOnError: true);
				return right(unit);
		} catch (e) {
			log(e.toString(), name: 'InsertStudentData DB');
			// return left(const DBFailure.unknownError());
			throw const DBFailure.unknownError();
		}
  }

  /*Hive*/
	// @override
  // Future<Either<DBFailure,Box<T>>> getBox<T>() async{
	// 	try {
	// 		await _hiveDatabase.openBox<T>();
	// 		return right(Hive.box<T>(hiveDBNameUsingClass[T]));
	// 	} catch (e) {
	// 		return left(const DBFailure.unknownError());
	// 	}
	// } 


  @override
  Future<Either<DBFailure, Student>> updateStudentData({
		required String queryColumn, 
		required String queryData, 
		required String rollno}) async {
		try{
			final db = await _studentDB.database;
			// await db.update(
			// 	_studentDB.table,studentData.toMap()
			// );
			await db.rawUpdate("UPDATE ${_studentDB.table} SET $queryColumn = ? WHERE rollno = ?",
				[queryData, rollno]);
			final res = await db.query(_studentDB.table,
				where: "rollno = ?", whereArgs: [rollno],limit: 1);
			// print(res);
			return right(Student.fromMap(res.first));
		}catch(e) {
			log("$e", name: 'UpdateStudentDataDB');
			return left(const DBFailure.unknownError());
		}
  }

	@override
	Future<void> deleteAllData() async {
		try{
			final db = await _studentDB.database;
			final _db = await _database.database;
			await db.delete(_studentDB.table);
			await _db.delete(_database.table);
		}catch(e){
			return;
		}
	}
}
