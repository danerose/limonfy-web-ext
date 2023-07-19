import 'package:equatable/equatable.dart';

class LinkCollection extends Equatable {
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

  const LinkCollection({
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

  const LinkCollection.empty()
      : id = '',
        userAccountId = '',
        name = '',
        indexOrder = 0,
        indexEditable = false,
        imageUrl = '',
        description = '',
        password = '',
        editable = false,
        private = false,
        updatedAt = '',
        createdAt = '';

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
