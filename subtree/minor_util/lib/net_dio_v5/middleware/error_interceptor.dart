import '../net_dio.dart';

/// 错误处理拦截器
class ErrorInterceptor extends Interceptor {
  @override
  // Future onError(DioError err, handler) async {
  Future onError(DioException err, handler) async {
    Future.delayed(const Duration(seconds: 1));
    DioException? dioException = err.copyWith();
    if (err.error is SocketException) {
      var error = err.error as SocketException;
      // dioException.copyWith(
      //     error: DioSocketException(
      //   err.message,
      //   osError: error.osError,
      //   address: error.address,
      //   port: error.port,
      // ));
    }
    // error统一处理
    AppDioError appException = AppDioError.create(dioException);
    // if (err.type == DioExceptionType.unknown) {
    //   bool isConnectNetWork = await isConnected();
    //   if (!isConnectNetWork && err.error is DioSocketException) {
    //     appException = AppException(-1, "当前无网络，请检查!");
    //   }
    // }

    //  .error = appException;
    var dioErr = err.copyWith(error: appException);
    return super.onError(dioErr, handler);
  }
}
