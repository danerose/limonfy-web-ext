import 'package:dio/dio.dart';

import 'package:limonfy/core/utils/lang.util.dart';
import 'package:limonfy/core/constants/box.constants.dart';
import 'package:limonfy/core/constants/limonfy_endpoints.constants.dart';

import 'package:limonfy/core/services/db/hive.service.dart';
import 'package:limonfy/core/services/network/network.service.dart';

import 'package:limonfy/app/data/models/user/user_account_response.model.dart';
import 'package:limonfy/app/data/models/subscription/subscription_response.model.dart';
import 'package:limonfy/app/data/datasources/remote/interface/user/user_account.source.dart';

import 'package:limonfy/app/data/db/config/config.dao.dart';

class UserAccountServiveImpl implements UserAccountRemoteSource {
  final HttpService dio;
  final HiveService hive;

  const UserAccountServiveImpl({
    required this.dio,
    required this.hive,
  });

  @override
  Future<UserAccountResponseModel> getUserAccount() async {
    try {
      final config = await hive.getBox<ConfigDao>(BoxConstants.config);
      final response = await dio.get(
        LimonfyEndpointConstants.userAccount,
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
      return UserAccountResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<SubscriptionResponseModel> getUserAccountSubscription() async {
    try {
      final config = await hive.getBox<ConfigDao>(BoxConstants.config);
      final response = await dio.get(
        LimonfyEndpointConstants.userAccountSubscription,
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
      return SubscriptionResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
