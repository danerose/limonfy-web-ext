import 'package:dartz/dartz.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';
import 'package:limonfy/app/domain/entities/user/user_profile_response.entity.dart';
import 'package:limonfy/app/domain/repositories/users/user_profile.repository.dart';

class GetUserProfileUsecase {
  final UserProfileRepository userRepository;

  GetUserProfileUsecase({required this.userRepository});

  Future<Either<CustomException, UserProfileResponse>> execute({
    required bool refresh,
  }) async {
    return await userRepository.getUserProfile(refresh: refresh);
  }
}
