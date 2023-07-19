import 'package:dartz/dartz.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';
import 'package:limonfy/app/domain/entities/user/user_profile_response.entity.dart';

abstract class UserProfileRepository {
  Future<Either<CustomException, UserProfileResponse>> getUserProfile({
    required bool refresh,
  });
}
