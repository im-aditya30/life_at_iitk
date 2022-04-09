
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:life_at_iitk/domain/database/posts/post_db_interface.dart';
import 'package:life_at_iitk/infrastructure/database/database_class.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/auth/auth_interface.dart';
import '../../domain/auth/user.dart';
import '../../injection.dart';
import '../database/moor/posts/database_class.dart';



// GetIt dbInstance = GetIt.instance;
// Future setupDBInstance() async{
// 	dbInstance.registerSingleton(PostDatabase(openConnection()).postDao);
// }

@module
abstract class InjectionableModule {
	@lazySingleton
	FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;
	@lazySingleton
	FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
	@preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
	@preResolve
	Future<Directory> get appDirectory  => getApplicationDocumentsDirectory();
	// @preResolve
	// Future<Database> get database => GetDatabase().database;
	// @preResolve
	@lazySingleton
	GetDatabase get database => GetDatabase();
	@lazySingleton
	GetSSDatabase get studentDB => GetSSDatabase();
	// @preResolve
	// Future<Either<DBFailure,AuthIdMap>> authMap() => getIt<DBInterface>().getAuthMap();
	@lazySingleton
	Option<User> get currentUser => getIt<AuthInterface>().getCurrentUser();

	@Singleton(as: PostDBInterface)
	PostDao get postDao => 
	// dbInstance<PostDao>();
	PostDatabase().postDao;
	// @lazySingleton
	// PostDao get postDao 
	// @lazySingleton
	// PostDBInterface get postDao => dbInstance<PostDBInterface>();
}
