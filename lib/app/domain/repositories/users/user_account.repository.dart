import 'package:dartz/dartz.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';
import 'package:limonfy/app/domain/entities/user/user_account_response.entity.dart';
import 'package:limonfy/app/domain/entities/subscription/subscription_response.entity.dart';

abstract class UserAccountRepository {
  Future<Either<CustomException, UserAccountResponse>> getUserAccount({
    required bool refresh,
  });
  Future<Either<CustomException, SubscriptionResponse>> getUserSubscription({
    required bool refresh,
  });
}
