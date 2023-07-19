import 'package:dio/dio.dart';

import 'package:limonfy/core/utils/lang.util.dart';
import 'package:limonfy/core/constants/box.constants.dart';
import 'package:limonfy/core/constants/limonfy_endpoints.constants.dart';

import 'package:limonfy/core/services/db/hive.service.dart';
import 'package:limonfy/core/services/network/network.service.dart';

import 'package:limonfy/app/data/db/config/config.dao.dart';
import 'package:limonfy/app/data/models/collection/links_collections.response.model.dart';

import 'package:limonfy/app/data/datasources/remote/interface/collections/collections.remote.source.dart';

class CollectionRemoteSourceImpl implements CollectionsRemoteSource {
  final HttpService dio;
  final HiveService hive;
  const CollectionRemoteSourceImpl({
    required this.dio,
    required this.hive,
  });

  @override
  Future<LinksCollsResponseModel> getFeaturedCollections() async {
    try {
      final config = await hive.getBox<ConfigDao>(BoxConstants.config);
      final response = await dio.get(
        LimonfyEndpointConstants.featuredCollec,
        options: config?.token == null
            ? null
            : Options(
                headers: {
                  "Authorization": "Bearer ${config?.token}",
                  'Accept-Language': LangUtils.toLang(
                    config?.languageCode,
                    config?.countryCode,
                  )
                },
              ),
      );
      return LinksCollsResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
