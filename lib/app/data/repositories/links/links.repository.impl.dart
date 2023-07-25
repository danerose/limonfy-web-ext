import 'package:dartz/dartz.dart';
import 'package:limonfy/app/domain/entities/link/link.entity.dart';

import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/domain/entities/link/link_response.entity.dart';

import 'package:limonfy/app/domain/repositories/links/links.repository.dart';
import 'package:limonfy/app/data/datasources/local/interface/links/links.local.source.dart';
import 'package:limonfy/app/data/datasources/remote/interface/links/links.remote.source.dart';

class LinksRepositoryImpl implements LinksRepository {
  final LinksLocalSource linksLocalSource;
  final LinksRemoteSource linksRemoteSource;

  const LinksRepositoryImpl({
    required this.linksLocalSource,
    required this.linksRemoteSource,
  });

  @override
  Future<Either<CustomException, LinkResponse>> getMetaTagsFromLink({
    required String url,
  }) async {
    try {
      final res = await linksRemoteSource.getMetaTagsFromLink(url: url);
      return Right(res.toEntity());
    } on CustomException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CustomException.unknown(e: e, stack: s));
    }
  }

  @override
  Future<Either<CustomException, LinkResponse>> createLimofyAppLink({
    required String link,
    required String title,
    required String description,
    required String sourceName,
    required String sourceImageUrl,
    required String imageUrl,
    required bool private,
    required String linkCollectionId,
  }) async {
    try {
      final res = await linksRemoteSource.createLimonfyAppLink(
        link: link,
        title: title,
        description: description,
        sourceName: sourceName,
        sourceImageUrl: sourceImageUrl,
        imageUrl: imageUrl,
        private: private,
        linkCollectionId: linkCollectionId,
      );
      return Right(res.toEntity());
    } on CustomException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CustomException.unknown(e: e, stack: s));
    }
  }

  @override
  Future<Either<CustomException, bool>> verifyExist({
    required String link,
  }) async {
    try {
      final res = await linksRemoteSource.verifyExist(link: link);
      return Right(res);
    } on CustomException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CustomException.unknown(e: e, stack: s));
    }
  }

  @override
  Future<Link> convertFromScrip({
    required String link,
  }) async {
    try {
      final res = await linksLocalSource.convertFromScript(link: link);
      return res.toEntity();
    } on CustomException catch (_) {
      return const Link.empty();
    } catch (e) {
      return const Link.empty();
    }
  }
}
