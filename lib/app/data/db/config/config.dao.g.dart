// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigDaoAdapter extends TypeAdapter<ConfigDao> {
  @override
  final int typeId = 0;

  @override
  ConfigDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConfigDao(
      token: fields[0] as String,
      mode: fields[1] as String,
      languageCode: fields[2] as String,
      countryCode: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ConfigDao obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.mode)
      ..writeByte(2)
      ..write(obj.languageCode)
      ..writeByte(3)
      ..write(obj.countryCode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
