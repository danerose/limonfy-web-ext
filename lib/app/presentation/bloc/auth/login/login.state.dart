import 'package:equatable/equatable.dart';
import 'package:limonfy/core/enum/exceptions.enum.dart';
import 'package:limonfy/core/enum/validations.enum.dart';
import 'package:limonfy/app/domain/entities/auth/send_code_methods.entity.dart';

class LoginState extends Equatable {
  const LoginState({
    this.status = 0,
    this.loading = false,
    this.token = '',
    this.reason = '',
    this.channel = '',
    this.email = '',
    this.message = '',
    this.sendCodeMethods = const [],
    this.valid = EmailValidationEnum.initial,
    this.error = ExceptionEnum.none,
  });

  final int status;
  final bool loading;
  final String token;
  final String reason;
  final String channel;
  final String email;
  final String message;
  final List<SendCodeMethods> sendCodeMethods;
  final EmailValidationEnum valid;
  final ExceptionEnum error;

  LoginState copyWith({
    final int? status,
    final bool? loading,
    final String? token,
    final String? reason,
    final String? channel,
    final String? email,
    final String? message,
    final List<SendCodeMethods>? sendCodeMethods,
    final EmailValidationEnum? valid,
    final ExceptionEnum? error,
  }) {
    return LoginState(
      status: status ?? this.status,
      loading: loading ?? this.loading,
      token: token ?? this.token,
      reason: reason ?? this.reason,
      channel: channel ?? this.channel,
      email: email ?? this.email,
      message: message ?? this.message,
      error: error ?? this.error,
      valid: valid ?? this.valid,
    );
  }

  @override
  List<Object> get props => [
        status,
        loading,
        token,
        reason,
        channel,
        email,
        message,
        error,
        valid,
      ];
}
