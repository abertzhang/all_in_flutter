/*
 * create by abert.zhang ， E-mail：z_chunhua@126.com
 *
 */

import 'app_exception.dart';
import 'http.dart';

/// request拦截器
class RequestInterceptor extends Interceptor {
  //是否有网
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!await isConnected()) {
      var errNet = DioError(requestOptions: options, error: AppException(-1, '无可用网络,请检查网络!'));
    }
    return super.onRequest(options, handler);
  }
}
