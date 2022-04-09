import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:life_at_iitk/domain/database/database_failure.dart';
import '../../domain/models/hive/council.dart';
import '../../domain/models/hive/people.dart';
import '../../domain/models/hive/user.dart';

enum HiveBoxType {
  user,
  people,
  councilData,
}

const Map<HiveBoxType, String> hiveDBName =  {
  HiveBoxType.user : 'users',
  HiveBoxType.councilData : 'councilData',
  HiveBoxType.people : 'people',
};

const Map<Object, String> hiveDBNameUsingClass = {
	User :  'users',
	People: 'people',
	Council: 'councilData'
};

@injectable
class HiveDatabase{
	// final HiveBoxType dbName;
	/// default name is user
  const HiveDatabase();
	
	void registerAllAdapters() {
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(PeopleAdapter());
    Hive.registerAdapter(CouncilAdapter());
    Hive.registerAdapter(SubCouncilAdapter());
    Hive.registerAdapter(EntityAdapter());
  }

	Future<void> openAllBoxes() async{
    await Future.value([
      await Hive.openBox<User>(hiveDBName[HiveBoxType.user]!),
      await Hive.openBox<People>(hiveDBName[HiveBoxType.people]!),
      await Hive.openBox<Council>(hiveDBName[HiveBoxType.councilData]!),
    ]);
  }

	 Future<void> deleteAllBoxes () async{
    await Hive.deleteFromDisk();
  }
	Future<Either<DBFailure,Box<T>>> getBox<T>(
		// {required HiveBoxType boxtype}
	) async{
		try {
			await openBox();
			return right(Hive.box<T>(hiveDBNameUsingClass[T]!));
		} catch (e) {
			return left(const DBFailure.unknownError());
		}
	} 
	/// DONT FORGET TO SPECIFY THE CLASS [IMP!!!!]
	Future<void> openBox<T>(
		// {required HiveBoxType boxtype}
	) async{
    if(!Hive.isBoxOpen(hiveDBNameUsingClass[T]!)){
      await Hive.openBox<T>(hiveDBNameUsingClass[T]!);
    }
    return;
  }
	
	Future<void>openAllBoxesWithCondition()async{
    await Future.value([
      await openBox<Council>(),
      await openBox<People>(),
      await openBox<User>(),
    ]);
  }	
}