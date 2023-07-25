import 'package:limonfy/core/constants/box.constants.dart';
import 'package:limonfy/core/services/db/hive.service.dart';

import 'package:limonfy/app/data/db/user/user_profile.dao.dart';
import 'package:limonfy/app/data/db/user/user_account.dao.dart';

import 'package:limonfy/app/domain/entities/user/user_account.entity.dart';
import 'package:limonfy/app/domain/entities/user/user_profile.entity.dart';

import 'package:limonfy/app/data/datasources/local/interface/user/user.local.source.dart';

class UserLocalSourceImpl implements UserLocalSource {
  final HiveService hive;
  const UserLocalSourceImpl({required this.hive});

  @override
  Future<void> setLocalUserProfile(UserProfileDao profile) async {
    await hive.putBox<UserProfileDao>(BoxConstants.profile, profile);
  }

  @override
  Future<UserProfile> getLocalUserProfile() async {
    final profile = await hive.getBox<UserProfileDao>(BoxConstants.profile) ??
        UserProfileDao(
          id: '',
          userName: '',
          displayName: '',
          profileImage: '',
          phoneCode: '',
          phoneNumber: '',
        );
    return profile.toEntity();
  }

  @override
  Future<void> deleteLocalUserProfile() async {
    await hive.putBox<UserProfileDao>(
      BoxConstants.profile,
      UserProfileDao(
        id: '',
        userName: '',
        displayName: '',
        profileImage: '',
        phoneCode: '',
        phoneNumber: '',
      ),
    );
  }

  @override
  Future<void> deleteLocalUserAccount() async {
    await hive.putBox<UserAccountDao>(
      BoxConstants.account,
      UserAccountDao(
        id: '',
        authenticationMethodId: '',
        userProfileId: '',
        userSettingsId: '',
        subscriptionId: '',
        customerStripeId: '',
        email: '',
        welcomed: false,
        updatedAt: '',
        createdAt: '',
      ),
    );
  }

  @override
  Future<UserAccount> getLocalUserAccount() async {
    final account = await hive.getBox<UserAccountDao>(BoxConstants.account) ??
        UserAccountDao(
          id: '',
          authenticationMethodId: '',
          userProfileId: '',
          userSettingsId: '',
          subscriptionId: '',
          customerStripeId: '',
          email: '',
          welcomed: false,
          updatedAt: '',
          createdAt: '',
        );
    return account.toEntity();
  }

  @override
  Future<void> setLocalUserAccount(UserAccountDao account) async {
    await hive.putBox<UserAccountDao>(BoxConstants.account, account);
  }
}
