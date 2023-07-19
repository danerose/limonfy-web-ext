import 'package:equatable/equatable.dart';
import 'package:limonfy/app/domain/entities/auth/send_code_methods.entity.dart';

abstract class VerifyEvent extends Equatable {
  const VerifyEvent();

  @override
  List<Object> get props => [];
}

class VerifyInit extends VerifyEvent {
  const VerifyInit({
    required this.token,
    required this.reason,
    required this.sendCodeMethods,
  });
  final String token;
  final String reason;
  final List<SendCodeMethods> sendCodeMethods;
}

class VerifyCodeChanged extends VerifyEvent {
  final String code;
  const VerifyCodeChanged({required this.code});
}

class VerifySendOtherSubmitted extends VerifyEvent {
  final String channel;
  const VerifySendOtherSubmitted({required this.channel});
}

class VerifySubmitted extends VerifyEvent {
  const VerifySubmitted();
}
