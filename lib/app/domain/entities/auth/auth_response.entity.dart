import 'package:equatable/equatable.dart';
import 'package:limonfy/app/domain/entities/auth/send_code_methods.entity.dart';

class AuthReponse extends Equatable {
  final int status;
  final String token;
  final String reason;
  final String channel;
  final List<SendCodeMethods> sendCodeMethods;
  final String message;

  const AuthReponse({
    required this.status,
    required this.token,
    required this.reason,
    required this.channel,
    required this.sendCodeMethods,
    required this.message,
  });

  const AuthReponse.empty()
      : status = 0,
        token = '',
        reason = '',
        channel = '',
        sendCodeMethods = const [],
        message = '';

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
