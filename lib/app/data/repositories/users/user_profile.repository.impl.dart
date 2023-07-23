import 'package:dartz/dartz.dart';
import 'package:limonfy/app/data/db/user/user_profile.dao.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/domain/repositories/users/user_profile.repository.dart';
import 'package:limonfy/app/domain/entities/user/user_profile_response.entity.dart';

import 'package:limonfy/app/data/datasources/local/interface/user/user.local.source.dart';
import 'package:limonfy/app/data/datasources/remote/interface/user/user_profile.source.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteSource userProfileRemoteSource;
  final UserLocalSource userLocalSource;

  const UserProfileRepositoryImpl({
    required this.userProfileRemoteSource,
    required this.userLocalSource,
  });

  @override
  Future<Either<CustomException, UserProfileResponse>> getUserProfile({
    required bool refresh,
  }) async {
    try {
      if (refresh) {
        final res = await userProfileRemoteSource.getUserProfile();
        await userLocalSource.setLocalUserProfile(UserProfileDao(
          id: res.profile.id,
          userName: res.profile.userName,
          displayName: res.profile.displayName,
          profileImage: res.profile.profileImage,
          phoneCode: res.profile.phoneCode,
          phoneNumber: res.profile.phoneNumber,
        ));
        return Right(res.toEntity());
      } else {
        final local = await userLocalSource.getLocalUserProfile();
        if (local.id.isEmpty) {
          final res = await userProfileRemoteSource.getUserProfile();
          await userLocalSource.setLocalUserProfile(UserProfileDao(
            id: res.profile.id,
            userName: res.profile.userName,
            displayName: res.profile.displayName,
            profileImage: res.profile.profileImage,
            phoneCode: res.profile.phoneCode,
            phoneNumber: res.profile.phoneNumber,
          ));
          return Right(res.toEntity());
        } else {
          return Right(
            UserProfileResponse(status: 200, profile: local, message: ''),
          );
        }
      }
    } on CustomException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CustomException.unknown(e: e, stack: s));
    }
  }
}
