import 'package:equatable/equatable.dart';

class SendCodeMethods extends Equatable {
  final String channel;
  final String value;

  const SendCodeMethods({required this.channel, required this.value});

  @override
  List<Object?> get props => [channel, value];

  @override
  bool? get stringify => true;
}
