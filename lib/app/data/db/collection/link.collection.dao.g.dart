// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link.collection.dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LinkCollectionDaoAdapter extends TypeAdapter<LinkCollectionDao> {
  @override
  final int typeId = 2;

  @override
  LinkCollectionDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LinkCollectionDao(
      id: fields[0] as String,
      userAccountId: fields[1] as String,
      name: fields[2] as String,
      indexOrder: fields[3] as int,
      indexEditable: fields[4] as bool,
      imageUrl: fields[5] as String,
      description: fields[6] as String,
      password: fields[7] as String,
      editable: fields[8] as bool,
      private: fields[9] as bool,
      updatedAt: fields[10] as String,
      createdAt: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LinkCollectionDao obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userAccountId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.indexOrder)
      ..writeByte(4)
      ..write(obj.indexEditable)
      ..writeByte(5)
      ..write(obj.imageUrl)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.password)
      ..writeByte(8)
      ..write(obj.editable)
      ..writeByte(9)
      ..write(obj.private)
      ..writeByte(10)
      ..write(obj.updatedAt)
      ..writeByte(11)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LinkCollectionDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
