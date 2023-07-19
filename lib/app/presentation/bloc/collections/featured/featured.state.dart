import 'package:equatable/equatable.dart';
import 'package:limonfy/core/enum/exceptions.enum.dart';
import 'package:limonfy/app/domain/entities/collection/link.collection.entity.dart';

class FeatCollecState extends Equatable {
  const FeatCollecState({
    this.status = 0,
    this.loading = false,
    this.message = '',
    this.collections = const [],
    this.error = ExceptionEnum.none,
  });

  final int status;
  final bool loading;
  final String message;
  final List<LinkCollection> collections;
  final ExceptionEnum error;

  FeatCollecState copyWith({
    int? status,
    bool? loading,
    String? message,
    List<LinkCollection>? collections,
    ExceptionEnum? error,
  }) {
    return FeatCollecState(
      status: status ?? this.status,
      loading: loading ?? this.loading,
      message: message ?? this.message,
      collections: collections ?? this.collections,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [status, loading, message, collections, error];
}
