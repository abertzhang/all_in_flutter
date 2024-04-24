import 'dart:io';

import 'package:dio/dio.dart';

/*
class DioException implements Exception{}
enum DioExceptionType {
  connectionTimeout,
  sendTimeout,
  receiveTimeout,
  badCertificate,
  badResponse,
  cancel,
  connectionError,
  unknown,
}

*/
class AppDioError implements Exception {
  final String? _message;
  final int? _code;
  AppDioError([this._code, this._message]);

  @override
  String toString() => 'msg:$_message  code:$_code';

  factory AppDioError.create(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
        return BadRequestException(-1, "connection timeout-服务器连接超时");
      case DioExceptionType.sendTimeout:
        return BadRequestException(-1, "send timeout-服务器请求时间超时");
      case DioExceptionType.receiveTimeout:
        return BadRequestException(-1, "receive timeout-服务器接收时间超时");
      case DioExceptionType.badCertificate:
        return BadRequestException(-1, 'bad certificate');
      case DioExceptionType.badResponse:
        return BadRequestException(-1, 'bad response');
      case DioExceptionType.cancel:
        return BadRequestException(-1, '服务器取消请求');
      case DioExceptionType.connectionError:
        return BadRequestException(-1, 'connection error');
      case DioExceptionType.unknown: //未知错误根据自定义再分类
        return _handleCustomErrorCode(exception);
    }
  }

  ///处理自定义错误码
  static AppDioError _handleCustomErrorCode(DioException exception) {
    int errCode = exception.response?.statusCode ?? 0;
    switch (errCode) {
      case 400:
        return BadRequestException(errCode, "服务器错误的请求");
      case 401:
        return UnauthorisedException(errCode, "服务器无权限");
      case 403:
        return UnauthorisedException(errCode, "服务器资源不可用");
      case 404:
        return UnauthorisedException(errCode, "服务器链接错误");
      case 405:
        return UnauthorisedException(errCode, "服务器不允许此方法");
      case 500:
        return UnauthorisedException(errCode, "服务器内部错误");
      case 502:
        return UnauthorisedException(errCode, "服务器网关故障");
      case 503:
        return UnauthorisedException(errCode, "服务器不可用");
      case 505:
        return UnauthorisedException(errCode, "服务器版本错误");
      default:
        return AppDioError(errCode, '服务器其他错误');
    }
  }
}

///请求错误
class BadRequestException extends AppDioError {
  BadRequestException([int? code, String? message]) : super(code, message);
}

/// 未认证异常
class UnauthorisedException extends AppDioError {
  UnauthorisedException([int? code, String? message]) : super(code, message);
}

///SocketException错误
class DioSocketException extends SocketException {
  @override
  late String message;

  DioSocketException(
    message, {
    osError,
    address,
    port,
  }) : super(message, osError: osError, address: address, port: port);
}
