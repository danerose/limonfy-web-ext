import 'package:limonfy/app/data/db/collection/link.collection.dao.dart';

abstract class CollectionsLocalSource {
  Future<void> setListFeatCollecLink(List<LinkCollectionDao> list);
  Future<void> deleteListFeatCollecLink();
  Future<List<LinkCollectionDao>> getListFeatCollecLink();
}
