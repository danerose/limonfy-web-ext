import 'package:limonfy/app/data/db/subcription/subscription.dao.dart';

abstract class SubscriptionLocalSource {
  Future<void> deleteLocalSubscription();
  Future<void> setLocalSubscription(SubscriptionDao subscription);
  Future<SubscriptionDao> getLocalSubscription();
}
