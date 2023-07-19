import 'package:dartz/dartz.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/domain/entities/auth/auth_response.entity.dart';

import 'package:limonfy/app/domain/repositories/auth/auth.repository.dart';

class LocalLogInUsecase {
  final AuthRepository authRepository;

  LocalLogInUsecase({required this.authRepository});

  Future<Either<CustomException, AuthReponse>> execute({
    required String email,
  }) async {
    return await authRepository.login(email: email);
  }
}
