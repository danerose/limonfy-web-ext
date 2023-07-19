// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account.dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAccountDaoAdapter extends TypeAdapter<UserAccountDao> {
  @override
  final int typeId = 3;

  @override
  UserAccountDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserAccountDao(
      id: fields[0] as String,
      authenticationMethodId: fields[1] as String,
      userProfileId: fields[2] as String,
      userSettingsId: fields[3] as String,
      subscriptionId: fields[4] as String,
      customerStripeId: fields[5] as String,
      email: fields[6] as String,
      welcomed: fields[7] as bool,
      updatedAt: fields[8] as String,
      createdAt: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserAccountDao obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.authenticationMethodId)
      ..writeByte(2)
      ..write(obj.userProfileId)
      ..writeByte(3)
      ..write(obj.userSettingsId)
      ..writeByte(4)
      ..write(obj.subscriptionId)
      ..writeByte(5)
      ..write(obj.customerStripeId)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.welcomed)
      ..writeByte(8)
      ..write(obj.updatedAt)
      ..writeByte(9)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAccountDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
