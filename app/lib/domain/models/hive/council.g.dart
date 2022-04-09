// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'council.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CouncilAdapter extends TypeAdapter<Council> {
  @override
  final int typeId = 3;

  @override
  Council read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Council(
      level3: (fields[1] as List).cast<String>(),
      coordOfCouncil: (fields[2] as List).cast<String>(),
      subCouncil: (fields[0] as Map).cast<String, SubCouncil>(),
    );
  }

  @override
  void write(BinaryWriter writer, Council obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.subCouncil)
      ..writeByte(1)
      ..write(obj.level3)
      ..writeByte(2)
      ..write(obj.coordOfCouncil);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CouncilAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubCouncilAdapter extends TypeAdapter<SubCouncil> {
  @override
  final int typeId = 4;

  @override
  SubCouncil read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubCouncil(
      councilName: fields[0] as String,
      level2: (fields[1] as List).cast<String>(),
      entity: (fields[2] as List).cast<Entity>(),
      misc: (fields[3] as List).cast<String>(),
      coordiOfInCouncil: (fields[4] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, SubCouncil obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.councilName)
      ..writeByte(1)
      ..write(obj.level2)
      ..writeByte(2)
      ..write(obj.entity)
      ..writeByte(3)
      ..write(obj.misc)
      ..writeByte(4)
      ..write(obj.coordiOfInCouncil);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubCouncilAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class EntityAdapter extends TypeAdapter<Entity> {
  @override
  final int typeId = 5;

  @override
  Entity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Entity(
      fields[0] as String,
      isSelected: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Entity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj._entity)
      ..writeByte(1)
      ..write(obj.isSelected);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
