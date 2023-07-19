import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileInit extends ProfileEvent {
  ProfileInit({required this.refresh});
  final bool refresh;
}
