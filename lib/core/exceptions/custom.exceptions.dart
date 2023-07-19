import 'dart:async';

import 'package:dio/dio.dart';
import 'package:limonfy/core/enum/exceptions.enum.dart';

class CustomException implements Exception {
  final int status;
  final dynamic data;
  final String message;
  final ExceptionEnum error;

  const CustomException({
    required this.status,
    required this.error,
    required this.data,
    required this.message,
  });

  factory CustomException.unknown({
    required dynamic e,
    required StackTrace stack,
  }) {
    Zone.current.handleUncaughtError(e, stack);
    return CustomException(
      status: 500,
      data: null,
      error: ExceptionEnum.internal,
      message: e.toString(),
    );
  }

  factory CustomException.dioException({
    required dynamic e,
    required StackTrace stack,
    required Response? res,
  }) {
    return CustomException(
      status: res?.statusCode ?? 500,
      data: res?.data,
      error: ExceptionEnum.request,
      message: res != null &&
              res.data != null &&
              res.data is Map &&
              res.data['message'] != null
          ? res.data['message']
          : res?.statusMessage ?? '',
    );
  }

  factory CustomException.exception({
    required dynamic e,
    required StackTrace stack,
    required ExceptionEnum error,
  }) {
    Zone.current.handleUncaughtError(e, stack);
    return CustomException(
      status: 500,
      data: null,
      error: error,
      message: e.toString(),
    );
  }
}
