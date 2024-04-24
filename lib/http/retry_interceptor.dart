import 'dart:async';
import 'dart:io';

import 'http.dart';

/// 重连拦截器
class RetryOnConnectionChangeInterceptor extends Interceptor {
  final ConnectivityRequestRetry requestRetry;

  RetryOnConnectionChangeInterceptor({
    required this.requestRetry,
  });

  @override
  Future onError(DioError err, handler) async {
    if (_shouldRetry(err)) {
      try {
        return requestRetry.scheduleRequestRetry(err.requestOptions);
      } catch (e) {
        return e;
      }
    }
    return handler.next(err);
  }

  bool _shouldRetry(DioError err) {
    // return err.type == DioErrorType.other && err.error != null && err.error is SocketException;
    return err.type == DioExceptionType.unknown && err.error != null && err.error is SocketException;
  }
}

class ConnectivityRequestRetry {
  final Dio dio;
  final Connectivity connectivity;

  ConnectivityRequestRetry({
    required this.dio,
    required this.connectivity,
  });

  Future<Response> scheduleRequestRetry(RequestOptions requestOptions) async {
    StreamSubscription? streamSubscription;
    final responseCompleter = Completer<Response>();

    streamSubscription = connectivity.onConnectivityChanged.listen(
      (connectivityResult) {
        if (connectivityResult != ConnectivityResult.none) {
          if (streamSubscription != null) {
            streamSubscription.cancel();
          }

          responseCompleter.complete(
            dio.request(requestOptions.path,
                cancelToken: requestOptions.cancelToken,
                data: requestOptions.data,
                onReceiveProgress: requestOptions.onReceiveProgress,
                onSendProgress: requestOptions.onSendProgress,
                queryParameters: requestOptions.queryParameters,
                options: Options(
                  method: requestOptions.method,
                  sendTimeout: requestOptions.sendTimeout,
                  receiveTimeout: requestOptions.receiveTimeout,
                  extra: requestOptions.extra,
                  headers: requestOptions.headers,
                  responseType: requestOptions.responseType,
                  contentType: requestOptions.contentType,
                  validateStatus: requestOptions.validateStatus,
                  receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
                  followRedirects: requestOptions.followRedirects,
                  maxRedirects: requestOptions.maxRedirects,
                  requestEncoder: requestOptions.requestEncoder,
                  responseDecoder: requestOptions.responseDecoder,
                  listFormat: requestOptions.listFormat,
                )),
          );
        }
      },
    );

    return responseCompleter.future;
  }
}
