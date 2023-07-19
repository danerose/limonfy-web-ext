import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limonfy/core/enum/logged.enum.dart';

import 'package:limonfy/app/domain/usecases/config/get_local_config.usecase.dart';
import 'package:limonfy/app/domain/usecases/user/get_user_profile.usecase.dart';
import 'package:limonfy/app/domain/usecases/user/get_user_account.usecase.dart';

import 'package:limonfy/app/presentation/bloc/config/config.state.dart';
import 'package:limonfy/app/presentation/bloc/config/config.event.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  final GetLocalConfigUsecase _localConfigUsecase;
  ConfigBloc(
    this._localConfigUsecase,
  ) : super(const ConfigState()) {
    on<ConfigInit>(_onInit);
    on<ConfigLogout>(_onLogout);
    on<ConfigOnClear>(_onClear);
    on<ConfigLocaleChange>(_onLocaleChange);
    on<ConfigThemeChange>(_onThemeModeChange);
    on<ConfigShowLinksChange>(_onShowLinksChange);
  }

  Future<void> _onInit(
    ConfigInit event,
    Emitter<ConfigState> emit,
  ) async {
    final config = await _localConfigUsecase.configReponsitory.getLocalConfig();
    emit(state.copyWith(
      logged: config.logged ? LoggedEnum.logged : LoggedEnum.nologged,
      lang: config.locale,
      theme: config.mode,
    ));
  }

  Future<void> _onThemeModeChange(
    ConfigThemeChange event,
    Emitter<ConfigState> emit,
  ) async {
    await _localConfigUsecase.configReponsitory.setThemeLocalConfig(event.mode);
    emit(state.copyWith(theme: event.mode));
  }

  Future<void> _onShowLinksChange(
    ConfigShowLinksChange event,
    Emitter<ConfigState> emit,
  ) async {
    emit(state.copyWith(showPrivateLinks: event.show));
  }

  Future<void> _onClear(
    ConfigOnClear event,
    Emitter<ConfigState> emit,
  ) async {
    emit(state.copyWith(
      loginOut: false,
      loginOutStatus: 0,
    ));
  }

  Future<void> _onLocaleChange(
    ConfigLocaleChange event,
    Emitter<ConfigState> emit,
  ) async {
    await _localConfigUsecase.configReponsitory.setLangLocalConfig(
      event.locale,
    );
    emit(state.copyWith(lang: event.locale));
  }

  Future<void> _onLogout(
    ConfigLogout event,
    Emitter<ConfigState> emit,
  ) async {
    if (event.logout) {
      emit(state.copyWith(loginOut: event.logout));
      await _localConfigUsecase.configReponsitory.deleteLocalConfig();
      emit(state.copyWith(
        logged: LoggedEnum.none,
        loginOut: false,
        loginOutStatus: 200,
      ));
    }
  }
}
