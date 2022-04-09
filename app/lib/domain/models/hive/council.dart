import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:life_at_iitk/infrastructure/api/defaultValues.dart';

part 'council.g.dart';

@HiveType(typeId: 3)
class Council {
  @HiveField(0)
  final Map<String,SubCouncil> subCouncil;
  @HiveField(1)
  final List<String> level3;
  @HiveField(2)
  final List<String> coordOfCouncil;

  const Council({
		this.level3 = const [], 
		this.coordOfCouncil = const [], 
		required this.subCouncil
	});

  Map<String, dynamic> toMap() {
    return {
      'subCouncil': subCouncil,
      'level3': level3,
      'coordOfCouncil': coordOfCouncil,
    };
  }

  factory Council.fromMap(Map<String, dynamic>? map) {
    map ??= COUNCILDATA;
  
    return Council(
      subCouncil: Map.fromIterables(
				map["councils"]?.cast<String>() as List<String>,
				(map["councils"]?.cast<String>()  as List<String>)
				.map((council) => SubCouncil.fromMap(
					map![council] as Map<String,dynamic>, council
					))),
			// Map<String,SubCouncil>.from(map['subCouncil'] as Map<dynamic, dynamic>),
      level3: List<String>.from(map['level3'] as List),
    );
  }

  // String toJson() => json.encode(toMap());

  factory Council.fromJson(String source) => Council.fromMap(json.decode(source) as Map<String, dynamic>);

  Council copyWith({
    Map<String,SubCouncil>? subCouncil,
    List<String>? level3,
    List<String>? coordOfCouncil,
  }) {
    return Council(
      subCouncil: subCouncil ?? this.subCouncil,
      level3: level3 ?? this.level3,
      coordOfCouncil: coordOfCouncil ?? this.coordOfCouncil,
    );
  }
}

@HiveType(typeId: 4)
class SubCouncil {
  @HiveField(0)
  final String councilName;
  @HiveField(1)
  final List<String> level2;
  @HiveField(2)
  final List<Entity> entity;
  @HiveField(3)
  final List<String> misc;
  @HiveField(4)
  final List<String> coordiOfInCouncil;
	
  const SubCouncil({
			required this.councilName,
      this.level2 = const [],
      required this.entity,
      required this.misc,
      this.coordiOfInCouncil = const []});

  // Map<String, dynamic> toMap() {
  //   return {
  //     'councilName': councilName,
  //     'level2': level2,
  //     'entity': entity?.map((x) => x?.toMap())?.toList(),
  //     'misc': misc?.toList(),
  //     'coordiOfInCouncil': coordiOfInCouncil?.toList(),
  //   };
  // }
/*
{
	snt, mnc, gns,anc,psg,senate
}
 */
  factory SubCouncil.fromMap(Map<String, dynamic>? map, String _councilName) {
    if (map == null) return const SubCouncil(entity: [], misc: [], councilName: '');
  
    return SubCouncil(
      councilName: _councilName,
      level2: List<String>.from(map['level2'] as List),
      entity: List<Entity>.from((map['entity'] as List).map((x) => Entity(x.toString()))),
      misc: List<String>.from(map['misc'] as List),
			coordiOfInCouncil: []
    );
  }

  // String toJson() => json.encode(toMap());

  // factory SubCouncil.fromJson(String source) => SubCouncil.fromMap(json.decode(source) as Map<String,dynamic>);

  SubCouncil copyWith({
    String? councilName,
    List<String>? level2,
    List<Entity>? entity,
    List<String>? misc,
    List<String>? coordiOfInCouncil,
  }) {
    return SubCouncil(
      councilName: councilName ?? this.councilName,
      level2: level2 ?? this.level2,
      entity: entity ?? this.entity,
      misc: misc ?? this.misc,
      coordiOfInCouncil: coordiOfInCouncil ?? this.coordiOfInCouncil,
    );
  }
}

@HiveType(typeId: 5)
class Entity {
	@HiveField(0)
	final String _entity;
	@HiveField(1)
	bool isSelected;

  Entity(
		this._entity,{ this.isSelected = true});



  @override
  String toString() => _entity;

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Entity &&
      o._entity == _entity &&
      o.isSelected == isSelected;
  }

  @override
  int get hashCode => _entity.hashCode ^ isSelected.hashCode;

  Entity copyWith({
    String? entity,
    bool ?isSelected,
  }) {
    return Entity(
      entity ?? _entity,
    	isSelected : isSelected ?? this.isSelected,
    );
  }
}

extension SetX<Entity> on Set<Entity> {
	Set<String> get entities  => 
		 map((Entity e) => e.toString()).toSet().cast<String>();

}

