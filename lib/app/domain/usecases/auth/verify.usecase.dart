import 'package:dartz/dartz.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';
import 'package:limonfy/app/domain/entities/verify/verify_response.entity.dart';
import 'package:limonfy/app/domain/repositories/auth/auth.repository.dart';

class VerifyOtpAuthUsecase {
  final AuthRepository authRepository;

  VerifyOtpAuthUsecase({required this.authRepository});

  Future<Either<CustomException, VerifyResponse>> execute({
    required String token,
    required String otpCode,
  }) async {
    return await authRepository.verifyOtp(
      token: token,
      otpCode: otpCode,
    );
  }
}

class VerifySendOtherAuthUsecase {
  final AuthRepository authRepository;

  VerifySendOtherAuthUsecase({required this.authRepository});

  Future<Either<CustomException, VerifyResponse>> execute({
    required String token,
    required String channel,
  }) async {
    return await authRepository.verifySendOther(
      token: token,
      channel: channel,
    );
  }
}
