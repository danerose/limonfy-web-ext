// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserProfileDaoAdapter extends TypeAdapter<UserProfileDao> {
  @override
  final int typeId = 4;

  @override
  UserProfileDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProfileDao(
      id: fields[0] as String,
      userName: fields[1] as String,
      displayName: fields[2] as String,
      profileImage: fields[3] as String,
      phoneCode: fields[4] as String,
      phoneNumber: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserProfileDao obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.displayName)
      ..writeByte(3)
      ..write(obj.profileImage)
      ..writeByte(4)
      ..write(obj.phoneCode)
      ..writeByte(5)
      ..write(obj.phoneNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfileDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
