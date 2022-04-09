import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:life_at_iitk/domain/auth/auth_interface.dart';
import 'package:life_at_iitk/domain/auth/user.dart' as us;
import 'package:life_at_iitk/injection.dart';

import '../basic_schema.dart';

part 'user.g.dart';

/// Here id is cc username
/// 
///  prefs, bookmark and reminder are sets
@HiveType(typeId: 1)
class User {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String rollno;
  @HiveField(3)
  final String uid;
  @HiveField(4)
  final List<String> prefs;
  @HiveField(5)
  final bool? admin;
  @HiveField(6)
  final List<String> reminder;
  @HiveField(7)
  final List<String> bookmark;
  @HiveField(8)
  final bool isLevel2;
  @HiveField(9)
  final bool isLevel3;
	@HiveField(10)
  final Uint8List profile;
  @HiveField(11)
  final String? gender;
  User( {
		required this.id,
      required this.name,
      required this.rollno,
      required this.uid,
      required this.prefs,
      required this.admin,
      required this.bookmark,
      required this.reminder,
			required this.isLevel2, 
			required this.isLevel3, 
			required this.profile, 
			required this.gender,
			});

	// final BasicSchema BasicSchema() = BasicSchema();
  /// keys are - [id,admin, name, rollno, uid, prefs, bookmark, reminder]
  Map<String,dynamic> toMap() => {
        BasicSchema().id: id ?? getIt<Option<us.User>>().getOrCrash.id,
        BasicSchema().admin: admin,
        BasicSchema().name: name,
        BasicSchema().rollNo: rollno,
        BasicSchema().uid: uid,
				'isLevel3' : isLevel3,
				'isLevel2' : isLevel2,
				'profile': profile,
        BasicSchema().prefs: prefs,
        BasicSchema().bookmark : bookmark,
        BasicSchema().reminder : reminder,
				BasicSchema().gender: gender,
      };
	
	factory User.fromMap(Map<String,dynamic> map){
		final data = map['council'] != null ?(map['council'] as Map<String,dynamic>): {};
		List prefs = [];
		data.forEach((key,value){
			
			prefs += (value['entity'] as List) + (value['misc'] as List); 
		});
		return User(
			id: map[BasicSchema().id]?.toString()?? getIt<Option<us.User>>().getOrCrash.id, 
			name: map[BasicSchema().name]?.toString() ?? "${map["id"]}", 
			rollno: map[BasicSchema().rollNo]?.toString() ??"", 
			uid: map[BasicSchema().uid]?.toString() ?? "", 
			prefs: prefs.cast<String>(), 
			admin: (map[BasicSchema().admin] is bool) ? 
    // ignore: avoid_bool_literals_in_conditional_expressions
				((map[BasicSchema().admin] != null) ? 
					map[BasicSchema().admin] as bool 
					: false)
						: "${map[BasicSchema().admin]}" == "true", 
			bookmark: [], 
			profile: Uint8List.fromList([]),
			isLevel2: false,
			isLevel3: false,
			gender: '',
			reminder: []);
	}

  User copyWith({
    String? id,
    String? name,
    String? rollno,
    String? uid,
    List<String>? prefs,
    bool? admin,
    bool? isLevel2,
    bool? isLevel3,
    List<String>? reminder,
    List<String>? bookmark,
		Uint8List? profile,
		String? gender
  }) {
    return User(
      id: id ?? this.id??getIt<Option<us.User>>().getOrCrash.id,
      name: name ?? this.name,
      rollno: rollno ?? this.rollno,
      uid: uid ?? this.uid,
      prefs: prefs ?? this.prefs,
      admin: admin ?? this.admin,
      reminder: reminder ?? this.reminder,
      bookmark: bookmark ?? this.bookmark, 
			isLevel2: isLevel2 ?? this.isLevel2, 
			profile: profile??this.profile,
			isLevel3: isLevel3 ?? this.isLevel3,
			gender: gender ?? this.gender
    );
  }

	factory User.defaultBox() => User(
		admin: false,
		bookmark: [],
		id: getIt<AuthInterface>().getCurrentUser().getOrCrash.id,
		isLevel2: false,
		isLevel3: false,
		name: "",
		prefs: [],
		reminder: [],
		rollno: "",
		profile: Uint8List.fromList([]),
		uid: "",
		gender: ""
	);
  factory User.empty() => User(
      admin: false,
      bookmark: [],
      id: "",
      isLevel2: false,
      isLevel3: false,
      name: "",
      prefs: [],
      reminder: [],
      rollno: "",
      profile: Uint8List.fromList([]),
      uid: "",
			gender: ""
  );
	bool get isNULL => !(id?.isNotEmpty == true);
	factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String,dynamic>);
}

// abstract class UserFields extends BasicSchema {
// 	String get admin => "admin";
// 	String get uid => "uid";
// 	String get prefs => "prefs";
// }