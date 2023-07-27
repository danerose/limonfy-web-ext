@JS()
library script.js;

import 'dart:developer';

import 'package:js/js.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_html/js_util.dart' as js;

import 'package:limonfy/core/extensions/validations.extension.dart';

import 'package:limonfy/core/enum/exceptions.enum.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';

import 'package:limonfy/app/domain/entities/link/link.entity.dart';
import 'package:limonfy/app/domain/entities/link/link_response.entity.dart';

import 'package:limonfy/app/domain/usecases/links/verify_exist_link.usecase.dart';
import 'package:limonfy/app/domain/usecases/links/convert_link_from_js.usecase.dart';
import 'package:limonfy/app/domain/usecases/links/create_limonfy_app_link.usecase.dart';

import 'package:limonfy/app/presentation/bloc/link/create/create.state.dart';
import 'package:limonfy/app/presentation/bloc/link/create/create.event.dart';

@JS()
external Future<dynamic> getUrl();

class CreateLinkBloc extends Bloc<CreateLinkEvent, CreateLinkState> {
  final CreateLimonfyAppLinkUsecase _createLimonfyAppLinkUsecase;
  final VerifyExistLinkUsecase _verifyExistLinkUsecase;
  final ConvertLinkFromJsUsecase _convertLinkFromJsUsecase;

  CreateLinkBloc(
    this._createLimonfyAppLinkUsecase,
    this._verifyExistLinkUsecase,
    this._convertLinkFromJsUsecase,
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
    final result = await js.promiseToFuture(getUrl());
    final Link link = await _convertLinkFromJsUsecase.execute(link: result);
    final verify = await _verifyExistLinkUsecase.execute(
      link: link.link,
    );
    verify.fold(
      (l) => emit(state.copyWith(
        exist: false,
        loading: false,
        url: link.link,
        valid: link.link.isValidUrl,
        link: link,
      )),
      (r) => emit(
        state.copyWith(
          exist: r,
          valid: link.link.isValidUrl,
          url: link.link,
          link: link,
          loading: false,
        ),
      ),
    );
    // res.fold(
    //   (CustomException fail) => emit(
    //     state.copyWith(
    //       error: ExceptionEnum.request,
    //       loading: false,
    //       exist: exist,
    //       url: event.url,
    //     ),
    //   ),
    //   (LinkResponse data) {
    //     emit(
    //       state.copyWith(
    //         url: event.url,
    //         link: data.link,
    //         exist: exist,
    //         error: ExceptionEnum.none,
    //         loading: false,
    //       ),
    //     );
    //   },
    // );
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
      link: state.link.link,
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
