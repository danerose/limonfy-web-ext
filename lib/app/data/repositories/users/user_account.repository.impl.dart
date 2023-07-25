import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/data/db/user/user_account.dao.dart';
import 'package:limonfy/app/data/db/subcription/subscription.dao.dart';

import 'package:limonfy/app/domain/entities/user/user_account_response.entity.dart';
import 'package:limonfy/app/domain/entities/subscription/subscription_item.entity.dart';
import 'package:limonfy/app/domain/entities/subscription/subscription_response.entity.dart';

import 'package:limonfy/app/domain/repositories/users/user_account.repository.dart';

import 'package:limonfy/app/data/datasources/local/interface/user/user.local.source.dart';
import 'package:limonfy/app/data/datasources/remote/interface/user/user_account.source.dart';
import 'package:limonfy/app/data/datasources/local/interface/subscription/subscription.local.source.dart';

class UserAccountRepositoryImpl implements UserAccountRepository {
  final UserLocalSource userLocalSource;
  final UserAccountRemoteSource userAccountRemoteSource;
  final SubscriptionLocalSource subscriptionLocalSource;

  const UserAccountRepositoryImpl({
    required this.userLocalSource,
    required this.userAccountRemoteSource,
    required this.subscriptionLocalSource,
  });

  @override
  Future<Either<CustomException, SubscriptionResponse>> getUserSubscription({
    required bool refresh,
  }) async {
    try {
      if (refresh) {
        final res = await userAccountRemoteSource.getUserAccountSubscription();
        log('resss $res');
        await subscriptionLocalSource.setLocalSubscription(SubscriptionDao(
          id: res.subscription.id,
          subscriptionItemId: res.subscription.subscriptionItemId,
          premium: res.subscription.premium,
          expireAt: res.subscription.expireAt,
          updatedAt: res.subscription.updatedAt,
          createdAt: res.subscription.createdAt,
        ));
        return Right(res.toEntity());
      } else {
        final l = await subscriptionLocalSource.getLocalSubscription();
        if (l.id.isEmpty) {
          final r = await userAccountRemoteSource.getUserAccountSubscription();
          await subscriptionLocalSource.setLocalSubscription(SubscriptionDao(
            id: r.subscription.id,
            subscriptionItemId: r.subscription.subscriptionItemId,
            premium: r.subscription.premium,
            expireAt: r.subscription.expireAt,
            updatedAt: r.subscription.updatedAt,
            createdAt: r.subscription.createdAt,
          ));
          return Right(r.toEntity());
        } else {
          return Right(SubscriptionResponse(
            status: 200,
            subscription: l.toEntity(),
            subscriptionItem: const SubscriptionItem.empty(),
            message: '',
          ));
        }
      }
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
      if (refresh) {
        final res = await userAccountRemoteSource.getUserAccount();
        await userLocalSource.setLocalUserAccount(UserAccountDao(
          id: res.account.id,
          authenticationMethodId: res.account.authenticationMethodId,
          userProfileId: res.account.userProfileId,
          userSettingsId: res.account.userSettingsId,
          subscriptionId: res.account.subscriptionId,
          customerStripeId: res.account.customerStripeId,
          email: res.account.email,
          welcomed: res.account.welcomed,
          updatedAt: res.account.updatedAt,
          createdAt: res.account.createdAt,
        ));
        return Right(res.toEntity());
      } else {
        final local = await userLocalSource.getLocalUserAccount();
        if (local.id.isEmpty) {
          final res = await userAccountRemoteSource.getUserAccount();
          await userLocalSource.setLocalUserAccount(UserAccountDao(
            id: res.account.id,
            authenticationMethodId: res.account.authenticationMethodId,
            userProfileId: res.account.userProfileId,
            userSettingsId: res.account.userSettingsId,
            subscriptionId: res.account.subscriptionId,
            customerStripeId: res.account.customerStripeId,
            email: res.account.email,
            welcomed: res.account.welcomed,
            updatedAt: res.account.updatedAt,
            createdAt: res.account.createdAt,
          ));
          return Right(res.toEntity());
        } else {
          return Right(UserAccountResponse(
            status: 200,
            account: local,
            message: '',
          ));
        }
      }
    } on CustomException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CustomException.unknown(e: e, stack: s));
    }
  }
}
