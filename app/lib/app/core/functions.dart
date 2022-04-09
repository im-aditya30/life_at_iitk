// import 'dart:io';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hive/hive.dart';
import 'package:life_at_iitk/app/posts/fcm_cubit/fcm_cubit.dart';
import 'package:life_at_iitk/infrastructure/auth/firebase_user_method.dart';
import 'package:injectable/injectable.dart';
import 'package:life_at_iitk/domain/auth/auth_interface.dart';
import 'package:life_at_iitk/domain/models/posts.dart';
import 'package:life_at_iitk/domain/notfs/notifs_model.dart';
import 'package:life_at_iitk/infrastructure/api/api_implementation.dart';
import 'package:life_at_iitk/infrastructure/core/extensions.dart';
import 'package:life_at_iitk/domain/api/api_failure.dart';
import 'package:life_at_iitk/domain/api/api_interface.dart';
import 'package:life_at_iitk/domain/database/database_interface.dart';
import 'package:life_at_iitk/domain/database/posts/post_db_interface.dart';
import 'package:life_at_iitk/domain/models/hive/council.dart';
import 'package:life_at_iitk/domain/models/hive/people.dart';
import 'package:life_at_iitk/domain/models/hive/user.dart';
import 'package:life_at_iitk/hive_extension.dart';
import 'package:life_at_iitk/infrastructure/core/injectionable_module.dart';
import 'package:life_at_iitk/infrastructure/database/database_class.dart';
import 'package:life_at_iitk/infrastructure/database/hive_class.dart';
import 'package:life_at_iitk/infrastructure/database/moor/posts/database_class.dart';
import 'package:life_at_iitk/infrastructure/database/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../injection.dart';
import '../../presentation/core/reminders_notfs.dart';

final Notfs schema = Notfs();
Future<void> onBackgroundMessage(RemoteMessage remoteMessage) async {
	final Map<String, dynamic> message = remoteMessage.data;
  log('$message', name: 'FCM ON BACGROUND MESSAGE');
	// print(message);
	// configureInjection();

	await Firebase.initializeApp();
	try {
		await configureInjection();
	} catch (e) {
		log("$e", name:'ConfihhureINjectionINBAckkground');
	}
	final FirebaseAuth firebaseAuth =  FirebaseAuth.instance;
	final firebaseUser = firebaseAuth.currentUser;
  final userOption  = (firebaseUser?.emailVerified == true)? 
			optionOf(firebaseUser?.toUserType()): optionOf(null); 
	
	if(userOption.isNone()) return;// return if user is not authenticated
  try {
    final Map<String, dynamic> data = message;
		final PostDBInterface postDb = 
		getIt<PostDBInterface>();
		// PostDatabase().postDao;
		final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
		final database = GetDatabase();
		final studentDB = GetSSDatabase();
		final _sharedPreferences = await SharedPreferences.getInstance();
		const _hiveDatabase = HiveDatabase();
		final Repository repo = Repository(
			_sharedPreferences, 
			database, 
			_hiveDatabase, 
			studentDB);
		final _apiInterface = APIImplementation(
			_firebaseMessaging,
			 repo, postDb, firebaseAuth);
    final _fcmInstance = 
		Fcm(
			_apiInterface, postDb, _firebaseMessaging
			);
		// getIt<Fcm>();
    if (data.containsKey(schema.type)) {
      if (data[schema.type] == schema.typePermisssion) {
        await _fcmInstance.permissionNotificationHandler(data, message);
      } else if (data[schema.type] == schema.typeCreate ||
          data[schema.type] == schema.typeDraft) {
        await _fcmInstance.createNotificationHandler(data, message);
      } else if (data[schema.type] == schema.typeDelete) {
        await _fcmInstance.deleteNotificationHamdler(data);
      }
    }
    if (data.containsKey(schema.typeFetchField)
        /*&& data.containsKey(OWNER) && data[OWNER] == id*/) {
      if (data[schema.typeFetchField] == schema.typePeople) {
        await _fcmInstance.updatePeopleData();
      } else if (data[schema.typeFetchField] == schema.typeSuser) {
        await _fcmInstance.updateUser();
      }
    }
	return Future.value();
  } catch (e) {
    log("$e", name: "FCM ON BACKMESSAGE");
		// print("Error due to FCM $e");
		return Future.value();
  }
}

@injectable
class Fcm {
  // final DBInterface _dbInterface;
  final ApiInterface _apiInterface;
  final FirebaseMessaging _firebaseMessaging;
  final PostDBInterface _postDBInterface;

  const Fcm( this._apiInterface, this._postDBInterface,
      this._firebaseMessaging);
  static Notfs schema = Notfs();
  Future<dynamic> onMessage(Map<String, dynamic> message) async {
    log('$message', name: 'FCM ON MESSAGE');
    try {
      final Map<String, dynamic> data = message;

      if (data.containsKey(schema.type)) {
        if (data[schema.type] == schema.typePermisssion) {
          return await permissionNotificationHandler(data, message);
        } else if (data[schema.type] == schema.typeCreate ||
            data[schema.type] == schema.typeDraft) {
          return await createNotificationHandler(data, message);
        } else if (data[schema.type] == schema.typeDelete) {
          return await deleteNotificationHamdler(data);
        }
      }
      if (data.containsKey(schema.typeFetchField)
          /*&& data.containsKey(OWNER) && data[OWNER] == id*/) {
        if (data[schema.typeFetchField] == schema.typePeople) {
          return await updatePeopleData();
        } else if (data[schema.typeFetchField] == schema.typeSuser) {
          return await updateUser();
        }
      }
    } catch (e) {
      log("$e", name: "FCM ON MESSAGE");
    }
  }

