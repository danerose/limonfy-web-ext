import 'package:equatable/equatable.dart';
import 'package:limonfy/core/utils/validators.util.dart';
import 'package:limonfy/app/data/models/collection/link.collection.model.dart';

import 'package:limonfy/app/domain/entities/collection/link.collection.entity.dart';
import 'package:limonfy/app/domain/entities/collection/links_collections_response.entity.dart';

class LinksCollsResponseModel extends Equatable {
  final int status;
  final int page;
  final int limit;
  final int pages;
  final List<LinkCollectionModel> linksCollections;
  final String message;

  const LinksCollsResponseModel({
    required this.status,
    required this.page,
    required this.limit,
    required this.pages,
    required this.linksCollections,
    required this.message,
  });

  factory LinksCollsResponseModel.fromJson(Map<String, dynamic>? json) {
    return LinksCollsResponseModel(
      status: ValidatorUtils.containsKey<int>(json, 'status', 0),
      page: ValidatorUtils.containsKey<int>(json, 'page', 0),
      limit: ValidatorUtils.containsKey<int>(json, 'limit', 0),
      pages: ValidatorUtils.containsKey<int>(json, 'pages', 0),
      linksCollections: List<LinkCollectionModel>.from(
        ValidatorUtils.containsKey(json, 'collections', []).map(
          (e) => LinkCollectionModel.fromJson(e),
        ),
      ),
      message: ValidatorUtils.containsKey(json, 'message', ''),
    );
  }

  LinksCollsResponse toEntity() {
    return LinksCollsResponse(
      status: status,
      page: page,
      limit: limit,
      pages: pages,
      linksCollections: List<LinkCollection>.from(
        linksCollections.map((e) => e.toEntity()),
      ),
      message: message,
    );
  }

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
