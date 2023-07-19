import 'package:limonfy/app/data/models/link/link_response.model.dart';

abstract class LinksRemoteSource {
  Future<LinkResponseModel> getMetaTagsFromLink({required String url});

  Future<LinkResponseModel> createLimonfyAppLink({
    required String link,
    required String title,
    required String description,
    required String sourceName,
    required String sourceImageUrl,
    required String imageUrl,
    required bool private,
    required String userAccountId,
    required String linkCollectionId,
  });
}
