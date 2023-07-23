import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limonfy/app/domain/entities/collection/link.collection.entity.dart';
import 'package:limonfy/app/domain/entities/subscription/subscription_response.entity.dart';
import 'package:limonfy/app/domain/usecases/collections/get_featured_local_collections.usecase.dart';
import 'package:limonfy/app/domain/usecases/user/get_user_account_subscription.usecase.dart';
import 'package:limonfy/core/enum/exceptions.enum.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/presentation/bloc/collections/featured/featured.event.dart';
import 'package:limonfy/app/presentation/bloc/collections/featured/featured.state.dart';

import 'package:limonfy/app/domain/entities/collection/links_collections_response.entity.dart';

import 'package:limonfy/app/domain/usecases/collections/get_featured_collections.usecase.dart';

class FeaturedCollectionBloc extends Bloc<FeatCollecEvent, FeatCollecState> {
  final GetFeaturedCollectionUsecase _getFeatureCollectionUsecase;
  final GetUserAccountSubscriptionUsecase _getUserAccountSubsUsecase;
  FeaturedCollectionBloc(
    this._getFeatureCollectionUsecase,
    this._getUserAccountSubsUsecase,
  ) : super(const FeatCollecState()) {
    on<FeatCollecInit>(_onInit);
    on<FeaturedCollSet>(_onSet);
  }

  Future<void> _onInit(
    FeatCollecInit event,
    Emitter<FeatCollecState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    final subscription = await _getUserAccountSubsUsecase.execute(
      refresh: event.refresh,
    );
    late bool premium = false;
    subscription.fold(
      (CustomException l) => premium = false,
      (SubscriptionResponse r) => premium = r.subscription.premium,
    );
    if (premium) {
      final res = await _getFeatureCollectionUsecase.execute(
        refresh: event.refresh,
      );
      res.fold(
        (CustomException fail) => emit(
          state.copyWith(
            status: fail.status,
            error: fail.error,
            message: fail.message,
            collection: const LinkCollection.empty(),
            collections: [],
            premium: premium,
            loading: false,
          ),
        ),
        (LinksCollsResponse data) {
          emit(
            state.copyWith(
              premium: premium,
              status: data.status,
              error: ExceptionEnum.none,
              message: data.message,
              collection: const LinkCollection.empty(),
              collections: data.linksCollections,
              loading: false,
            ),
          );
        },
      );
    } else {
      emit(state.copyWith(loading: false, premium: premium));
    }
  }

  Future<void> _onSet(
    FeaturedCollSet event,
    Emitter<FeatCollecState> emit,
  ) async {
    emit(state.copyWith(collection: event.coll));
  }
}
