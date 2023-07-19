import 'package:limonfy/app/data/models/auth/auth_response.model.dart';
import 'package:limonfy/app/data/models/verify/verify_response.model.dart';

abstract class AuthRemoteSource {
  Future<AuthResponseModel> login({required String email});

  Future<VerifyResponseModel> verifyOtp({
    required String token,
    required String otpCode,
  });

  Future<VerifyResponseModel> verifySendOther({
    required String token,
    required String channel,
  });
}
