import 'package:equatable/equatable.dart';
import 'package:limonfy/core/utils/validators.util.dart';
import 'package:limonfy/app/data/models/user/user_account.model.dart';
import 'package:limonfy/app/domain/entities/user/user_account_response.entity.dart';

class UserAccountResponseModel extends Equatable {
  final int status;
  final UserAccountModel account;
  final String message;
  const UserAccountResponseModel({
    required this.status,
    required this.account,
    required this.message,
  });

  factory UserAccountResponseModel.fromJson(Map<String, dynamic>? json) {
    return UserAccountResponseModel(
      status: ValidatorUtils.containsKey<int>(json, 'status', 0),
      account: UserAccountModel.fromJson(
        ValidatorUtils.containsKey(json, 'account', null),
      ),
      message: ValidatorUtils.containsKey(json, 'message', ''),
    );
  }

  UserAccountResponse toEntity() {
    return UserAccountResponse(
      status: status,
      account: account.toEntity(),
      message: message,
    );
  }

  @override
  List<Object?> get props => [status, account, message];
}
