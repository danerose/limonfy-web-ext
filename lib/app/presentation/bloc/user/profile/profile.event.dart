import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
  @override
  List<Object?> get props => [];
}

class ProfileInit extends ProfileEvent {
  const ProfileInit({required this.refresh});
  final bool refresh;
}
