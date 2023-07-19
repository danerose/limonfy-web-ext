import 'package:equatable/equatable.dart';

import 'package:limonfy/app/domain/entities/collection/link.collection.entity.dart';

class LinksCollsResponse extends Equatable {
  final int status;
  final int page;
  final int limit;
  final int pages;
  final List<LinkCollection> linksCollections;
  final String message;

  const LinksCollsResponse({
    required this.status,
    required this.page,
    required this.limit,
    required this.pages,
    required this.linksCollections,
    required this.message,
  });

  const LinksCollsResponse.empty()
      : status = 0,
        page = 0,
        limit = 0,
        pages = 0,
        linksCollections = const [],
        message = '';

  @override
  List<Object?> get props => [
        status,
        page,
        limit,
        pages,
        linksCollections,
        message,
      ];
}
