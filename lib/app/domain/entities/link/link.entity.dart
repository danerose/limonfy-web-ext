import 'package:equatable/equatable.dart';

class Link extends Equatable {
  final String id;
  final String link;
  final String title;
  final String description;
  final String sourceName;
  final String sourceImageUrl;
  final String imageUrl;
  final bool private;
  final String linkSaveMethodId;
  final String userAccountId;
  final String updatedAt;
  final String createdAt;

  const Link({
    required this.id,
    required this.link,
    required this.title,
    required this.description,
    required this.sourceName,
    required this.sourceImageUrl,
    required this.imageUrl,
    required this.private,
    required this.linkSaveMethodId,
    required this.userAccountId,
    required this.updatedAt,
    required this.createdAt,
  });

  const Link.empty()
      : id = '',
        link = '',
        title = '',
        description = '',
        sourceName = '',
        sourceImageUrl = '',
        imageUrl = '',
        private = false,
        linkSaveMethodId = '',
        userAccountId = '',
        updatedAt = '',
        createdAt = '';

  @override
  List<Object?> get props => [
        id,
        link,
        title,
        description,
        sourceName,
        sourceImageUrl,
        imageUrl,
        private,
        linkSaveMethodId,
        userAccountId,
        updatedAt,
        createdAt,
      ];
}
