import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyTimerCubit extends Cubit<int> {
  VerifyTimerCubit() : super(0);

  Timer? _timer;
  Duration _duration = const Duration(seconds: 30);

  void _onTick() {
    final sec = _duration.inSeconds - 1;
    if (sec <= 0) {
      _duration = const Duration(seconds: 30);
      _timer!.cancel();
      emit(0);
    } else {
      _duration = Duration(seconds: sec);
      emit(_duration.inSeconds);
    }
  }

  void starTimer(int duration) {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _onTick());
    emit(state + 30);
  }

  @override
  Future<void> close() async {
    log('Closed Bloc', name: 'VeirfyBloc');
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    return super.close();
  }
}
