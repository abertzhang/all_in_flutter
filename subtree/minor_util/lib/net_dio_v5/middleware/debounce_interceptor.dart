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
    if (headers['network_debounce'] != null && headers['network_debounce'] == 'true') {
      //需要处理请求防抖去重
      parameters;
    } else {
      if (isShowLoading) {
        //显示等待框
      }
      //处理去重
      super.onRequest(options, handler);
    }
    super.onRequest(options, handler);
  }

  //根据请求方式生成不同的参数格式
  Map<String, dynamic>? _generateParameters(String method, RequestOptions options) {
    if (method == 'GET') {
      return options.queryParameters;
    }
    if (method == 'POST' && options.data is FormData) {
      final formData = options.data as FormData;
      final Map<String, dynamic> map = {};
      //添加formData,fields到映射中
      for (final field in formData.fields) {
        map[field.key] = field.value;
      }
      return map;
    }
    return null;
  }

  //添加CancelToken逻辑
  void addCancelToken(
    String url,
    String method,
    Map<String, dynamic>? params,
    CancelToken? cancelToken,
    RequestOptions options,
  ) {
    final cancelKey = _generateCancelKey(method, url, params);
    cancelToken ??= CancelToken();
    _cancelTokenMap[cancelKey] = cancelToken;
    options.cancelToken = cancelToken;
  }

  //移除CancelToken的逻辑
  void removeCancelToken(
    String url,
    String method,
    Map<String, dynamic>? params,
  ) {
    //自动添加CancelToken的逻辑
    final cancelKey = _generateCancelKey(method, url, params);
    if (_cancelTokenMap[cancelKey] != null) {
      _cancelTokenMap.remove(cancelKey);
    }
  }

  //CancelToken Map 的 Key 生成
  String _generateCancelKey(String method, String url, Map<String, dynamic>? map) {
    return "${_generateKeyByMethodUrl(method, url)} - ${_serializeAllParams(map)}";
  }

  //根据请求方式和Url生成Key
  String _generateKeyByMethodUrl(String method, String url) {
    return "$method - $url";
  }

  //参数序列化为唯一字符串
  String _serializeAllParams(Map<String, dynamic>? map) {
    if (map == null || map.isEmpty) {
      return '';
    }
    return map.toString();
  }
}
