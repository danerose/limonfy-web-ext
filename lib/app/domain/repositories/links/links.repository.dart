import 'package:dartz/dartz.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';
import 'package:limonfy/app/domain/entities/link/link_response.entity.dart';

abstract class LinksRepository {
  Future<Either<CustomException, LinkResponse>> getMetaTagsFromLink({
    required String url,
  });

  Future<Either<CustomException, LinkResponse>> createLimofyAppLink({
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
