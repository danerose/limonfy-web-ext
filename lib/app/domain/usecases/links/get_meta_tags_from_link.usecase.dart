import 'package:dartz/dartz.dart';

import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/domain/entities/link/link_response.entity.dart';
import 'package:limonfy/app/domain/repositories/links/links.repository.dart';

class GetMetaTagsFromLinkUsecase {
  final LinksRepository linksRepository;

  GetMetaTagsFromLinkUsecase({required this.linksRepository});

  Future<Either<CustomException, LinkResponse>> execute({
    required String url,
  }) async {
    return await linksRepository.getMetaTagsFromLink(url: url);
  }
}
