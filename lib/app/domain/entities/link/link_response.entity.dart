import 'package:equatable/equatable.dart';

import 'package:limonfy/app/domain/entities/link/link.entity.dart';

class LinkResponse extends Equatable {
  final int status;
  final Link link;
  final String message;

  const LinkResponse({
    required this.status,
    required this.link,
    required this.message,
  });

  const LinkResponse.empty()
      : status = 0,
        link = const Link.empty(),
        message = '';

  @override
  List<Object?> get props => [status, link, message];
}
