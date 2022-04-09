// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as String?,
      name: fields[1] as String,
      rollno: fields[2] as String,
      uid: fields[3] as String,
      prefs: (fields[4] as List).cast<String>(),
      admin: fields[5] as bool?,
      bookmark: (fields[7] as List).cast<String>(),
      reminder: (fields[6] as List).cast<String>(),
      isLevel2: fields[8] as bool,
      isLevel3: fields[9] as bool,
      profile: fields[10] as Uint8List,
			gender: fields[11] as String?
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.rollno)
      ..writeByte(3)
      ..write(obj.uid)
      ..writeByte(4)
      ..write(obj.prefs)
      ..writeByte(5)
      ..write(obj.admin)
      ..writeByte(6)
      ..write(obj.reminder)
      ..writeByte(7)
      ..write(obj.bookmark)
      ..writeByte(8)
      ..write(obj.isLevel2)
      ..writeByte(9)
      ..write(obj.isLevel3)
      ..writeByte(10)
      ..write(obj.profile)
			..writeByte(11)
			..write(obj.gender);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
