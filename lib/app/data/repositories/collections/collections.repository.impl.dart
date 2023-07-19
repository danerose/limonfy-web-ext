import 'package:dartz/dartz.dart';

import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/data/db/collection/link.collection.dao.dart';
import 'package:limonfy/app/domain/entities/collection/links_collections_response.entity.dart';

import 'package:limonfy/app/domain/repositories/collections/collections.repository.dart';

import 'package:limonfy/app/data/datasources/local/interface/config/config.local.source.dart';
import 'package:limonfy/app/data/datasources/local/interface/collection/collections.local.source.dart';
import 'package:limonfy/app/data/datasources/remote/interface/collections/collections.remote.source.dart';

class CollectionsRepositoryImpl implements CollectionsRepository {
  final ConfigLocalSource configLocalSource;
  final CollectionsRemoteSource collectionsRemoteSource;
  final CollectionsLocalSource collectionsLocalSource;

  const CollectionsRepositoryImpl({
    required this.collectionsLocalSource,
    required this.collectionsRemoteSource,
    required this.configLocalSource,
  });

  @override
  Future<Either<CustomException, LinksCollsResponse>> getFeaturedColls({
    required bool refresh,
  }) async {
    try {
      final res = await collectionsRemoteSource.getFeaturedCollections();
      final listDao = res.linksCollections.map(
        (e) => LinkCollectionDao(
          id: e.id,
          userAccountId: e.userAccountId,
          name: e.name,
          indexOrder: e.indexOrder,
          indexEditable: e.indexEditable,
          imageUrl: e.imageUrl,
          description: e.description,
          password: e.password,
          editable: e.editable,
          private: e.private,
          updatedAt: e.updatedAt,
          createdAt: e.createdAt,
        ),
      );
      await collectionsLocalSource.setListFeatCollecLink(listDao.toList());
      return Right(res.toEntity());
    } on CustomException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CustomException.unknown(e: e, stack: s));
    }
  }
}
