import 'package:equatable/equatable.dart';
import 'package:limonfy/core/enum/exceptions.enum.dart';
import 'package:limonfy/core/enum/validations.enum.dart';
import 'package:limonfy/app/domain/entities/link/link.entity.dart';

class CreateLinkState extends Equatable {
  const CreateLinkState({
    this.loading = false,
    this.exist = false,
    this.creating = false,
    this.private = false,
    this.valid = UrlValidationEnum.initial,
    this.status = 0,
    this.url = '',
    this.link = const Link.empty(),
    this.error = ExceptionEnum.none,
  });

  final bool loading;
  final bool exist;
  final bool creating;
  final bool private;
  final UrlValidationEnum valid;
  final int status;
  final String url;
  final Link link;
  final ExceptionEnum error;

  CreateLinkState copyWith({
    bool? loading,
    bool? exist,
    bool? creating,
    bool? private,
    UrlValidationEnum? valid,
    int? status,
    String? url,
    Link? link,
    ExceptionEnum? error,
  }) {
    return CreateLinkState(
      loading: loading ?? this.loading,
      exist: exist ?? this.exist,
      creating: creating ?? this.creating,
      private: private ?? this.private,
      valid: valid ?? this.valid,
      status: status ?? this.status,
      url: url ?? this.url,
      link: link ?? this.link,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        loading,
        exist,
        creating,
        private,
        valid,
        status,
        url,
        link,
        error,
      ];
}
