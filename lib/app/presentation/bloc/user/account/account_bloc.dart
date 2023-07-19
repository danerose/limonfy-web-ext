import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limonfy/app/domain/entities/user/user_account.entity.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/domain/entities/subscription/subscription.entity.dart';
import 'package:limonfy/app/domain/entities/subscription/subscription_item.entity.dart';
import 'package:limonfy/app/domain/entities/subscription/subscription_response.entity.dart';

import 'package:limonfy/app/domain/usecases/user/get_user_account_subscription.usecase.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final GetUserAccountSubscriptionUsecase _getUserAccountSubsUsecase;
  AccountBloc(
    this._getUserAccountSubsUsecase,
  ) : super(const AccountState()) {
    on<AccountInit>(_onInit);
  }

  Future<void> _onInit(
    AccountInit event,
    Emitter<AccountState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    final res = await _getUserAccountSubsUsecase.execute(
      refresh: event.refresh,
    );
    res.fold(
      (CustomException l) => emit(state.copyWith(loading: false)),
      (SubscriptionResponse r) {
        emit(state.copyWith(
          subscription: r.subscription,
          subscriptionItem: r.subscriptionItem,
        ));
      },
    );
  }
}
