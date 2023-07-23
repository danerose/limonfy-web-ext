import 'package:dartz/dartz.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/domain/entities/collection/links_collections_response.entity.dart';

abstract class CollectionsRepository {
  Future<LinksCollsResponse> getLocalFeaturedCollection();
  Future<Either<CustomException, LinksCollsResponse>> getFeaturedColls({
    required bool refresh,
  });
}
