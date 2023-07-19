import 'package:equatable/equatable.dart';
import 'package:limonfy/app/domain/entities/collection/link.collection.entity.dart';
import 'package:limonfy/app/domain/entities/link/link.entity.dart';
import 'package:limonfy/core/enum/exceptions.enum.dart';
import 'package:limonfy/core/enum/premium.enum.dart';
import 'package:limonfy/core/enum/validations.enum.dart';

class CreateLinkState extends Equatable {
  const CreateLinkState({
    this.loading = false,
    this.premium = PremiumEnum.unknown,
    this.loadingFCollections = false,
    this.clipBoardHasText = false,
    this.private = false,
    this.valid = UrlValidationEnum.initial,
    this.status = 0,
    this.statusCreated = 0,
    this.url = '',
    this.collection = const LinkCollection.empty(),
    this.link = const Link.empty(),
    this.featColls = const [],
    this.error = ExceptionEnum.none,
  });

  final bool loading;
  final PremiumEnum premium;
  final bool loadingFCollections;
  final bool clipBoardHasText;
  final bool private;
  final UrlValidationEnum valid;
  final int status;
  final int statusCreated;
  final String url;
  final LinkCollection collection;
  final Link link;
  final List<LinkCollection> featColls;
  final ExceptionEnum error;

  CreateLinkState copyWith({
    bool? loading,
    PremiumEnum? premium,
    bool? loadingFCollections,
    bool? clipBoardHasText,
    bool? private,
    List<LinkCollection>? featColls,
    UrlValidationEnum? valid,
    int? status,
    int? statusCreated,
    String? url,
    LinkCollection? collection,
    Link? link,
    ExceptionEnum? error,
  }) {
    return CreateLinkState(
      loading: loading ?? this.loading,
      premium: premium ?? this.premium,
      loadingFCollections: loadingFCollections ?? this.loadingFCollections,
      clipBoardHasText: clipBoardHasText ?? this.clipBoardHasText,
      private: private ?? this.private,
      featColls: featColls ?? this.featColls,
      valid: valid ?? this.valid,
      status: status ?? this.status,
      statusCreated: statusCreated ?? this.statusCreated,
      url: url ?? this.url,
      collection: collection ?? this.collection,
      link: link ?? this.link,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        statusCreated,
        loading,
        premium,
        loadingFCollections,
        clipBoardHasText,
        private,
        featColls,
        valid,
        url,
        collection,
        link,
        error,
      ];
}
