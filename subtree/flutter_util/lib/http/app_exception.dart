/*
 * create by abert.zhang ， E-mail：z_chunhua@126.com
 *
 */
import 'dart:io';

import 'http.dart';

/// 自定义异常
class AppException implements Exception {
  final String? _message;
  final int? _code;

  AppException([this._code, this._message]);

  @override
  String toString() => "$_message  $_code";

  factory AppException.create(DioError error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        {
          return BadRequestException(-1, '服务器取消请求');
        }
      // case DioExceptionType.connectTimeout:
      case DioExceptionType.connectionTimeout:
        {
          return BadRequestException(-1, "服务器连接超时");
        }
      case DioExceptionType.sendTimeout:
        {
          return BadRequestException(-1, "服务器请求时间超时");
        }
      case DioExceptionType.receiveTimeout:
        {
          return BadRequestException(-1, "服务器接收时间超时");
        }
      // case DioExceptionType.response:
      case DioExceptionType.badResponse:
        {
          try {
            int errCode = error.response?.statusCode ?? 0;

            switch (errCode) {
              case 400:
                {
                  return BadRequestException(errCode, "服务器错误的请求");
                }
              case 401:
                {
                  return UnauthorisedException(errCode, "服务器无权限");
                }
              case 403:
                {
                  return UnauthorisedException(errCode, "服务器资源不可用");
                }

              case 404:
                {
                  return UnauthorisedException(errCode, "服务器链接错误");
                }
              case 405:
                {
                  return UnauthorisedException(errCode, "服务器不允许此方法");
                }

              case 500:
                {
                  return UnauthorisedException(errCode, "服务器内部错误");
                }
              case 502:
                {
                  return UnauthorisedException(errCode, "服务器网关故障");
                }
              case 503:
                {
                  return UnauthorisedException(errCode, "服务器不可用");
                }
              case 505:
                {
                  return UnauthorisedException(errCode, "服务器版本错误");
                }
              default:
                {
                  return AppException(errCode, '服务器其他错误');
                }
            }
          } on Exception catch (_) {
            return AppException(-1, "服务器未知错误");
          }
        }
      default:
        {
          return AppException(-1, '服务器连接异常');
        }
    }
  }
}

/// 请求错误
class BadRequestException extends AppException {
  BadRequestException([int? code, String? message]) : super(code, message);
}

/// 未认证异常
class UnauthorisedException extends AppException {
  UnauthorisedException([int? code, String? message]) : super(code, message);
}

//
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
