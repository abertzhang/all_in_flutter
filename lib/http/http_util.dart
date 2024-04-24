import 'http.dart';
import 'request_interceptor.dart';

class HttpUtil {
  //单例
  factory HttpUtil() => _singleton;
  static final HttpUtil _singleton = HttpUtil._();
  HttpUtil._() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = BaseOptions(
      connectTimeout: Duration(milliseconds: timeoutConnect),
      receiveTimeout: Duration(milliseconds: timeoutReceive),
      headers: {},
    );

    _dio = Dio(options);

    //添加拦截器
    _dio.interceptors.add(ErrorInterceptor());
    //
    // //拦截无效token--错误code-401，路由到登陆页面
    // dio.interceptors.add(ErrorTokenInterceptor());

    // 添加内存缓存
    if (isCache) {
      _dio.interceptors.add(NetCacheInterceptor());
    }

    // 添加重连机制
    if (isRetry) {
      _dio.interceptors.add(
        RetryOnConnectionChangeInterceptor(
          requestRetry: ConnectivityRequestRetry(dio: _dio, connectivity: Connectivity()),
        ),
      );
    }
    //request拦截器
    _dio.interceptors.add(RequestInterceptor());

    // 添加日志拦截
    if (kDebugMode) {
      _dio.interceptors.add(DioLogInterceptor());
    }

