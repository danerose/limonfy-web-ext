import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limonfy/app/domain/entities/collection/links_collections_response.entity.dart';
import 'package:limonfy/app/domain/usecases/collections/get_featured_collections.usecase.dart';

import 'package:limonfy/core/enum/premium.enum.dart';
import 'package:limonfy/core/enum/exceptions.enum.dart';

import 'package:limonfy/core/exceptions/custom.exceptions.dart';
import 'package:limonfy/core/extensions/validations.extension.dart';

import 'package:limonfy/app/presentation/bloc/link/create/create.state.dart';
import 'package:limonfy/app/presentation/bloc/link/create/create.event.dart';

import 'package:limonfy/app/domain/entities/link/link_response.entity.dart';
import 'package:limonfy/app/domain/entities/subscription/subscription_response.entity.dart';

import 'package:limonfy/app/domain/usecases/links/create_limonfy_app_link.usecase.dart';
import 'package:limonfy/app/domain/usecases/links/get_meta_tags_from_link.usecase.dart';
import 'package:limonfy/app/domain/usecases/user/get_user_account_subscription.usecase.dart';

class CreateLinkBloc extends Bloc<CreateLinkEvent, CreateLinkState> {
  final GetMetaTagsFromLinkUsecase _getMetaTagsFromLinkUsecase;
  final GetFeaturedCollectionUsecase _getFeatureCollectionUsecase;
  final CreateLimonfyAppLinkUsecase _createLimonfyAppLinkUsecase;
  final GetUserAccountSubscriptionUsecase _getUserAccountSubsUsecase;
  CreateLinkBloc(
    this._getMetaTagsFromLinkUsecase,
    this._getFeatureCollectionUsecase,
    this._createLimonfyAppLinkUsecase,
    this._getUserAccountSubsUsecase,
  ) : super(const CreateLinkState()) {
    on<CreateLinkOnInit>(_onInit);
    on<CreateLinkSetUrl>(_setUrl);
    on<CreateLinkSubmitLink>(_submitLink);
    on<CreateLinkMakePrivate>(_makeLinkPrivate);
    on<CreateLinkOnCollSelect>(_onCollectionSelect);
    on<CreateLinkGetMetaTagsFromLink>(_getMetaTagsFromLink);
  }

  Future<void> _onInit(
    CreateLinkOnInit event,
    Emitter<CreateLinkState> emit,
  ) async {
    emit(state.copyWith(
      collection: event.coll,
      loadingFCollections: true,
      featColls: [],
      premium: PremiumEnum.unknown,
    ));
    final sub = await _getUserAccountSubsUsecase.execute(refresh: false);
    sub.fold(
      (CustomException l) => emit(state.copyWith(premium: PremiumEnum.none)),
      (SubscriptionResponse r) {
        final p = r.subscription.premium;
        emit(state.copyWith(
          premium: p ? PremiumEnum.premium : PremiumEnum.none,
        ));
      },
    );
    final res = await _getFeatureCollectionUsecase.execute(refresh: false);
    res.fold(
      (CustomException l) => emit(state.copyWith()),
      (LinksCollsResponse r) => emit(state.copyWith()),
    );
    emit(state.copyWith(
      collection: event.coll,
      clipBoardHasText: await Clipboard.hasStrings(),
      loadingFCollections: false,
    ));
  }

  Future<void> _onCollectionSelect(
    CreateLinkOnCollSelect event,
    Emitter<CreateLinkState> emit,
  ) async {
    emit(state.copyWith(collection: event.coll));
  }

  Future<void> _getMetaTagsFromLink(
    CreateLinkGetMetaTagsFromLink event,
    Emitter<CreateLinkState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    final res = await _getMetaTagsFromLinkUsecase.execute(
      url: event.url,
    );
    res.fold(
      (CustomException fail) => emit(
        state.copyWith(
          status: 0,
          error: ExceptionEnum.request,
          loading: false,
        ),
      ),
      (LinkResponse data) {
        emit(
          state.copyWith(
            status: data.status,
            link: data.link,
            error: ExceptionEnum.none,
            loading: true,
          ),
        );
      },
    );
  }

  Future<void> _makeLinkPrivate(
    CreateLinkMakePrivate event,
    Emitter<CreateLinkState> emit,
  ) async {
    emit(state.copyWith(private: event.private));
  }

  Future<void> _submitLink(
    CreateLinkSubmitLink event,
    Emitter<CreateLinkState> emit,
  ) async {
    final res = await _createLimonfyAppLinkUsecase.execute(
      link: state.url,
      title: event.link.title,
      description: event.link.description,
      sourceName: event.link.sourceName,
      sourceImageUrl: event.link.sourceImageUrl,
      imageUrl: event.link.imageUrl,
      private: state.private,
      userAccountId: event.link.userAccountId,
      linkCollectionId: state.collection.id,
    );
    res.fold(
      (CustomException fail) => emit(
        state.copyWith(
          status: 0,
          statusCreated: 0,
          error: ExceptionEnum.request,
          loading: false,
        ),
      ),
      (LinkResponse data) async {
        emit(
          state.copyWith(
            status: 0,
            statusCreated: 200,
            error: ExceptionEnum.none,
            loading: false,
          ),
        );
      },
    );
  }

  Future<void> _setUrl(
    CreateLinkSetUrl event,
    Emitter<CreateLinkState> emit,
  ) async {
    emit(
      state.copyWith(
        status: 0,
        error: ExceptionEnum.none,
        valid: event.url.isValidUrl,
        url: event.url,
      ),
    );
  }

  @override
  Future<void> close() {
    log('Closed Bloc', name: 'LinkCreateBloc');
    return super.close();
  }
}
