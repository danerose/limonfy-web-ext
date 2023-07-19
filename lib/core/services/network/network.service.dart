import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:limonfy/core/utils/lang.util.dart';
import 'package:limonfy/core/enum/exceptions.enum.dart';
import 'package:limonfy/core/exceptions/custom.exceptions.dart';

class HttpService {
  late String baseUrl;
  late Dio _dio;
  late List<Interceptor>? interceptors;

  HttpService({
    required this.baseUrl,
    required Dio dio,
    this.interceptors,
  }) {
    _dio = dio;
    _dio
      ..options.baseUrl = baseUrl
      ..options.headers = {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Accept-Language': LangUtils.system()
      };
    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors as Iterable<Interceptor>);
    }
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          request: true,
          error: true,
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
        ),
      );
    }
  }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e, s) {
      throw CustomException.dioException(
        e: e,
        stack: s,
        res: e.response,
      );
    } on SocketException catch (e, s) {
      throw CustomException.exception(
        e: e,
        stack: s,
        error: ExceptionEnum.socket,
      );
    } catch (e, s) {
      throw CustomException.exception(
        e: e,
        stack: s,
        error: ExceptionEnum.unknown,
      );
    }
  }

  Future<Response> post(
    String uri, {
    Map<String, dynamic>? body,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: body,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e, s) {
      throw CustomException.exception(
        e: e,
        stack: s,
        error: ExceptionEnum.socket,
      );
    } on DioException catch (e, s) {
      if (e.error is SocketException) {
        throw CustomException.exception(
          e: e,
          stack: s,
          error: ExceptionEnum.socket,
        );
      } else {
        throw CustomException.dioException(
          e: e,
          stack: s,
          res: e.response,
        );
      }
    } catch (e, s) {
      throw CustomException.exception(
        e: e,
        stack: s,
        error: ExceptionEnum.unknown,
      );
    }
  }

  Future<Response> delete(
    String uri, {
    Map<String, dynamic>? body,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: body,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on SocketException catch (e, s) {
      throw CustomException.exception(
        e: e,
        stack: s,
        error: ExceptionEnum.socket,
      );
    } on DioException catch (e, s) {
      if (e.error is SocketException) {
        throw CustomException.exception(
          e: e,
          stack: s,
          error: ExceptionEnum.socket,
        );
      } else {
        throw CustomException.dioException(
          e: e,
          stack: s,
          res: e.response,
        );
      }
    } catch (e, s) {
      throw CustomException.exception(
        e: e,
        stack: s,
        error: ExceptionEnum.unknown,
      );
    }
  }

  Future<Response> patch(
    String uri, {
    Map<String, dynamic>? body,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.patch(
        uri,
        data: body,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e, s) {
      throw CustomException.exception(
        e: e,
        stack: s,
        error: ExceptionEnum.socket,
      );
    } on DioException catch (e, s) {
      if (e.error is SocketException) {
        throw CustomException.exception(
          e: e,
          stack: s,
          error: ExceptionEnum.socket,
        );
      } else {
        throw CustomException.dioException(
          e: e,
          stack: s,
          res: e.response,
        );
      }
    } catch (e, s) {
      throw CustomException.exception(
        e: e,
        stack: s,
        error: ExceptionEnum.unknown,
      );
    }
  }

  Future<Response> put(
    String uri, {
    Map<String, dynamic>? body,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: body,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e, s) {
      throw CustomException.exception(
        e: e,
        stack: s,
        error: ExceptionEnum.socket,
      );
    } on DioException catch (e, s) {
      if (e.error is SocketException) {
        throw CustomException.exception(
          e: e,
          stack: s,
          error: ExceptionEnum.socket,
        );
      } else {
        throw CustomException.dioException(
          e: e,
          stack: s,
          res: e.response,
        );
      }
    } catch (e, s) {
      throw CustomException.exception(
        e: e,
        stack: s,
        error: ExceptionEnum.unknown,
      );
    }
  }

  Future<Response> download({required String uri, required String path}) async {
    try {
      final Response response = await _dio.download(uri, path);
      return response;
    } on DioException catch (e, s) {
      throw CustomException.dioException(
        e: e,
        stack: s,
        res: e.response,
      );
    } on SocketException catch (e, s) {
      throw CustomException.exception(
        e: e,
        stack: s,
        error: ExceptionEnum.socket,
      );
    } catch (e, s) {
      throw CustomException.exception(
        e: e,
        stack: s,
        error: ExceptionEnum.unknown,
      );
    }
  }
}
