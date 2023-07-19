import 'package:equatable/equatable.dart';

class Subscription extends Equatable {
  final String id;
  final String subscriptionItemId;
  final bool premium;
  final String expireAt;
  final String updatedAt;
  final String createdAt;

  const Subscription({
    required this.id,
    required this.subscriptionItemId,
    required this.premium,
    required this.expireAt,
    required this.updatedAt,
    required this.createdAt,
  });

  const Subscription.empty()
      : id = '',
        subscriptionItemId = '',
        premium = false,
        expireAt = '',
        updatedAt = '',
        createdAt = '';

  @override
  List<Object?> get props => [
        id,
        subscriptionItemId,
        premium,
        expireAt,
        updatedAt,
        createdAt,
      ];
}
