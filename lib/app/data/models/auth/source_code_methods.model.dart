import 'package:equatable/equatable.dart';
import 'package:limonfy/core/utils/validators.util.dart';

import 'package:limonfy/app/domain/entities/auth/send_code_methods.entity.dart';

class SendCodeMethodsModel extends Equatable {
  final String channel;
  final String value;
  const SendCodeMethodsModel({
    required this.channel,
    required this.value,
  });

  factory SendCodeMethodsModel.fromJson(Map<String, dynamic>? json) {
    return SendCodeMethodsModel(
      channel: ValidatorUtils.containsKey(json, 'channel', ''),
      value: ValidatorUtils.containsKey(json, 'value', ''),
    );
  }

  SendCodeMethods toEntity() {
    return SendCodeMethods(channel: channel, value: value);
  }

  @override
  List<Object?> get props => [channel, value];
}
