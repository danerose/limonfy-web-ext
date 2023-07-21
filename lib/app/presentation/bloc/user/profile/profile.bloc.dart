import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/domain/usecases/user/get_user_profile.usecase.dart';

import 'package:limonfy/app/domain/entities/user/user_profile_response.entity.dart';

import 'package:limonfy/app/presentation/bloc/user/profile/profile.event.dart';
import 'package:limonfy/app/presentation/bloc/user/profile/profile.state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserProfileUsecase _getUserProfileUsecase;

  ProfileBloc(
    this._getUserProfileUsecase,
  ) : super(const ProfileState()) {
    on<ProfileInit>(_onInit);
  }

  Future<void> _onInit(
    ProfileInit event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    final res = await _getUserProfileUsecase.execute(
      refresh: event.refresh,
    );
    res.fold(
      (CustomException l) => emit(state.copyWith(loading: false)),
      (UserProfileResponse r) => emit(state.copyWith(
        profile: r.profile,
        loading: false,
      )),
    );
  }
}
