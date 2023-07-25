import 'package:limonfy/core/constants/box.constants.dart';
import 'package:limonfy/core/services/db/hive.service.dart';
import 'package:limonfy/app/data/db/subcription/subscription.dao.dart';
import 'package:limonfy/app/data/datasources/local/interface/subscription/subscription.local.source.dart';

class SubscriptionLocalSourceImpl implements SubscriptionLocalSource {
  final HiveService hive;
  const SubscriptionLocalSourceImpl({required this.hive});

  @override
  Future<void> deleteLocalSubscription() async {
    await hive.putBox<SubscriptionDao>(
      BoxConstants.subscription,
      SubscriptionDao(
        id: '',
        subscriptionItemId: '',
        premium: false,
        expireAt: '',
        updatedAt: '',
        createdAt: '',
      ),
    );
  }

  @override
  Future<SubscriptionDao> getLocalSubscription() async {
    final subscription = await hive.getBox<SubscriptionDao>(
          BoxConstants.subscription,
        ) ??
        SubscriptionDao(
          id: '',
          subscriptionItemId: '',
          premium: false,
          expireAt: '',
          updatedAt: '',
          createdAt: '',
        );
    return subscription;
  }

  @override
  Future<void> setLocalSubscription(SubscriptionDao subscription) async {
    await hive.putBox<SubscriptionDao>(BoxConstants.subscription, subscription);
  }
}
