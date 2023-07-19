import 'package:dartz/dartz.dart';
import 'package:limonfy/app/domain/entities/user/user_account_response.entity.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/domain/entities/subscription/subscription_response.entity.dart';

import 'package:limonfy/app/domain/repositories/users/user_account.repository.dart';
import 'package:limonfy/app/data/datasources/remote/interface/user/user_account.source.dart';

class UserAccountRepositoryImpl implements UserAccountRepository {
  final UserAccountRemoteSource userAccountRemoteSource;

  const UserAccountRepositoryImpl({
    required this.userAccountRemoteSource,
  });

  @override
  Future<Either<CustomException, SubscriptionResponse>> getUserSubscription({
    required bool refresh,
  }) async {
    try {
      final res = await userAccountRemoteSource.getUserAccountSubscription();
      return Right(res.toEntity());
    } on CustomException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CustomException.unknown(e: e, stack: s));
    }
  }

  @override
  Future<Either<CustomException, UserAccountResponse>> getUserAccount({
    required bool refresh,
  }) async {
    try {
      final res = await userAccountRemoteSource.getUserAccount();
      return Right(res.toEntity());
    } on CustomException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CustomException.unknown(e: e, stack: s));
    }
  }
}
