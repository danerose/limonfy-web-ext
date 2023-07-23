import 'package:dartz/dartz.dart';

import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/domain/repositories/links/links.repository.dart';

class VerifyExistLinkUsecase {
  final LinksRepository linksRepository;

  VerifyExistLinkUsecase({required this.linksRepository});

  Future<Either<CustomException, bool>> execute({
    required String link,
  }) async {
    return await linksRepository.verifyExist(link: link);
  }
}
