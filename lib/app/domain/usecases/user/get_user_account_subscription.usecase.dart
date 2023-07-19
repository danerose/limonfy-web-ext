import 'package:dartz/dartz.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';
import 'package:limonfy/app/domain/entities/subscription/subscription_response.entity.dart';
import 'package:limonfy/app/domain/repositories/users/user_account.repository.dart';

class GetUserAccountSubscriptionUsecase {
  final UserAccountRepository userAccountRepository;

  GetUserAccountSubscriptionUsecase({required this.userAccountRepository});

  Future<Either<CustomException, SubscriptionResponse>> execute({
    required bool refresh,
  }) async {
    return await userAccountRepository.getUserSubscription(refresh: refresh);
  }
}
