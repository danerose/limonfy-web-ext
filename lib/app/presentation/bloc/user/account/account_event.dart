part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class AccountInit extends AccountEvent {
  const AccountInit({required this.refresh});
  final bool refresh;
}
