import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limonfy/core/enum/exceptions.enum.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/presentation/bloc/collections/featured/featured.event.dart';
import 'package:limonfy/app/presentation/bloc/collections/featured/featured.state.dart';

import 'package:limonfy/app/domain/entities/collection/links_collections_response.entity.dart';

import 'package:limonfy/app/domain/usecases/collections/get_featured_collections.usecase.dart';

class FeaturedCollectionBloc extends Bloc<FeatCollecEvent, FeatCollecState> {
  final GetFeaturedCollectionUsecase _remoteFeatureCollectionUsecase;
  FeaturedCollectionBloc(this._remoteFeatureCollectionUsecase)
      : super(const FeatCollecState()) {
    on<FeatCollecInit>(_onInit);
    on<FeatCollecSetReoder>(_onSetReoder);
  }

  Future<void> _onInit(
    FeatCollecInit event,
    Emitter<FeatCollecState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    final res = await _remoteFeatureCollectionUsecase.execute(
      refresh: event.refresh,
    );
    res.fold(
      (CustomException fail) => emit(
        state.copyWith(
          status: fail.status,
          error: fail.error,
          message: fail.message,
          collections: [],
          loading: false,
        ),
      ),
      (LinksCollsResponse data) {
        emit(
          state.copyWith(
            status: data.status,
            error: ExceptionEnum.none,
            message: data.message,
            collections: data.linksCollections,
            loading: false,
          ),
        );
      },
    );
  }

  Future<void> _onSetReoder(
    FeatCollecSetReoder event,
    Emitter<FeatCollecState> emit,
  ) async {
    emit(state.copyWith(collections: event.list));
  }
}
