import 'package:dartz/dartz.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/domain/entities/user/user_account_response.entity.dart';
import 'package:limonfy/app/domain/repositories/users/user_account.repository.dart';

class GetUserAccountUsecase {
  final UserAccountRepository userRepository;

  GetUserAccountUsecase({required this.userRepository});

  Future<Either<CustomException, UserAccountResponse>> execute({
    required bool refresh,
  }) async {
    return await userRepository.getUserAccount(refresh: refresh);
  }
}
