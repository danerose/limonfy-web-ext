import 'package:equatable/equatable.dart';
import 'package:limonfy/core/enum/exceptions.enum.dart';
import 'package:limonfy/app/domain/entities/collection/link.collection.entity.dart';

class FeatCollecState extends Equatable {
  const FeatCollecState({
    this.status = 0,
    this.loading = false,
    this.message = '',
    this.collection = const LinkCollection.empty(),
    this.collections = const [],
    this.error = ExceptionEnum.none,
  });

  final int status;
  final bool loading;
  final String message;
  final LinkCollection collection;
  final List<LinkCollection> collections;
  final ExceptionEnum error;

  FeatCollecState copyWith({
    int? status,
    bool? loading,
    String? message,
    LinkCollection? collection,
    List<LinkCollection>? collections,
    ExceptionEnum? error,
  }) {
    return FeatCollecState(
      status: status ?? this.status,
      loading: loading ?? this.loading,
      message: message ?? this.message,
      collection: collection ?? this.collection,
      collections: collections ?? this.collections,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        status,
        loading,
        message,
        collection,
        collections,
        error,
      ];
}
