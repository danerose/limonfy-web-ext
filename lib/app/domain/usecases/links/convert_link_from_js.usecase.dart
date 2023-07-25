import 'package:limonfy/app/domain/entities/link/link.entity.dart';

import 'package:limonfy/app/domain/repositories/links/links.repository.dart';

class ConvertLinkFromJsUsecase {
  final LinksRepository linksRepository;

  ConvertLinkFromJsUsecase({required this.linksRepository});

  Future<Link> execute({
    required String link,
  }) async {
    return await linksRepository.convertFromScrip(link: link);
  }
}
