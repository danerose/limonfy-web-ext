part of 'account_bloc.dart';

class AccountState extends Equatable {
  const AccountState({
    this.loading = false,
    this.account = const UserAccount.empty(),
    this.subscription = const Subscription.empty(),
    this.subscriptionItem = const SubscriptionItem.empty(),
  });

  final bool loading;
  final UserAccount account;
  final Subscription subscription;
  final SubscriptionItem subscriptionItem;

  AccountState copyWith({
    bool? loading,
    UserAccount? account,
    Subscription? subscription,
    SubscriptionItem? subscriptionItem,
  }) {
    return AccountState(
      loading: loading ?? this.loading,
      account: account ?? this.account,
      subscription: subscription ?? this.subscription,
      subscriptionItem: subscriptionItem ?? this.subscriptionItem,
    );
  }

  @override
  List<Object> get props => [
        loading,
        account,
        subscription,
        subscriptionItem,
      ];
}
