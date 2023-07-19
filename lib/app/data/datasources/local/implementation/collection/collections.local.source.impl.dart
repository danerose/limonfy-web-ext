import 'package:limonfy/core/constants/box.constants.dart';
import 'package:limonfy/core/services/db/hive.service.dart';

import 'package:limonfy/app/data/db/collection/link.collection.dao.dart';
import 'package:limonfy/app/data/datasources/local/interface/collection/collections.local.source.dart';

class CollectionsLocalSourceImpl implements CollectionsLocalSource {
  final HiveService hive;
  const CollectionsLocalSourceImpl({required this.hive});

  @override
  Future<void> setListFeatCollecLink(List<LinkCollectionDao> list) async {
    await hive.putBox<List<LinkCollectionDao>>(
      BoxConstants.featuredLinksCollect,
      list,
    );
  }

  @override
  Future<List<LinkCollectionDao>> getListFeatCollecLink() async {
    final list = await hive.getBox<List<LinkCollectionDao>>(
      BoxConstants.featuredLinksCollect,
    );
    return list ?? [];
  }

  @override
  Future<void> deleteListFeatCollecLink() async {
    await hive.putBox<List<LinkCollectionDao>>(
      BoxConstants.featuredLinksCollect,
      [],
    );
  }
}
