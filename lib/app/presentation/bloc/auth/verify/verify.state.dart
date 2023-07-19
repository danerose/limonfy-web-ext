import 'package:equatable/equatable.dart';
import 'package:limonfy/core/enum/exceptions.enum.dart';
import 'package:limonfy/app/domain/entities/user/user_profile.entity.dart';
import 'package:limonfy/app/domain/entities/auth/send_code_methods.entity.dart';

class VerifyState extends Equatable {
  const VerifyState({
    this.status = 0,
    this.token = '',
    this.reason = '',
    this.profile = const UserProfile.empty(),
    this.sendCodeMethods = const [],
    this.channel = '',
    this.code = '',
    this.loading = false,
    this.error = ExceptionEnum.none,
    this.message = '',
  });

  final int status;
  final String token;
  final String reason;
  final UserProfile profile;
  final List<SendCodeMethods> sendCodeMethods;
  final String code;
  final String channel;
  final String message;
  final bool loading;
  final ExceptionEnum error;

  VerifyState copyWith({
    int? status,
    String? token,
    String? reason,
    UserProfile? profile,
    List<SendCodeMethods>? sendCodeMethods,
    String? code,
    String? channel,
    String? message,
    bool? loading,
    ExceptionEnum? error,
  }) {
    return VerifyState(
      status: status ?? this.status,
      token: token ?? this.token,
      profile: profile ?? this.profile,
      sendCodeMethods: sendCodeMethods ?? this.sendCodeMethods,
      code: code ?? this.code,
      channel: channel ?? this.channel,
      message: message ?? this.message,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [
        status,
        token,
        profile,
        sendCodeMethods,
        code,
        channel,
        message,
        loading,
        error,
      ];
}
