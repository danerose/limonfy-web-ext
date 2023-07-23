import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limonfy/app/domain/usecases/links/verify_exist_link.usecase.dart';
import 'package:universal_html/html.dart' as html;

import 'package:limonfy/core/enum/exceptions.enum.dart';

import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/presentation/bloc/link/create/create.state.dart';
import 'package:limonfy/app/presentation/bloc/link/create/create.event.dart';

import 'package:limonfy/app/domain/entities/link/link_response.entity.dart';

import 'package:limonfy/app/domain/usecases/links/create_limonfy_app_link.usecase.dart';
import 'package:limonfy/app/domain/usecases/links/get_meta_tags_from_link.usecase.dart';

class CreateLinkBloc extends Bloc<CreateLinkEvent, CreateLinkState> {
  final GetMetaTagsFromLinkUsecase _getMetaTagsFromLinkUsecase;
  final CreateLimonfyAppLinkUsecase _createLimonfyAppLinkUsecase;
  final VerifyExistLinkUsecase _verifyExistLinkUsecase;
  CreateLinkBloc(
    this._getMetaTagsFromLinkUsecase,
    this._createLimonfyAppLinkUsecase,
    this._verifyExistLinkUsecase,
  ) : super(const CreateLinkState()) {
    on<CreateLinkOnInit>(_onInit);
    on<CreateLinkSubmitLink>(_submitLink);
    on<CreateLinkMakePrivate>(_makeLinkPrivate);
  }

  Future<void> _onInit(
    CreateLinkOnInit event,
    Emitter<CreateLinkState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    final anchor = html.AnchorElement(href: html.window.location.href);
    late bool exist = false;
    final verify = await _verifyExistLinkUsecase.execute(
      link: anchor.href ?? '',
    );
    verify.fold((l) => exist = false, (r) => exist = r);
    final res = await _getMetaTagsFromLinkUsecase.execute(
      url: anchor.href ?? '',
    );
    res.fold(
      (CustomException fail) => emit(
        state.copyWith(
          error: ExceptionEnum.request,
          loading: false,
          exist: exist,
          url: anchor.href,
        ),
      ),
      (LinkResponse data) {
        emit(
          state.copyWith(
            url: anchor.href,
            link: data.link,
            exist: exist,
            error: ExceptionEnum.none,
            loading: false,
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
    emit(state.copyWith(creating: true));
    final res = await _createLimonfyAppLinkUsecase.execute(
      link: state.url,
      title: state.link.title,
      description: state.link.description,
      sourceName: state.link.sourceName,
      sourceImageUrl: state.link.sourceImageUrl,
      imageUrl: state.link.imageUrl,
      private: state.private,
      linkCollectionId: event.coll.id,
    );
    res.fold(
      (CustomException fail) => emit(
        state.copyWith(
          status: 0,
          error: ExceptionEnum.request,
          creating: false,
        ),
      ),
      (LinkResponse data) async {
        emit(
          state.copyWith(
            status: data.status,
            exist: true,
            error: ExceptionEnum.none,
            creating: false,
          ),
        );
      },
    );
  }

  @override
  Future<void> close() {
    log('Closed Bloc', name: 'LinkCreateBloc');
    return super.close();
  }
}
