import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged({required this.email});
  final String email;
  @override
  List<Object> get props => [email];
}

class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}
