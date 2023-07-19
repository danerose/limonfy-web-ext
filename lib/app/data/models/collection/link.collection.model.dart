import 'package:equatable/equatable.dart';
import 'package:limonfy/core/utils/validators.util.dart';
import 'package:limonfy/app/domain/entities/collection/link.collection.entity.dart';

class LinkCollectionModel extends Equatable {
  final String id;
  final String userAccountId;
  final String name;
  final int indexOrder;
  final bool indexEditable;
  final String imageUrl;
  final String description;
  final String password;
  final bool editable;
  final bool private;
  final String updatedAt;
  final String createdAt;

  const LinkCollectionModel({
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

  factory LinkCollectionModel.fromJson(Map<String, dynamic>? json) {
    return LinkCollectionModel(
      id: ValidatorUtils.containsKey(json, '_id', ''),
      userAccountId: ValidatorUtils.containsKey(
        json,
        'user_account_id',
        '',
      ),
      name: ValidatorUtils.containsKey(json, 'name', ''),
      indexOrder: ValidatorUtils.containsKey(json, 'index_order', 0),
      indexEditable: ValidatorUtils.containsKey<bool>(
        json,
        'index_editable',
        false,
      ),
      imageUrl: ValidatorUtils.containsKey(json, 'image_url', ''),
      description: ValidatorUtils.containsKey(json, 'description', ''),
      password: ValidatorUtils.containsKey(json, 'password', ''),
      editable: ValidatorUtils.containsKey<bool>(json, 'editable', false),
      private: ValidatorUtils.containsKey<bool>(json, 'private', false),
      updatedAt: ValidatorUtils.containsKey(json, 'updated_at', ''),
      createdAt: ValidatorUtils.containsKey(json, 'created_at', ''),
    );
  }

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

  @override
  List<Object?> get props => [
        id,
        userAccountId,
        name,
        indexOrder,
        indexEditable,
        imageUrl,
        description,
        password,
        editable,
        private,
        updatedAt,
        createdAt,
      ];
}
