import 'package:equatable/equatable.dart';
import 'package:limonfy/core/utils/validators.util.dart';
import 'package:limonfy/app/data/models/link/link.model.dart';
import 'package:limonfy/app/domain/entities/link/link_response.entity.dart';

class LinkResponseModel extends Equatable {
  final int status;
  final LinkModel link;
  final String message;
  const LinkResponseModel({
    required this.status,
    required this.link,
    required this.message,
  });

  factory LinkResponseModel.fromJson(Map<String, dynamic>? json) {
    return LinkResponseModel(
      status: ValidatorUtils.containsKey<int>(json, 'status', 0),
      link: LinkModel.fromJson(ValidatorUtils.containsKey(json, 'link', null)),
      message: ValidatorUtils.containsKey(json, 'message', ''),
    );
  }

  LinkResponse toEntity() {
    return LinkResponse(
      status: status,
      link: link.toEntity(),
      message: message,
    );
  }

  @override
  List<Object?> get props => [
        status,
        link,
        message,
      ];
}
