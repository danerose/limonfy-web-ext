import 'package:dartz/dartz.dart';
import 'package:limonfy/app/data/db/user/user_account.dao.dart';
import 'package:limonfy/app/data/db/user/user_profile.dao.dart';

import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/domain/entities/auth/auth_response.entity.dart';
import 'package:limonfy/app/domain/entities/verify/verify_response.entity.dart';

import 'package:limonfy/app/domain/repositories/auth/auth.repository.dart';

import 'package:limonfy/app/data/datasources/local/interface/user/user.local.source.dart';
import 'package:limonfy/app/data/datasources/remote/interface/auth/auth.remote.source.dart';
import 'package:limonfy/app/data/datasources/local/interface/config/config.local.source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteSource authRemoteSource;
  final UserLocalSource userLocalSource;
  final ConfigLocalSource configLocalSource;

  AuthRepositoryImpl({
    required this.authRemoteSource,
    required this.userLocalSource,
    required this.configLocalSource,
  });

  @override
  Future<Either<CustomException, AuthReponse>> login({
    required String email,
  }) async {
    try {
      final response = await authRemoteSource.login(email: email);
      return Right(response.toEntity());
    } on CustomException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CustomException.unknown(e: e, stack: s));
    }
  }

  @override
  Future<Either<CustomException, VerifyResponse>> verifyOtp({
    required String token,
    required String otpCode,
  }) async {
    try {
      final response = await authRemoteSource.verifyOtp(
        token: token,
        otpCode: otpCode,
      );
      final verify = response.toEntity();
      await configLocalSource.setTokenLocalConfig(verify.token);
      await userLocalSource.setLocalUserProfile(
        UserProfileDao(
          id: verify.profile.id,
          userName: verify.profile.userName,
          displayName: verify.profile.displayName,
          profileImage: verify.profile.profileImage,
          phoneCode: verify.profile.phoneCode,
          phoneNumber: verify.profile.phoneNumber,
        ),
      );
      await userLocalSource.setLocalUserAccount(UserAccountDao(
        id: verify.account.id,
        authenticationMethodId: verify.account.authenticationMethodId,
        userProfileId: verify.account.userProfileId,
        userSettingsId: verify.account.userSettingsId,
        subscriptionId: verify.account.subscriptionId,
        customerStripeId: verify.account.customerStripeId,
        email: verify.account.email,
        welcomed: verify.account.welcomed,
        updatedAt: verify.account.updatedAt,
        createdAt: verify.account.createdAt,
      ));
      return Right(verify);
    } on CustomException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CustomException.unknown(e: e, stack: s));
    }
  }

  @override
  Future<Either<CustomException, VerifyResponse>> verifySendOther({
    required String token,
    required String channel,
  }) async {
    try {
      final response = await authRemoteSource.verifySendOther(
        token: token,
        channel: channel,
      );
      return Right(response.toEntity());
    } on CustomException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CustomException.unknown(e: e, stack: s));
    }
  }
}