    // //初始化cookie
    // String path = DirectoryUtil.getAppDocPath() ?? "";
    // if (ObjectUtil.isEmpty(path)) {
    //   var cookieJar = PersistCookieJar(ignoreExpires: true, storage: FileStorage("$path/.cookies/"));
    //   dio.interceptors.add(CookieManager(cookieJar));
    // }
    // // 自定义 Response拦截器
    // dio.interceptors.add(ResponseInterceptors());
    //
  }
  //------------------------------------------------------

  //定义
  late Dio _dio;
  //超时时间,响应流上前后两次接受到数据的间隔，单位为毫秒。
  int timeoutConnect = 1000 * 10;
  int timeoutReceive = 1000 * 10;
  //是否重连
  bool isRetry = true;
  //是否启用缓存
  bool isCache = false;
  String keyToken = 'keyToken';
  String headerKeyToken = 'Authorization';
  //取消请求
  final CancelToken _cancelToken = CancelToken();
  //token失效无错码
  int errTokenCode = -1;

  //
  //------------------------------------------------------

  //从本地读取token值,并返回headers
  Map<String, dynamic>? getAuthorizationHeader() {
    Map<String, dynamic>? headers;
    String accessToken = SpUtil.getString(keyToken) ?? '';

    if (ObjectUtil.isEmpty(accessToken)) {
      headers = {headerKeyToken: accessToken};
    }
    return headers;
  }

  ///初始化公共属性
  ///
  /// [baseUrl] 地址前缀
  /// [connectTimeout] 连接超时赶时间
  /// [receiveTimeout] 接收超时赶时间
  /// [interceptors] 基础拦截器
  void init({
    String? baseUrl,
    int? connectTimeout,
    int? receiveTimeout,
    List<Interceptor>? interceptors,
    int? errTokenCode,
  }) {
    this.errTokenCode = errTokenCode ?? -1;
    _dio.options = _dio.options.copyWith(
      baseUrl: baseUrl,
      connectTimeout: Duration(milliseconds: connectTimeout ?? 1),
      receiveTimeout: Duration(milliseconds: receiveTimeout ?? 1),
      headers: {},
    );
    if (interceptors != null && interceptors.isNotEmpty) {
      _dio.interceptors.addAll(interceptors);
    }
  }

  // 设置headers
  void setHeaders(Map<String, dynamic> map) {
    _dio.options.headers.addAll(map);
  }

  void clearHeaders() {
    _dio.options.headers.clear();
  }

  // 关闭dio
  void cancelRequests({CancelToken? token}) {
    token ?? _cancelToken.cancel("cancelled");
  }

  //添加中间件
  void addInterceptor(Interceptor interceptor) {
    _dio.interceptors.add(interceptor);
  }

  //Restful风格
  //get
  Future get(
    String path, {
    Map<String, dynamic>? params,
    String? baseUrl,
    Options? options,
    CancelToken? cancelToken,
    bool refresh = false,
    bool? noCache,
    String? cacheKey,
    bool cacheDisk = false,
  }) async {
    if (baseUrl != null) _dio.options.baseUrl = baseUrl;
    // Options requestOptions = options ?? Options();
    // requestOptions = requestOptions.copyWith(extra: {
    //   "refresh": refresh,
    //   "noCache": noCache ?? isCache,
    //   "cacheKey": cacheKey,
    //   "cacheDisk": cacheDisk,
    // });
    // Map<String, dynamic>? headerToken = getAuthorizationHeader();
    // if (headerToken != null) {
    //   requestOptions = requestOptions.copyWith(headers: headerToken);
    // }

    Response response = await _dio.get(
      path,
      queryParameters: params,
      options: options, //requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  //post
  Future post(
    String path, {
    data,
    Map<String, dynamic>? params,
    String? baseUrl,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    if (baseUrl != null) _dio.options.baseUrl = baseUrl;
    // Options requestOptions = options ?? Options();
    // Map<String, dynamic>? headerToken = getAuthorizationHeader();
    // if (headerToken != null) {
    //   requestOptions = requestOptions.copyWith(headers: headerToken);
    // }
    Response response = await _dio.post(
      path,
      data: data,
      queryParameters: params,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  //put
  Future put(
    String path, {
    data,
    Map<String, dynamic>? params,
    String? baseUrl,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    if (baseUrl != null) _dio.options.baseUrl = baseUrl;
    // Options requestOptions = options ?? Options();
    //
    // Map<String, dynamic>? headerToken = getAuthorizationHeader();
    // if (headerToken != null) {
    //   requestOptions = requestOptions.copyWith(headers: headerToken);
    // }

    Response response = await _dio.put(
      path,
      data: data,
      queryParameters: params,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  /// restful patch 操作
  Future patch(
    String path, {
    data,
    Map<String, dynamic>? params,
    String? baseUrl,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    if (baseUrl != null) _dio.options.baseUrl = baseUrl;
    //
    // Options requestOptions = options ?? Options();
    // Map<String, dynamic>? headerToken = getAuthorizationHeader();
    // if (headerToken != null) {
    //   requestOptions = requestOptions.copyWith(headers: headerToken);
    // }

    var response = await _dio.patch(
      path,
      data: data,
      queryParameters: params,
      options: options, //requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  //delete
  Future delete(
    String path, {
    data,
    Map<String, dynamic>? params,
    String? baseUrl,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    if (baseUrl != null) _dio.options.baseUrl = baseUrl;
    //
    // Options requestOptions = options ?? Options();
    // Map<String, dynamic>? headerToken = getAuthorizationHeader();
    // if (headerToken != null) {
    //   requestOptions = requestOptions.copyWith(headers: headerToken);
    // }

    var response = await _dio.delete(
      path,
      data: data,
      queryParameters: params,
      options: options, //requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }

  //post form 表单提交操作
  Future postForm(
    String path, {
    required Map<String, dynamic> params,
    String? baseUrl,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    if (baseUrl != null) _dio.options.baseUrl = baseUrl;
    //
    // Options requestOptions = options ?? Options();
    // Map<String, dynamic>? headerToken = getAuthorizationHeader();
    // if (headerToken != null) {
    //   requestOptions = requestOptions.copyWith(headers: headerToken);
    // }

    Response response = await _dio.post(
      path,
      data: FormData.fromMap(params),
      options: options, //requestOptions,
      cancelToken: cancelToken ?? _cancelToken,
    );
    return response.data;
  }
}
