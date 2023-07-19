import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:limonfy/core/enum/validations.enum.dart';
import 'package:limonfy/core/enum/image_actions.enum.dart';
import 'package:limonfy/core/enum/folder_storage.enum.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';
import 'package:limonfy/core/extensions/validations.extension.dart';

import 'package:limonfy/app/domain/usecases/user/get_user_profile.usecase.dart';
import 'package:limonfy/app/domain/usecases/user/get_user_account.usecase.dart';

import 'package:limonfy/app/domain/entities/user/user_profile_response.entity.dart';

import 'package:limonfy/app/presentation/bloc/user/profile/profile.event.dart';
import 'package:limonfy/app/presentation/bloc/user/profile/profile.state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserAccountUsecase _getLocalUserAccountUsecase;
  final GetUserProfileUsecase _getRemoteUserProfileUsecase;

  ProfileBloc(
    this._getRemoteUserProfileUsecase,
    this._getLocalUserAccountUsecase,
  ) : super(const ProfileState()) {
    on<ProfileInit>(_onInit);
  }

  Future<void> _onInit(
    ProfileInit event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    final res = await _getRemoteUserProfileUsecase.execute(
      refresh: event.refresh,
    );
    res.fold(
      (CustomException l) => emit(state.copyWith(loading: false)),
      (UserProfileResponse r) => emit(state.copyWith(profile: r.profile)),
    );
    try {
      emit(state.copyWith(loading: false));
    } catch (e) {
      emit(state.copyWith(loading: false));
    }
  }
}
