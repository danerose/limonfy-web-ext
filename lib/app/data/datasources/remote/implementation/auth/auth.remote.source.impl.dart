import 'package:limonfy/core/constants/limonfy_endpoints.constants.dart';

import 'package:limonfy/app/data/models/auth/auth_response.model.dart';
import 'package:limonfy/app/data/models/verify/verify_response.model.dart';

import 'package:limonfy/core/services/network/network.service.dart';
import 'package:limonfy/app/data/datasources/remote/interface/auth/auth.remote.source.dart';

class AuthRemoteSourceImpl implements AuthRemoteSource {
  final HttpService dio;
  const AuthRemoteSourceImpl({
    required this.dio,
  });

  @override
  Future<AuthResponseModel> login({required String email}) async {
    try {
      final response = await dio.post(
        LimonfyEndpointConstants.localLogin,
        body: {
          'email': email,
        },
      );
      return AuthResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<VerifyResponseModel> verifyOtp({
    required String token,
    required String otpCode,
  }) async {
    try {
      final response = await dio.patch(
        LimonfyEndpointConstants.verifyOtp,
        body: {'token': token, 'otp_code': otpCode},
      );
      return VerifyResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<VerifyResponseModel> verifySendOther({
    required String token,
    required String channel,
  }) async {
    try {
      final response = await dio.post(
        LimonfyEndpointConstants.verifySendOther,
        body: {'token': token, 'channel': channel},
      );
      return VerifyResponseModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
