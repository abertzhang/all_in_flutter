import 'package:dio/dio.dart';

class NetDioUtil {
  //单例
  NetDioUtil._() {
    init();
  }
  static final NetDioUtil _singleton = NetDioUtil._();
  factory NetDioUtil() => _singleton;

  ///
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

  ///初始化
  void init() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = BaseOptions(
      connectTimeout: Duration(milliseconds: timeoutConnect),
      receiveTimeout: Duration(milliseconds: timeoutReceive),
      headers: {},
    );
    _dio = Dio(options);
  }
}
