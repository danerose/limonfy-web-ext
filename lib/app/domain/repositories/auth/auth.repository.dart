import 'package:dartz/dartz.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/domain/entities/auth/auth_response.entity.dart';
import 'package:limonfy/app/domain/entities/verify/verify_response.entity.dart';

abstract class AuthRepository {
  Future<Either<CustomException, AuthReponse>> login({
    required String email,
  });

  Future<Either<CustomException, VerifyResponse>> verifyOtp({
    required String token,
    required String otpCode,
  });
  Future<Either<CustomException, VerifyResponse>> verifySendOther({
    required String token,
    required String channel,
  });
}
