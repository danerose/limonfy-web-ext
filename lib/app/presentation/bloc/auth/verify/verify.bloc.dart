import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limonfy/core/enum/exceptions.enum.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/domain/usecases/auth/verify.usecase.dart';

import 'package:limonfy/app/presentation/bloc/auth/verify/verify.event.dart';
import 'package:limonfy/app/presentation/bloc/auth/verify/verify.state.dart';

import 'package:limonfy/app/domain/entities/verify/verify_response.entity.dart';

class VerifyBloc extends Bloc<VerifyEvent, VerifyState> {
  final VerifyOtpAuthUsecase _verifyOtpAuthUsecase;
  final VerifySendOtherAuthUsecase _verifySendOtherAuthUsecase;

  VerifyBloc(this._verifyOtpAuthUsecase, this._verifySendOtherAuthUsecase)
      : super(const VerifyState()) {
    on<VerifyInit>(_onInit);
    on<VerifyCodeChanged>(_onCodeChanged);
    on<VerifySendOtherSubmitted>(_onVerifySendOtherSubmitted);
    on<VerifySubmitted>(_onVerifySubmitted);
  }

  void _onInit(
    VerifyInit event,
    Emitter<VerifyState> emit,
  ) {
    emit(state.copyWith(
      token: event.token,
      reason: event.reason,
      sendCodeMethods: event.sendCodeMethods,
    ));
  }

  void _onCodeChanged(
    VerifyCodeChanged event,
    Emitter<VerifyState> emit,
  ) {
    emit(state.copyWith(
      status: 0,
      code: event.code,
    ));
  }

  Future<void> _onVerifySendOtherSubmitted(
    VerifySendOtherSubmitted event,
    Emitter<VerifyState> emit,
  ) async {
    emit(state.copyWith(
      code: '',
      status: 0,
      loading: true,
    ));
    final response = await _verifySendOtherAuthUsecase.execute(
      token: state.token,
      channel: event.channel,
    );

    response.fold(
      (CustomException fail) => emit(
        state.copyWith(
          message: fail.message,
          status: fail.status,
          error: fail.error,
          loading: false,
        ),
      ),
      (VerifyResponse data) => emit(state.copyWith(
        message: data.message,
        token: data.token,
        error: ExceptionEnum.none,
        loading: false,
      )),
    );
  }

  Future<void> _onVerifySubmitted(
    VerifySubmitted event,
    Emitter<VerifyState> emit,
  ) async {
    emit(state.copyWith(
      loading: true,
    ));
    final response = await _verifyOtpAuthUsecase.execute(
      token: state.token,
      otpCode: state.code,
    );

    response.fold(
      (CustomException fail) => emit(
        state.copyWith(
          status: fail.status,
          error: fail.error,
          message: fail.message,
          loading: false,
        ),
      ),
      (VerifyResponse data) => emit(state.copyWith(
        status: data.status,
        channel: data.channel,
        profile: data.profile,
        message: data.message,
        error: ExceptionEnum.none,
        loading: false,
      )),
    );
  }

  @override
  Future<void> close() async {
    log('Closed Bloc', name: 'VeirfyBloc');
    return super.close();
  }
}
