import 'package:dartz/dartz.dart';
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
      final res = await userProfileRemoteSource.getUserProfile();
      return Right(res.toEntity());
    } on CustomException catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(CustomException.unknown(e: e, stack: s));
    }
  }
}
