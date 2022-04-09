
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import '../../domain/models/basic_schema.dart';

import '../../injection.dart';

// @injectable
class GetDatabase extends BasicSchema{
	/// also handle error for null
	late Database _database;
	/// also handle error for null
	Future<Database> get database async{
		// if(database != null) return _database;
		return _database = await initDB();
	}

	Future<Database> initDB() async{
		// try {
			final String path  = p.join(getIt<Directory>().path, databaseName);
			return openDatabase(
						path,version:1,
						onCreate: (db,version)async{
							return db.execute(
								"""
								CREATE TABLE $table 
								($id TEXT PRIMARY KEY,$bookmark INTEGER,
								$council TEXT,$sub TEXT,
								$type TEXT,$owner TEXT,
								$tags TEXT,$timeStamp INTEGER,
								$title TEXT,$message TEXT,
								$startTime INTEGER,
								$reminder INTEGER,
								$endTime INTEGER,
								$isFeatured INTEGER,
								$body TEXT,$author TEXT,
								$isFetched INTEGER,
								$url TEXT)""",);
						}
				);
		// } catch (e) {
		// 	log(e.toString());
		// 	return null;
		// }
	}
	/*Database Objects Fields */
	String get databaseName => "Posts.db";
	String get table => "Posts";

}

// @injectable
class GetSSDatabase extends BasicSchema {
	late Database _database;
	/// also handle error for null
	Future<Database> get database async{
		// if(database != null) return _database;
		return _database = await initDB();
	}

	Future<Database> initDB() async{
		// try {
			final String path  = p.join(getIt<Directory>().path, databaseName);
			return openDatabase(
						path,version:1,
						onCreate: (db,version)async{
							return db.execute(
								"""
								CREATE TABLE $table 
								($rollNo TEXT PRIMARY KEY,
								$name TEXT,$username TEXT,
								$bloodGroup TEXT,$hall TEXT,
								$dept TEXT,$gender INTEGER,
								$hometown TEXT,$program TEXT,
								$room TEXT,$year TEXT)""",);
						}
				);
		// } catch (e) {
		// 	log(e.toString());
		// 	return null;
		// }
	}
	/*Database Objects Fields */
	String get databaseName => "StudentSearch.db";
	String get table => "Students";
}