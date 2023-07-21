import 'package:dartz/dartz.dart';

import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/domain/repositories/links/links.repository.dart';
import 'package:limonfy/app/domain/entities/link/link_response.entity.dart';

class CreateLimonfyAppLinkUsecase {
  final LinksRepository linksRepository;

  CreateLimonfyAppLinkUsecase({required this.linksRepository});

  Future<Either<CustomException, LinkResponse>> execute({
    required String link,
    required String title,
    required String description,
    required String sourceName,
    required String sourceImageUrl,
    required String imageUrl,
    required bool private,
    required String linkCollectionId,
  }) async {
    return await linksRepository.createLimofyAppLink(
      link: link,
      title: title,
      description: description,
      sourceName: sourceName,
      sourceImageUrl: sourceImageUrl,
      imageUrl: imageUrl,
      private: private,
      linkCollectionId: linkCollectionId,
    );
  }
}
