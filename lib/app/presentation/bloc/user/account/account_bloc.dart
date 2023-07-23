import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limonfy/app/domain/entities/user/user_account.entity.dart';
import 'package:limonfy/app/domain/entities/user/user_account_response.entity.dart';
import 'package:limonfy/app/domain/usecases/user/get_user_account.usecase.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/domain/entities/subscription/subscription.entity.dart';
import 'package:limonfy/app/domain/entities/subscription/subscription_item.entity.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final GetUserAccountUsecase _getUserAccountUsecase;

  AccountBloc(
    this._getUserAccountUsecase,
  ) : super(const AccountState()) {
    on<AccountInit>(_onInit);
  }

  Future<void> _onInit(
    AccountInit event,
    Emitter<AccountState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    final account = await _getUserAccountUsecase.execute(
      refresh: event.refresh,
    );
    account.fold(
      (CustomException l) => emit(state.copyWith(loading: false)),
      (UserAccountResponse r) {
        emit(state.copyWith(account: r.account, loading: false));
      },
    );
  }
}
