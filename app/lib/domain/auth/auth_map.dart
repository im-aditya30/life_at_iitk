import 'dart:convert';

import 'package:life_at_iitk/domain/auth/user.dart';

abstract class AuthMap {
	final String firebaseUid;
	final String value;

  const AuthMap(this.firebaseUid, this.value);
}

class AuthIdMap extends AuthMap {
	
	final String uid;
	final String id;

  const AuthIdMap(this.uid, this.id) : super('', '');

  @override
  String toString() => jsonEncode(toAuthMap);

	Map<String,String> get toMap => {
		"uid" : uid,
		"id" : id,
	};
	Map<String,dynamic> get toAuthMap => {
		"auth" : toMap,
	};
	factory AuthIdMap.fromMap(Map<String,dynamic> map) {
		return AuthIdMap(map['auth']["uid"] as String, map['auth']["id"] as String);
	}
	factory AuthIdMap.fromUser(User user) => AuthIdMap(user.uid,user.id);
	factory AuthIdMap.fromJson(String json) => AuthIdMap.fromMap(jsonDecode(json) as Map<String,dynamic>);
}

class AuthEmailMap extends AuthMap {
	
	final String uid;
	final String email;

  const AuthEmailMap(this.uid, this.email) : super('', '');

  @override
  String toString() => jsonEncode(toMap);

	Map<String,String> get toMap => {
		"uid" : uid,
		"email" : email,
	};
	Map<String,dynamic> get toAuthMap => {
		"auth" : toMap,
	};
	factory AuthEmailMap.fromUser(User user) => AuthEmailMap(user.uid ,user.id );
}
