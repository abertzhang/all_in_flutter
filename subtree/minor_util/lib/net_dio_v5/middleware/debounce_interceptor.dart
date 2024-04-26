/*
网络请求驱虫拦截器
*/

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DebounceInterceptor extends Interceptor {
  ///保存每个请求的CancelToken
  static final Map<String, CancelToken> _cancelTokenMap = {};

  ///保存每个请求的url和params的序列化对应关系
  static final Map<String, String> _urlParamsMap = {};

  ///请求拦截
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
      parameters = _generateParameters(method, options);
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

  ///拦截结果
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handleEndWithRequestOption(response.requestOptions);
    super.onResponse(response, handler);
  }

  ///拦截错误
  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    //请求错误也需要处理清除缓存和Loading的逻辑
    handleEndWithRequestOption(err.requestOptions);
    super.onError(err, handler);
  }

  ///添加CancelToken逻辑
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

  ///移除CancelToken的逻辑
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

  //
  void _handleNetworkDebounce(
    String url,
    String method,
    Map<String, dynamic>? params,
    CancelToken? cancelToken,
    RequestOptions options,
    RequestInterceptorHandler handler,
    bool showLoading,
  ) async {
    if (params == null) {
      if (showLoading) {
        //SmartDialog.showLoading();
      }
      handler.next(options);
    } else {
      addCancelToken(url, method, params, cancelToken, options);
      //加CancelToken之后
      //拿到当前的url对应map数据
      final urlKey = _generateKeyByMethodUrl(method, url);
      debugPrint("请求前先查询 _urlParamsMap 集合目前的数据:${_urlParamsMap.toString()} _cancelTokenMap：${_cancelTokenMap.toString()}");
      final preSerializedParams = _urlParamsMap[urlKey];
      final curSerializedParams = _serializeAllParams(params);
      debugPrint("已缓存的请求参数Value cachedValue:${preSerializedParams.toString()} 当前正在发起的请求的参数Value:${curSerializedParams.toString()}");
      if (preSerializedParams == null) {
        //说明没有缓存,添加缓存
        _urlParamsMap[urlKey] = curSerializedParams;
        //正常请求
        if (showLoading) {
          //SmartDialog.showLoading();
        }
        handler.next(options);
      } else {
        //有缓存对比
        if (curSerializedParams == preSerializedParams) {
          //如果两者相同,说明是重复的请求,舍弃当前的请求
          debugPrint("是重复的请求，舍弃当前的请求");
          handler.resolve(
            Response(
                requestOptions: RequestOptions(),
                statusCode: 601, //ApiConstants.networkDebounceCode,
                statusMessage: 'Request canceled'),
          );
        } else {
          //如果两者不相，说明不是重复的请求，需要取消之前的网络请求，发起新的请求
          debugPrint("不是重复的请求，需要取消之前的网络请求，发起新的请求");
          //拿到当前请求的cancelToken
          final previousCancelKey = '$urlKey - $preSerializedParams';
          final previousCancelToken = _cancelTokenMap[previousCancelKey];
          if (previousCancelToken != null) {
            previousCancelToken.cancel('Request cancel');
            _urlParamsMap.remove(urlKey);
            _cancelTokenMap.remove(previousCancelToken);
          }
          //添加缓存
          _urlParamsMap[urlKey] = curSerializedParams;
          //加CancelToken之后正常请求
          addCancelToken(url, method, params, cancelToken, options);
          handler.next(options);
        }
      }
    }
  }

  //根据请求方式和Url生成Key
  String _generateKeyByMethodUrl(String method, String url) {
    return "$method - $url";
  }

  //CancelToken Map 的 Key 生成
  String _generateCancelKey(String method, String url, Map<String, dynamic>? map) {
    return "${_generateKeyByMethodUrl(method, url)} - ${_serializeAllParams(map)}";
  }

  //参数序列化为唯一字符串
  String _serializeAllParams(Map<String, dynamic>? map) {
    if (map == null || map.isEmpty) {
      return '';
    }
    return map.toString();
  }

  void handleEndWithRequestOption(RequestOptions requestOptions) {
    final Map<String, dynamic> requestHeaders = requestOptions.headers;
    final isShowLoadingDialog = requestHeaders['is_show_loading_dialog'] != null && requestHeaders['is_show_loading_dialog'] == 'true';

    if (requestHeaders['network_debounce'] != null && requestHeaders['network_debounce'] == 'true') {
      //请求完成之后移除CancelToken，和 Params Map
      final url = requestOptions.uri.path;
      final method = requestOptions.method;
      Map<String, dynamic>? params = _generateParameters(method, requestOptions);

      final urlkey = _generateKeyByMethodUrl(method, url);
      _urlParamsMap.remove(urlkey);

      removeCancelToken(url, method, params);

      debugPrint("网络请求去重的全部流程完成，移除Map内存缓存完成");
    }

    if (isShowLoadingDialog) {
      // SmartDialog.dismiss(status: SmartStatus.loading);
    }
  }
}
