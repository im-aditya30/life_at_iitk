import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:life_at_iitk/domain/auth/auth_interface.dart';
import 'package:life_at_iitk/infrastructure/core/injectionable_module.dart';
import 'package:life_at_iitk/injection.dart';
import 'package:life_at_iitk/domain/auth/user.dart';

import '../../../presentation/core/extensions.dart';

part 'people.g.dart';
/// here id is dd userName
@HiveType(typeId: 2)
class People{
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final Map<String,List<String>> councils;
  @HiveField(2)
  final Map<String,dynamic> posts;

  const People({
		required this.id,this.councils = const {},this.posts = const {}});

  People copyWith({
    String? id,
    Map<String,List<String>>? councils,
    Map<String,dynamic>? posts,
  }) {
    return People(
      id: id ?? this.id,
      councils: councils ?? this.councils,
      posts: posts ?? this.posts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'councils': councils,
      'posts': posts,
    };
  }

  factory People.fromMap(Map<dynamic, dynamic>? map) {
    if (map == null) return const People(id: "");
  
    return People(
      id: map['id'] as String,
      councils: { for (var item in map['councils'] as List) item.toString() : map[item] != null ? (map[item] as List).cast<String>() : [] },
      posts: Map<String,dynamic>.from(map['posts'] as Map<dynamic,dynamic>),
    );
  }
	factory People.empty() => People(
      id: getIt<AuthInterface>().getCurrentUser().getOrCrash.id,
			councils: {},
			posts: {}

  );

  // String toJson() => json.encode(toMap());

  factory People.fromJson(String source) => People.fromMap(json.decode(source) as Map<dynamic, dynamic>);

	bool get isNULL => !(id?.isNotEmpty == true);
  factory People.fromData(String source){
		// print(source);
		final values = json.decode(source) as List;
		return People.fromMap(values.firstElement as Map);
	}
}
