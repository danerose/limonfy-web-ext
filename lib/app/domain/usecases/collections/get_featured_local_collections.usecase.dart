import 'package:limonfy/app/domain/repositories/collections/collections.repository.dart';
import 'package:limonfy/app/domain/entities/collection/links_collections_response.entity.dart';

class GetLocalFeatureCollectionUsecase {
  final CollectionsRepository collectionsRepository;

  GetLocalFeatureCollectionUsecase({required this.collectionsRepository});

  Future<LinksCollsResponse> execute() async {
    return await collectionsRepository.getLocalFeaturedCollection();
  }
}
