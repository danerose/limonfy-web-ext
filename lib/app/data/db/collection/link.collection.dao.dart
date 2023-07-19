import 'package:hive_flutter/hive_flutter.dart';
import 'package:limonfy/app/domain/entities/collection/link.collection.entity.dart';

part 'link.collection.dao.g.dart';

@HiveType(typeId: 2)
class LinkCollectionDao extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String userAccountId;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final int indexOrder;
  @HiveField(4)
  final bool indexEditable;
  @HiveField(5)
  final String imageUrl;
  @HiveField(6)
  final String description;
  @HiveField(7)
  final String password;
  @HiveField(8)
  final bool editable;
  @HiveField(9)
  final bool private;
  @HiveField(10)
  final String updatedAt;
  @HiveField(11)
  final String createdAt;

  LinkCollectionDao({
    required this.id,
    required this.userAccountId,
    required this.name,
    required this.indexOrder,
    required this.indexEditable,
    required this.imageUrl,
    required this.description,
    required this.password,
    required this.editable,
    required this.private,
    required this.updatedAt,
    required this.createdAt,
  });

  LinkCollection toEntity() {
    return LinkCollection(
      id: id,
      userAccountId: userAccountId,
      name: name,
      indexOrder: indexOrder,
      indexEditable: indexEditable,
      imageUrl: imageUrl,
      description: description,
      password: password,
      editable: editable,
      private: private,
      updatedAt: updatedAt,
      createdAt: createdAt,
    );
  }
}
