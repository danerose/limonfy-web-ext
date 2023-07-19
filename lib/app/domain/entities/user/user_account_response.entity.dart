import 'package:equatable/equatable.dart';
import 'package:limonfy/app/domain/entities/user/user_account.entity.dart';

class UserAccountResponse extends Equatable {
  const UserAccountResponse({
    required this.status,
    required this.account,
    required this.message,
  });

  final int status;
  final UserAccount account;
  final String message;

  const UserAccountResponse.empty()
      : status = 0,
        account = const UserAccount.empty(),
        message = '';

  @override
  List<Object?> get props => [status, account, message];
}
