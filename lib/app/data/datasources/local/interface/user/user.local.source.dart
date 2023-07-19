import 'package:limonfy/app/data/db/user/user_account.dao.dart';
import 'package:limonfy/app/data/db/user/user_profile.dao.dart';
import 'package:limonfy/app/domain/entities/user/user_account.entity.dart';
import 'package:limonfy/app/domain/entities/user/user_profile.entity.dart';

abstract class UserLocalSource {
  Future<void> deleteLocalUserAccount();
  Future<void> setLocalUserAccount(UserAccountDao profile);
  Future<UserAccount> getLocalUserAccount();
  Future<void> deleteLocalUserProfile();
  Future<void> setLocalUserProfile(UserProfileDao profile);
  Future<UserProfile> getLocalUserProfile();
  // Future<>
}