  Future<void> subscribeUnsubsTopic(List<String> subscribe, List<String> unsubscribe) async {
    
		log(subscribe.toSet().length.toString(),name:'subscribe');
		//ignore: avoid_function_literals_in_foreach_calls
    subscribe.toSet().forEach((subs) async {
		// log(subs,name:'Subscribe');
      final x = await _firebaseMessaging
          .subscribeToTopic(subs);
      return x;
    });
    //ignore: avoid_function_literals_in_foreach_calls
    unsubscribe.forEach((unsubs) async {
      final x = await _firebaseMessaging
          .unsubscribeFromTopic(unsubs);
      return x;
    });
  }

  Future<Either<ApiFailure, Unit>> updateUserPrefs() async {
    log("USER PREFERENCES UPDATING FROM NOTIFICATION",
        name: "FCM updateUserPrefs");
    final data = await _apiInterface.fetchUserData();
    return data.map((r) => unit);
  }

  Future<Either<ApiFailure, Unit>> updateUser() async {
    log("USER UPDATING FROM NOTIFICATION", name: "FCM updateUser");
    await Hive.getOpenBox<User>();
    await Hive.getOpenBox<People>();
    final apiRequest = await _apiInterface.fetchUserData();
    return apiRequest.fold((l) => left(l), (r) async {
      subscribeUnsubsTopic((Hive.getData<User>().prefs).removeAllSpaces, []);
      if (r == true) {
        return await _apiInterface.fetchPeopleData();
      }
      return right(unit);
    });
  }

  Future<Either<ApiFailure, Unit>> updatePeopleData() async {
    log("PEOPLE DATA UPDATING FROM NOTIFICATION", name: "FCM updatePeopleDate");
    await Hive.getOpenBox<People>();
    final councilBox = await Hive.getOpenBox<Council>();
    final res = await _apiInterface.fetchPeopleData();
    return res.fold((l) => left(l), (_) async {
      final peopleData = Hive.box<People>(hiveDBName[HiveBoxType.people]!)
													.get(0,defaultValue: People.empty());
      final councilData = councilBox.getCouncil;
      final Map<String, SubCouncil> _subCouncil = {};
      councilData.subCouncil.forEach((councilName, subCouncil) {
        _subCouncil.putOrUpdate(
            councilName,
            () => subCouncil.copyWith(
                coordiOfInCouncil: (peopleData?.councils[councilName] == null)
                    ? []
                    : peopleData?.councils[councilName]));
      });
      councilBox.putAt(
          0,
          councilData.copyWith(
              coordOfCouncil: peopleData?.councils.keys.toList(),
              subCouncil: _subCouncil));
      return right(unit);
    });
  }

  Future<dynamic> createNotificationHandler(
      Map<String, dynamic> data, Map<String, dynamic> message) async {
    log("NEW NOTIFICATION", name: "FCM");
    // if(data.containsKey(schema.typeFetchFF) && data[schema.typeFetchFF] == 'true'){
    final res = await _apiInterface.fetchPostWithId(
        postUid: data[schema.id].toString());
    // await showNotification(message, false);
    res.fold((l) async {
      left(l);
      final _post = Post.fromMap(message);
      await _postDBInterface.insertPost(_post.copyWith(isFetched: false));
			if(data[schema.type] == schema.typeCreate)
				await showNotification(_post.copyWith(isFetched: false).toMap(), false);
    }, (r) async {
      await _postDBInterface.insertPost(Post.fromJson(r.body));
			if(data[schema.type] == schema.typeCreate)
				await showNotification(Post.fromJson(r.body).copyWith(isFetched: true).toMap(), false);
    });
    // }
  }

  Future<dynamic> deleteNotificationHamdler(Map<String, dynamic> data) async {
    log(".....DELETING POST.......", name: "FCM");
    try {
      await _postDBInterface.deletePost(Post(id: data[schema.id].toString()));
			log("SUccess");
    } catch (e) {
      log("$e", name: "FCM ERROR WHILE DELETING POSTS");
    }
  }

  Future<dynamic> permissionNotificationHandler(
      Map<String, dynamic> data, Map<String, dynamic> message) async {
    log("....PERMISSION NOTIFICATION", name: "FCM");
    await const HiveDatabase().openAllBoxesWithCondition();
    final userData = Hive.getData<User>();
		// log('${userData.toMap()}', name: 'FCM');
    // final peopleData = Hive.getData<People>();
		// log('${peopleData.toMap()}', name: 'FCM');
    final councilData = Hive.getData<Council>();
		// log('${councilData.toMap()}', name: 'FCM');
    if (userData.isLevel2 &&
            councilData.coordOfCouncil.contains(data[schema.council]) ||
        userData.isLevel3) {
      log("...PERMISSION NOTIFICATION ARRIVED.....", name: "FCM");
      // if(data.containsKey(schema.typeFetchFF) && data[schema.typeFetchFF] == 'true'){
      final res = await _apiInterface.fetchPostWithId(
          postUid: data[schema.id].toString());
      res.fold((l) async {
        left(l);
        final _post = Post.fromMap(data);
        await _postDBInterface.insertPost(_post.copyWith(isFetched: false));
				await showNotification(_post.copyWith(isFetched: false).toMap(), true);
      }, (r) async {
        await _postDBInterface.insertPost(Post.fromJson(r.body));
				await showNotification(Post.fromJson(r.body).copyWith(isFetched: true).toMap(), true);
      });
    }
  }
}

extension SrtingX on String {
  String get replaceSpaces => replaceAll(" ", "_").replaceAll("\'", "");
}

extension ListX on List<String> {
	List<String> get removeAllSpaces =>  map((e) => e.replaceSpaces).toList();
	// map((e) => e.removeAll(" ", "_"));
}