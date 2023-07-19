import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:limonfy/core/enum/exceptions.enum.dart';
import 'package:limonfy/core/enum/validations.enum.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';
import 'package:limonfy/core/extensions/validations.extension.dart';

import 'package:limonfy/app/domain/usecases/auth/login.usecase.dart';

import 'package:limonfy/app/presentation/bloc/auth/login/login.event.dart';
import 'package:limonfy/app/presentation/bloc/auth/login/login.state.dart';

import 'package:limonfy/app/domain/entities/auth/auth_response.entity.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LocalLogInUsecase _localLoginUsecase;

  LoginBloc(this._localLoginUsecase) : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginSubmitted>(_onSubmitted);
  }

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(
      status: 0,
      valid: event.email.isValidEmail,
      email: event.email,
    ));
  }

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(
      valid: EmailValidationEnum.initial,
      loading: true,
    ));
    final response = await _localLoginUsecase.execute(
      email: state.email,
    );
    response.fold(
      (CustomException fail) => emit(state.copyWith(
        loading: false,
        status: fail.status,
        error: fail.error,
        message: fail.message,
      )),
      (AuthReponse data) {
        emit(state.copyWith(
          loading: false,
          status: data.status,
          token: data.token,
          reason: data.reason,
          channel: data.channel,
          message: data.message,
          sendCodeMethods: data.sendCodeMethods,
          error: ExceptionEnum.none,
        ));
      },
    );
  }

  @override
  Future<void> close() async {
    log('Closed Bloc', name: 'LoginBloc');
    return super.close();
  }
}
