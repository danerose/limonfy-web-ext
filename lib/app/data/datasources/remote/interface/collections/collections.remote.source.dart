import 'package:limonfy/app/data/models/collection/links_collections.response.model.dart';

abstract class CollectionsRemoteSource {
  Future<LinksCollsResponseModel> getFeaturedCollections();
}
