import 'http.dart';

class ErrorTokenInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data['code'] == 401) {
      if (kDebugMode) {
        print('2000000');
      }
      super.onResponse(response, handler);
      // getX.Get.offAllNamed(RouterLogin.login);
      return;
    }
    return super.onResponse(response, handler);
  }
}
