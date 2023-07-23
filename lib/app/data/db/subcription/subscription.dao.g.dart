// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubscriptionDaoAdapter extends TypeAdapter<SubscriptionDao> {
  @override
  final int typeId = 5;

  @override
  SubscriptionDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubscriptionDao(
      id: fields[0] as String,
      subscriptionItemId: fields[1] as String,
      premium: fields[2] as bool,
      expireAt: fields[3] as String,
      updatedAt: fields[4] as String,
      createdAt: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SubscriptionDao obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.subscriptionItemId)
      ..writeByte(2)
      ..write(obj.premium)
      ..writeByte(3)
      ..write(obj.expireAt)
      ..writeByte(4)
      ..write(obj.updatedAt)
      ..writeByte(5)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubscriptionDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
