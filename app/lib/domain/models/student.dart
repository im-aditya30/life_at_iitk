import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';

import 'basic_schema.dart';

class Student {
  final String username;
  final String name;
  final String rollNo;
  final String program;
  final String dept;
  final String hall;
  final String room;
  final String bloodGroup;
  final String gender;
  final String hometown;
  final String year;

  Student({
		required this.username, 
		required this.name, 
		required this.rollNo, 
		required this.program, 
		required this.dept, 
		required this.hall, 
		required this.room, 
		required this.bloodGroup, 
		required this.gender, 
		required this.hometown, 
		required this.year});

	static final BasicSchema _schema = BasicSchema();

  Map<String, dynamic> toMap() {
    return {
      _schema.username: username.removeAllSpaces.isNotEmpty == true? username: '',
      _schema.name: name.removeAllSpaces.isNotEmpty == true? name: '',
      _schema.rollNo: rollNo.removeAllSpaces.isNotEmpty == true? rollNo: '',
      _schema.program: program.removeAllSpaces.isNotEmpty == true? program: '',
      _schema.dept: dept.removeAllSpaces.isNotEmpty == true? dept: '',
      _schema.hall: hall.removeAllSpaces.isNotEmpty == true? hall: '',
      _schema.room: room.removeAllSpaces.isNotEmpty == true? room: '',
      _schema.bloodGroup: bloodGroup.removeAllSpaces.isNotEmpty == true? hometown: '',
      _schema.gender: gender.removeAllSpaces.isNotEmpty == true? hometown: '',
      _schema.hometown: hometown.removeAllSpaces.isNotEmpty == true? hometown: '',
      _schema.year: year.removeAllSpaces.isNotEmpty == true? year: 'Others',
    };
  }

  factory Student.fromMap(Map<String, dynamic>? map) {
    if (map == null) return Student.defaultData("");
		final String roll = (map[_schema.rollNo]?.toString().removeAllSpaces.substring(0,2)) ?? "";
		// print(roll);
		// if(roll == "20") log('$map', name: 'STUdnet');
    String yearIndex = "";
    // ignore: unnecessary_raw_strings
    if(!roll.startsWith(RegExp(r'[0-9]'))){
			
      yearIndex = "Others";
    }else{
      if(int.parse(roll) <= DateTime.now().year.remainder(1000)){
        yearIndex = "Y$roll";
      }else{
        yearIndex = "Others";
      }
    }
    return Student(
      username: map[_schema.username] == null ? "" : map[_schema.username] as String,
      name: map[_schema.name] == null ? "" : map[_schema.name] as String,
      rollNo: map[_schema.rollNo] == null ? "" : map[_schema.rollNo] as String,
      program: map[_schema.program] == null ? "" : map[_schema.program] as String,
      dept: map[_schema.dept] == null ? "" : map[_schema.dept] as String,
      hall: map[_schema.hall] == null ? "" : map[_schema.hall] as String,
      room: map[_schema.room] == null ? "" : map[_schema.room] as String,
      bloodGroup: map[_schema.bloodGroup] == null ? "" : map[_schema.bloodGroup] as String,
      gender: map[_schema.gender] == null ? "" : map[_schema.gender] as String,
      hometown: map[_schema.hometown] == null ? "" : map[_schema.hometown] as String,
      year: yearIndex,
    );
  }
	Map<String,dynamic> fromMaptoMap(Map<String,dynamic> jsonData){
    final String roll = (jsonData.containsKey('roll')?(jsonData['roll'] as String):'Others').substring(0,2);
    String yearIndex = "";
		roll.trim().removeAllSpaces;
			// print(roll);
		// if(roll == "20") log('$jsonData', name: 'STUdnet');
    if(!roll.startsWith(RegExp(r'[0-9]')) ){
      yearIndex = "Others";
    }else{
      if((int.tryParse(roll)??(DateTime.now().year.remainder(1000) +1))<=DateTime.now().year.remainder(1000)){
        yearIndex = "Y$roll";
      }else{
        yearIndex = "Others";
      }
    }
   return {'bloodGroup': jsonData.containsKey('blood_group')?jsonData['blood_group']:'',
      'dept': jsonData.containsKey('dept')?jsonData['dept']:'',
      'gender': jsonData.containsKey('gender')?jsonData['gender']:'',
      'hall': jsonData.containsKey('hall')?jsonData['hall']:'',
      'hometown': jsonData.containsKey('hometown')?jsonData['hometown']:'',
      'name': jsonData.containsKey('name')?jsonData['name']:'',
      'program': jsonData.containsKey('program')?jsonData['program']:'',
      'rollno': jsonData.containsKey('roll')?jsonData['roll']:'',
      'room': jsonData.containsKey('room')?jsonData['room']:'',
      'username': jsonData.containsKey('username')?jsonData['username']:'',
      'year': yearIndex
    };
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source) as Map<String,dynamic>);

  Student copyWith({
    String ?username,
    String ?name,
    String ?rollNo,
    String ?program,
    String ?dept,
    String ?hall,
    String ?room,
    String ?bloodGroup,
    String ?gender,
    String ?hometown,
    String ?year,
  }) {
    return Student(
      username: username ?? this.username,
      name: name ?? this.name,
      rollNo: rollNo ?? this.rollNo,
      program: program ?? this.program,
      dept: dept ?? this.dept,
      hall: hall ?? this.hall,
      room: room ?? this.room,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      gender: gender ?? this.gender,
      hometown: hometown ?? this.hometown,
      year: year ?? this.year,
    );
  }

	factory Student.defaultData(String id) {
		return Student(
			bloodGroup: '',
			dept: '',gender: '',hall: '',hometown: '',name: '',program: '',rollNo: '', room: '',username: id,year: 'Others'
		);
	}

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Student &&
      o.username == username &&
      o.name == name &&
      o.rollNo == rollNo &&
      o.program == program &&
      o.dept == dept &&
      o.hall == hall &&
      o.room == room &&
      o.bloodGroup == bloodGroup &&
      o.gender == gender &&
      o.hometown == hometown &&
      o.year == year;
  }

  @override
  int get hashCode {
    return username.hashCode ^
      name.hashCode ^
      rollNo.hashCode ^
      program.hashCode ^
      dept.hashCode ^
      hall.hashCode ^
      room.hashCode ^
      bloodGroup.hashCode ^
      gender.hashCode ^
      hometown.hashCode ^
      year.hashCode;
  }
}

extension SX on String {
	String get removeAllSpaces => replaceAll(' ', '');
}