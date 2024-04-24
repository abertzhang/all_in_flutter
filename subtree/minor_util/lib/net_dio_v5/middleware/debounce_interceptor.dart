/*
网络请求驱虫拦截器
*/

import 'package:dio/dio.dart';

class DebounceInterceptor extends Interceptor {
  //保存每个请求的CancelToken
  static final Map<String, CancelToken> _cancelTokenMap = {};
  //保存每个请求的url和params的序列化对应关系
  static final Map<String, String> _urlParamsMap = {};
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Map<String, dynamic>? parameters;
    final url = options.uri.path;
    final method = options.method;
    CancelToken? cancelToken = options.cancelToken;
    Map<String, dynamic> headers = options.headers;
    final isShowLoading = headers['is_show_loading'] != null && headers['is_show_loading'] == 'true';
    if (headers['network_debounce'] != null && headers['network_debounce'] == 'true') {}
    super.onRequest(options, handler);
  }
}
