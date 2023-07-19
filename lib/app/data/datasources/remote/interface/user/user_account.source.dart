import 'package:limonfy/app/data/models/subscription/subscription_response.model.dart';
import 'package:limonfy/app/data/models/user/user_account_response.model.dart';

abstract class UserAccountRemoteSource {
  Future<UserAccountResponseModel> getUserAccount();
  Future<SubscriptionResponseModel> getUserAccountSubscription();
}
