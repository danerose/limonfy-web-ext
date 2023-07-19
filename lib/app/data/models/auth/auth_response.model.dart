import 'package:equatable/equatable.dart';
import 'package:limonfy/core/utils/validators.util.dart';

import 'package:limonfy/app/data/models/auth/source_code_methods.model.dart';

import 'package:limonfy/app/domain/entities/auth/auth_response.entity.dart';
import 'package:limonfy/app/domain/entities/auth/send_code_methods.entity.dart';

class AuthResponseModel extends Equatable {
  final int status;
  final String token;
  final String reason;
  final String channel;
  final List<SendCodeMethodsModel> sendCodeMethods;
  final String message;

  const AuthResponseModel({
    required this.status,
    required this.token,
    required this.reason,
    required this.channel,
    required this.sendCodeMethods,
    required this.message,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic>? json) {
    return AuthResponseModel(
      status: ValidatorUtils.containsKey<int>(json, 'status', 0),
      token: ValidatorUtils.containsKey<String>(json, 'token', ''),
      reason: ValidatorUtils.containsKey<String>(json, 'reason', ''),
      channel: ValidatorUtils.containsKey<String>(json, 'channel', ''),
      sendCodeMethods: List<SendCodeMethodsModel>.from(
        ValidatorUtils.containsKey(
          json,
          'send_codes_methods',
          [],
        ).map((dynamic e) => SendCodeMethodsModel.fromJson(e)),
      ),
      message: ValidatorUtils.containsKey<String>(json, 'message', ''),
    );
  }

  AuthReponse toEntity() {
    return AuthReponse(
      status: status,
      token: token,
      reason: reason,
      channel: channel,
      sendCodeMethods: List<SendCodeMethods>.from(
        sendCodeMethods.map((e) => e.toEntity()),
      ),
      message: message,
    );
  }

  @override
  List<Object?> get props => [
        status,
        token,
        reason,
        channel,
        sendCodeMethods,
        message,
      ];
}
