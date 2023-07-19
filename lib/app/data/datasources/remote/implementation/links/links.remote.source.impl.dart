import 'package:dio/dio.dart';
import 'package:html/parser.dart' as html;

import 'package:limonfy/core/utils/lang.util.dart';
import 'package:limonfy/core/constants/box.constants.dart';
import 'package:limonfy/core/constants/limonfy_endpoints.constants.dart';

import 'package:limonfy/app/data/db/config/config.dao.dart';
import 'package:limonfy/app/data/models/link/link.model.dart';
import 'package:limonfy/app/data/models/link/link_response.model.dart';

import 'package:limonfy/core/services/db/hive.service.dart';
import 'package:limonfy/core/services/network/network.service.dart';
import 'package:limonfy/app/data/datasources/remote/interface/links/links.remote.source.dart';

class LinksRemoteSourceImpl implements LinksRemoteSource {
  final HttpService dio;
  final HiveService hive;

  const LinksRemoteSourceImpl({
    required this.dio,
    required this.hive,
  });

  @override
  Future<LinkResponseModel> getMetaTagsFromLink({required String url}) async {
    try {
      final response = await dio.get(url);
      final document = html.parse(response.data);
      return LinkResponseModel(
        status: 200,
        link: LinkModel.fromMetaTags(
          url: url,
          head: document.head,
          metas: document.getElementsByTagName('meta'),
        ),
        message: '',
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<LinkResponseModel> createLimonfyAppLink({
    required String link,
    required String title,
    required String description,
    required String sourceName,
    required String sourceImageUrl,
    required String imageUrl,
    required bool private,
    required String userAccountId,
    required String linkCollectionId,
  }) async {
    try {
      final config = await hive.getBox<ConfigDao>(BoxConstants.config);
      final response = await dio.post(
        LimonfyEndpointConstants.createLimonfyApp,
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
        body: {
          "link": link,
          "title": title,
          "description": description,
          "image_url": imageUrl,
          "source_name": sourceName,
          "source_image_url": sourceImageUrl,
          "link_collection_id": linkCollectionId,
          "priv": private
        },
      );
      return LinkResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
