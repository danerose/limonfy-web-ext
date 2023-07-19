import 'package:dartz/dartz.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';
import 'package:limonfy/app/domain/repositories/collections/collections.repository.dart';

import 'package:limonfy/app/domain/entities/collection/links_collections_response.entity.dart';

class GetFeaturedCollectionUsecase {
  final CollectionsRepository collectionsRepository;

  GetFeaturedCollectionUsecase({required this.collectionsRepository});

  Future<Either<CustomException, LinksCollsResponse>> execute({
    required bool refresh,
  }) async {
    return await collectionsRepository.getFeaturedColls(refresh: refresh);
  }
}
