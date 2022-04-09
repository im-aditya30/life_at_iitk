
import 'package:hive/hive.dart';
import 'package:life_at_iitk/infrastructure/database/hive_class.dart';

import 'domain/models/hive/council.dart';
import 'domain/models/hive/user.dart';
// import 'package:life_at_iitk/domain/database/database_interface.dart';

extension HiveX<T> on HiveInterface{
 // ignore: avoid_shadowing_type_parameters
	Box<T> getBox<T>()=> box<T>(hiveDBNameUsingClass[T]!);
 // ignore: unnecessary_await_in_return
	Future<Box<T>> getOpenBox<T>() async => await openBox<T>(hiveDBNameUsingClass[T]!);

	/// People data can't be get from this
	T getData<T>(){
		final box = getBox<T>();
		if(T == Council) return box.getCouncil;
		return box.getUser;
	}
}

extension BoxX<T> on Box<T> {
	T get getCouncil => get(0, defaultValue: const Council(subCouncil: {}) as T) ?? const Council(subCouncil: {}) as T;
	T get getUser => get(0, defaultValue: User.defaultBox() as T) ?? User.defaultBox() as T;
	T get getEmptyUser => get(0, defaultValue: User.empty() as T) ?? User.empty() as T;
	// T get getPeople => get(0, defaultValue: const People(id: ) as T);
}