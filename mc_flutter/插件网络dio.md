### 依赖导包

```
dependencies:
  dio: #latest version
import 'package:dio/dio.dart';
```

### 用途用法



### 配置Dio

```
// with default Options
Dio dio = new Dio(); 
// Set default configs
dio.options.baseUrl = "https://www.xx.com/api";
dio.options.connectTimeout = 5000; //5s
dio.options.receiveTimeout = 3000;

// or new Dio with a BaseOptions instance.
BaseOptions options = new BaseOptions(
    baseUrl: "https://www.xx.com/api",
    connectTimeout: 5000,
    receiveTimeout: 3000,
);
Dio dio = new Dio(options);
```

### 简例01

```
import 'package:dio/dio.dart';
void getHttp() async {
  try {
    Response response = await Dio().get("http://www.google.cn");
    print(response);
  } catch (e) {
    print(e);
  }
}
```

### 类Dio 

##### 继承关系

```
Implementers
DioForBrowser 
DioForNative 
DioMixin
```

##### 构造函数

```
Dio([BaseOptions options])
```

##### 常用方法

```
clear() → void
close({bool force = false}) → void
lock() → void
unlock() → void
reject<T>(dynamic err) → Future<Response<T>>
resolve<T>(dynamic response) → Future<Response<T>>
```
##### 方法delete及同类

```
delete<T>(
    String path, 
    {dynamic data, 
    Map<String, dynamic> queryParameters,
    Options options, 
    CancelToken cancelToken
}) → Future<Response<T>>
```

```
deleteUri<T>(Uri uri, {dynamic data, Options options, CancelToken cancelToken}) → Future<Response<T>>
```
##### 方法download及同类

```
download(
String urlPath, 
dynamic savePath, 
{ProgressCallback onReceiveProgress,
Map<String, dynamic> queryParameters,
CancelToken cancelToken, 
bool deleteOnError = true, 
String lengthHeader = Headers.contentLengthHeader, 
dynamic data, 
Options options
}) → Future<Response>
```

```
downloadUri(Uri uri, dynamic savePath, {ProgressCallback onReceiveProgress, CancelToken cancelToken, bool deleteOnError = true, String lengthHeader = Headers.contentLengthHeader, dynamic data, Options options}) → Future<Response>
```
##### 方法get及同类
```
get<T>(
    String path, 
    {Map<String, dynamic> queryParameters, 
    Options options, 
    CancelToken cancelToken, 
    ProgressCallback onReceiveProgress
}) → Future<Response<T>>
```

```
getUri<T>(
Uri uri, 
{Options options, 
CancelToken cancelToken, 
ProgressCallback onReceiveProgress
}) → Future<Response<T>>
```
##### 方法head及同类
```
head<T>(String path, {dynamic data, Map<String, dynamic> queryParameters, Options options, CancelToken cancelToken}) → Future<Response<T>>
```

```
headUri<T>(Uri uri, {dynamic data, Options options, CancelToken cancelToken}) → Future<Response<T>>
```
##### 方法patch及同类
```
patch<T>(String path, {dynamic data, Map<String, dynamic> queryParameters, Options options, CancelToken cancelToken, ProgressCallback onSendProgress, ProgressCallback onReceiveProgress}) → Future<Response<T>>
```

```
patchUri<T>(Uri uri, {dynamic data, Options options, CancelToken cancelToken, ProgressCallback onSendProgress, ProgressCallback onReceiveProgress}) → Future<Response<T>>
```
##### 方法post及同类
```
post<T>(String path, {dynamic data, Map<String, dynamic> queryParameters, Options options, CancelToken cancelToken, ProgressCallback onSendProgress, ProgressCallback onReceiveProgress}) → Future<Response<T>>
```

```
postUri<T>(Uri uri, {dynamic data, Options options, CancelToken cancelToken, ProgressCallback onSendProgress, ProgressCallback onReceiveProgress}) → Future<Response<T>>
```
##### 方法put及同类
```
put<T>(
    String path, 
    {dynamic data, 
    Map<String, dynamic> queryParameters, 
    Options options, 
    CancelToken cancelToken, 
    ProgressCallback onSendProgress, 
    ProgressCallback onReceiveProgress
}) → Future<Response<T>>
```

```
putUri<T>(Uri uri, {dynamic data, Options options, CancelToken cancelToken, ProgressCallback onSendProgress, ProgressCallback onReceiveProgress}) → Future<Response<T>>
```
##### 方法request及同类
```
requestUri<T>(Uri uri, {dynamic data, CancelToken cancelToken, Options options, ProgressCallback onSendProgress, ProgressCallback onReceiveProgress}) → Future<Response<T>>
```

```
request<T>(
    String path, 
    {dynamic data, 
    Map<String, dynamic> queryParameters, 
    CancelToken cancelToken, 
    Options options, 
    ProgressCallback onSendProgress, 
    ProgressCallback onReceiveProgress
}) → Future<Response<T>>
```

##### 枚举类DioErrorType

```
CANCEL → const DioErrorType
CONNECT_TIMEOUT → const DioErrorType
DEFAULT → const DioErrorType
RECEIVE_TIMEOUT → const DioErrorType
RESPONSE → const DioErrorType
SEND_TIMEOUT → const DioErrorType
values → const List<DioErrorType>
```

##### 枚举类ResponseType3

```
bytes → const ResponseType//index: 3
json → const ResponseType//0
plain → const ResponseType//2
stream → const ResponseType//1
values → const List<ResponseType>
```

```
Response rs = await Dio().get( 
url, 
options: Options( responseType: ResponseType.stream
) );
```

### 类Response

##### 构造函数

```
Response({
    T data, 
    Headers headers, 
    RequestOptions request, 
    bool isRedirect, 
    int statusCode, 
    String statusMessage, 
    List<RedirectRecord> redirects,
    Map<String, dynamic> extra
})
```

##### 常用属性

```
data ↔ T
extra ↔ Map<String, dynamic>
headers ↔ Headers
isRedirect → bool
realUri → Uri
redirects ↔ List<RedirectRecord>
request ↔ RequestOptions
statusCode ↔ int
statusMessage ↔ String
```

### 类ResponseBody

##### 构造函数

```
ResponseBody(
    Stream<Uint8List> stream, 
    int statusCode, 
    {Map<String, List<String>> headers, 
    String statusMessage, 
    bool isRedirect, 
    List<RedirectRecord> redirects
})
```

```
ResponseBody.fromBytes(
    List<int> bytes, 
    int statusCode, 
    {Map<String, List<String>> headers, 
    String statusMessage, 
    bool isRedirect
})
```

```
ResponseBody.fromString(
    String text, 
    int statusCode, 
    {Map<String, List<String>> headers, 
    String statusMessage, 
    bool isRedirect
})
```

##### 常用属性

```
stream ↔ Stream<Uint8List>
statusMessage ↔ String
statusCode ↔ int
redirects ↔ List<RedirectRecord>
isRedirect → bool
headers ↔ Map<String, List<String>>
extra ↔ Map<String, dynamic>
```

### 类Headers

##### 构造函数

```
Headers()
Headers.fromMap(
    Map<String, 
    List<String>> map
)
```

##### 常用方法

```
add(String name, String value) → void
clear() → void
forEach(HeaderForEachCallback f) → void
remove(String name, String value) → void
removeAll(String name) → void
set(String name, dynamic value) → void
value(String name) → String
```

##### 常量

```
acceptHeader → const String//'accept'
//'content-encoding'
contentEncodingHeader → const String
//'content-length'
contentLengthHeader → const String
//'content-type'
contentTypeHeader → const String
//'application/x-www-form-urlencoded'
formUrlEncodedContentType → const String
//'application/json; charset=utf-8'
jsonContentType → const String
//'www-authenticate'
wwwAuthenticateHeader → const String
```

### RedirectRecord

##### 构造函数

```
RedirectRecord(int statusCode, String method, Uri location)
```

##### 常用属性

```
location → Uri
method → String
statusCode → int
```

### 类DefaultTransformer

##### 继承关系

```
Inheritance
Object>>Transformer>>DefaultTransformer
```

##### 构造函数

```
DefaultTransformer({JsonDecodeCallback jsonDecodeCallback})
```

##### 常用方法

```
transformRequest(
RequestOptions options
) → Future<String>
```

```
transformResponse(
RequestOptions options, 
ResponseBody response
) → Future
```

### 类Transformer

##### 继承关系

```
Implementers
DefaultTransformer
```

##### 构造函数

```
Transformer()
```

##### 方法transformRequest

```
transformRequest(
	RequestOptions options	
) → Future<String>
```

##### 常用方法transformResponse

```
transformResponse(
    RequestOptions options, 
    ResponseBody response
) → Future
```

##### 静态方法

```
urlEncodeMap(Map map) → String

static String urlEncodeMap(Map map) {
  return encodeMap(map, (key, value) {
    if (value == null) return key;
    return '$key=${Uri.encodeQueryComponent(value.toString())}';
  });
}
```

### 类MultipartFile

##### 构造函数

```
MultipartFile(
    Stream<List<int>> stream, 
    int length, 
    {String filename, 
    MediaType contentType
})
```

```
MultipartFile.fromBytes(		//factory
    List<int> value, 
    {String filename, 
    MediaType contentType
})
```

```
MultipartFile.fromString(		//factory
    String value, 
    {String filename, 
    MediaType contentType
})
```

##### 常用属性

```
contentType → MediaType
filename → String
isFinalized → bool
length → int
```

##### 常用方法

```
finalize() → Stream<List<int>>
```

静态方法

```
fromFile(
    String filePath, 
    {String filename, 
    MediaType contentType
}) → Future<MultipartFile>
```

```
fromFileSync(
    String filePath, 
    {String filename, 
    MediaType contentType
}) → MultipartFile
```

### 类FormData

##### 构造函数

```
FormData()
FormData.fromMap(Map<String, dynamic> map)
```

##### 常用属性

```
boundary → String
fields → List<MapEntry<String, String>>
files → List<MapEntry<String, MultipartFile>>
isFinalized → bool
length → int
```

##### 常用方法

```
finalize() → Stream<List<int>>
readAsBytes() → Future<List<int>>

```

### 抽象类Exception

#### 源码

```dart
@pragma('flutter:keep-to-string-in-subtypes')
abstract class Exception {
  factory Exception([var message]) => _Exception(message);
}
///dart内部_Exception
/// Default implementation of [Exception] which carries a message.
class _Exception implements Exception {
  final dynamic message;

  _Exception([this.message]);

  String toString() {
    Object? message = this.message;
    if (message == null) return "Exception";
    return "Exception: $message";
  }
}
```

#### 继承关系

```dart
//子类继承-Implementers
DeferredLoadException
FormatException
IntegerDivisionByZeroException
IOException
IsolateSpawnException
MissingPluginException
NetworkImageLoadException
NullRejectionException
OSError
OutsideTestException
PathException
PictureRasterizationException
PlatformException
RemoteException
RPCError
SentinelException
SerializationException
SourceSpanException
TestFailure
TickerCanceled
TimeoutException
WebDriverException
```

### 类SocketException

#### 源码

```dart
class SocketException implements IOException {
  final String message;
  final OSError? osError;
  final InternetAddress? address;
  final int? port;
  const SocketException(this.message, {this.osError, this.address, this.port});
  const SocketException.closed()
      : message = 'Socket has been closed',
        osError = null,
        address = null,
        port = null;

  String toString() {
    StringBuffer sb = new StringBuffer();
    sb.write("SocketException");
    if (message.isNotEmpty) {
      sb.write(": $message");
      if (osError != null) {
        sb.write(" ($osError)");
      }
    } else if (osError != null) {
      sb.write(": $osError");
    }
    if (address != null) {
      sb.write(", address = ${address!.host}");
    }
    if (port != null) {
      sb.write(", port = $port");
    }
    return sb.toString();
  }
}
```

### 类DioError

#### 构造函数

```
DioError({
RequestOptions request, 
Response response, 
DioErrorType type = DioErrorType.DEFAULT, dynamic error
})
```

#### 常用属性

```
error ↔ dynamic
message → String
request ↔ RequestOptions
response ↔ Response
type ↔ DioErrorType
```

#### DioError源码

```dart
class DioError implements Exception {
  DioError({
    required this.requestOptions,
    this.response,
    this.type = DioErrorType.other,
    this.error,
  });
  RequestOptions requestOptions;
  Response? response;
  DioErrorType type;
  dynamic error;
  StackTrace? _stackTrace;
  set stackTrace(StackTrace? stack) => _stackTrace = stack;
  StackTrace? get stackTrace => _stackTrace;
  String get message => (error?.toString() ?? '');
  @override
  String toString() {
    var msg = 'DioError [$type]: $message';
    if (error is Error) {
      msg += '\n${(error as Error).stackTrace}';
    }
    if (_stackTrace != null) {
      msg += '\nSource stack:\n$stackTrace';
    }
    return msg;
  }
}
```

### 枚举类DioErrorType

```dart
enum DioErrorType {
  connectTimeout,
  sendTimeout,
  receiveTimeout,
  /// When the server response, but with a incorrect status, such as 404, 503...
  response,
  /// When the request is cancelled, dio will throw a error with this type.
  cancel,
  other,
}
```

### 封装思路

#### 建立HttpUtil单例

```dart
class HttpUtil {
  //单例
  factory HttpUtil() => _singleton;
  static final HttpUtil _singleton = HttpUtil._();
  HttpUtil._() {
 // BaseOptions、Options、RequestOptions 优先级递增，根据优先级别覆盖参数
    BaseOptions options = BaseOptions(
      connectTimeout: timeoutConnect,
      receiveTimeout: timeoutReceive,
      headers: {},
    );

    _dio = Dio(options);
    ...省略
  }
```

#### 新建成员变量

```dart
//根据定义的变量调整AppConfig内容
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
```



#### 初始化init方法

```dart
///可在启动runApp前使用HttpUtil().init()
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
    connectTimeout: connectTimeout,
    receiveTimeout: receiveTimeout,
    headers: {},
  );
  if (interceptors != null && interceptors.isN
    _dio.interceptors.addAll(interceptors);
  }
}
```

#### 其他方法

```dart
// 设置headers
void setHeaders(Map<String, dynamic> map) {
  _dio.options.headers.addAll(map);
}
//清空headers
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
```

#### 错误类的自定义

自定义AppException类

```dart
class AppException implements Exception {
  final String? _message;
  final int? _code;
  ...省略
}
```

自定义请求错误类

```dart
/// 请求错误
class BadRequestException extends AppException {
  BadRequestException([int? code, String? message]) : super(code, message);
}
```

未认证异常

```dart
/// 未认证异常
class UnauthorisedException extends AppException {
  UnauthorisedException([int? code, String? message]) : super(code, message);
}
```

自定义继承SockerException类

```dart
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
```

#### 各类拦截器

日志拦截器

重连拦截器

错误拦截器(断网的错误,token错误等)

缓存拦截器

请求拦截器

token错误拦截器

或者其他自定义的拦截器

#### 各种http方法

```dart
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

```

### 自定义日志拦截器

```dart
import 'http.dart';

/// 日志拦截器
class DioLogInterceptor extends Interceptor {
  @override
  onRequest(RequestOptions options, handler) async {
    String requestStr = "\n==================== REQUEST ====================\n"
        "- URL:\n${options.baseUrl + options.path}\n"
        "- METHOD: ${options.method}\n"
        "- PARAM: ${options.queryParameters}\n";

    final data = options.data;
    if (data != null) {
      if (data is Map)
        requestStr += "- BODY:\n${data.mapToStructureString()}\n";
      else if (data is FormData) {
        final formDataMap = Map()
          ..addEntries(data.fields)
          ..addEntries(data.files);
        requestStr += "- BODY:\n${formDataMap.mapToStructureString()}\n";
      } else
        requestStr += "- BODY:\n${data.toString()}\n";
    }
    requestStr += "- HEADER:\n${options.headers.mapToStructureString()}\n";
    printWrapped(requestStr);
    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, handler) async {
    String responseStr = "\n==================== RESPONSE ====================\n"
        "- URL:\n${response.requestOptions.uri}\n";
    // responseStr += "- HEADER:\n{";
    // response.headers.forEach(
    //     (key, list) => responseStr += "\n  " + "\"$key\" : \"$list\",");
    // responseStr += "\n}\n";
    responseStr += "- STATUS: ${response.statusCode}\n";

    if (response.data != null) {
      responseStr += "- BODY:\n ${_parseResponse(response)}";
    }
    printWrapped(responseStr);
    return super.onResponse(response, handler);
  }

  void printWrapped(String text) {
    final pattern = new RegExp('.{1,900}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  String _parseResponse(Response response) {
    String responseStr = "";
    var data = response.data;
    if (data is Map)
      responseStr += data.mapToStructureString();
    else if (data is List)
      responseStr += data.listToStructureString();
    else
      responseStr += response.data.toString();

    return responseStr;
  }
}

extension Map2StringEx on Map {
  String mapToStructureString({int indentation = 2}) {
    String result = "";
    String indentationStr = " " * indentation;
    if (true) {
      result += "{";
      this.forEach((key, value) {
        if (value is Map) {
          var temp = value.mapToStructureString(indentation: indentation + 2);
          result += "\n$indentationStr" + "\"$key\" : $temp,";
        } else if (value is List) {
          result += "\n$indentationStr" + "\"$key\" : ${value.listToStructureString(indentation: indentation + 2)},";
        } else {
          result += "\n$indentationStr" + "\"$key\" : \"$value\",";
        }
      });
      result = result.substring(0, result.length - 1);
      result += indentation == 2 ? "\n}" : "\n${" " * (indentation - 1)}}";
    }

    return result;
  }
}

extension List2StringEx on List {
  String listToStructureString({int indentation = 2}) {
    String result = "";
    String indentationStr = " " * indentation;
    if (true) {
      result += "$indentationStr[";
      this.forEach((value) {
        if (value is Map) {
          var temp = value.mapToStructureString(indentation: indentation + 2);
          result += "\n$indentationStr" + "\"$temp\",";
        } else if (value is List) {
          result += value.listToStructureString(indentation: indentation + 2);
        } else {
          result += "\n$indentationStr" + "\"$value\",";
        }
      });
      result = result.substring(0, result.length - 1);
      result += "\n$indentationStr]";
    }

    return result;
  }
}
```

### 自定义缓存拦截器

```dart
import 'dart:collection';

import 'package:flutter_common/utils/utils.dart';

import 'http.dart';

/// 缓存拦截器
class NetCacheInterceptor extends Interceptor {
  // 缓存的最长时间，单位（秒）
  static const CACHE_MAX_TIME = 1000;

  // 最大缓存数
  static const CACHE_MAX_COUNT = 100;

  // 为确保迭代器顺序和对象插入时间一致顺序一致，我们使用LinkedHashMap
  var cache = LinkedHashMap<String, CacheObject>();

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (!HttpUtil().isCache) return handler.next(options);

    // refresh标记是否是刷新缓存
    bool refresh = options.extra["refresh"] == true;

    // 是否磁盘缓存
    bool cacheDisk = options.extra["cacheDisk"] == true;

    // 如果刷新，先删除相关缓存
    if (refresh) {
      // 删除uri相同的内存缓存
      delete(options.uri.toString());

      // 删除磁盘缓存
      if (cacheDisk) {
        await SpUtil.remove(options.uri.toString());
      }

      return handler.next(options);
    }

    // get 请求，开启缓存
    if (options.extra["noCache"] != true && options.method.toLowerCase() == 'get') {
      String key = options.extra["cacheKey"] ?? options.uri.toString();

      // 策略 1 内存缓存优先，2 然后才是磁盘缓存
      // 1 内存缓存
      var ob = cache[key];
      if (ob != null) {
        //若缓存未过期，则返回缓存内容
        if ((DateTime.now().millisecondsSinceEpoch - ob.timeStamp) / 1000 < CACHE_MAX_TIME) {
          return handler.resolve(cache[key]!.response);
        } else {
          //若已过期则删除缓存，继续向服务器请求
          cache.remove(key);
        }
      }

      // 2 磁盘缓存
      if (cacheDisk) {
        var cacheData = SpUtil.getObject(key);
        if (cacheData != null) {
          return handler.resolve(Response(
            statusCode: 200,
            data: cacheData,
            requestOptions: options,
          ));
        }
      }
    }
  }

  @override
  onResponse(Response response, handler) async {
    // 如果启用缓存，将返回结果保存到缓存
    if (HttpUtil().isCache) {
      await _saveCache(response);
    }
  }

  Future<void> _saveCache(Response object) async {
    RequestOptions options = object.requestOptions;

    // 只缓存 get 的请求
    if (options.extra["noCache"] != true && options.method.toLowerCase() == "get") {
      // 策略：内存、磁盘都写缓存

      // 缓存key
      String key = options.extra["cacheKey"] ?? options.uri.toString();

      // 磁盘缓存
      if (options.extra["cacheDisk"] == true) {
        await SpUtil.putObject(key, object.data);
      }

      // 内存缓存
      // 如果缓存数量超过最大数量限制，则先移除最早的一条记录
      if (cache.length == CACHE_MAX_COUNT) {
        cache.remove(cache[cache.keys.first]);
      }

      cache[key] = CacheObject(object);
    }
  }

  void delete(String key) {
    cache.remove(key);
  }
}

class CacheObject {
  CacheObject(this.response) : timeStamp = DateTime.now().millisecondsSinceEpoch;
  Response response;
  int timeStamp;

  @override
  bool operator ==(other) {
    return response.hashCode == other.hashCode;
  }

  @override
  int get hashCode => response.realUri.hashCode;
}
```

### 自定义错误拦截器

```dart
import 'dart:io';
import 'app_exception.dart';
import 'http.dart';
/// 错误处理拦截器
class ErrorInterceptor extends Interceptor {
  //是否有网
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
  @override
  Future onError(DioError err, handler) async {
    Future.delayed(Duration(seconds: 10));
    if (err.error is SocketException) {
      err.error = DioSocketException(
        err.message,
        osError: err.error?.osError,
        address: err.error?.address,
        port: err.error?.port,
      );
    }
    // error统一处理
    AppException appException = AppException.create(err);
    if (err.type == DioErrorType.other) {
      bool isConnectNetWork = await isConnected();
      if (!isConnectNetWork && err.error is DioSocketException) {
        appException = AppException(-1, "当前无网络，请检查!");
      }
    }
    err.error = appException;
    return super.onError(err, handler);
  }
}
```

### 自定义token错误拦截器

```dart
import 'package:flutter/foundation.dart';
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
```

### 自定义重连拦截器

```dart
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
    return err.type == DioErrorType.other && err.error != null && err.error is SocketException;
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
```

### 自定义response拦截器

```dart
/// 注意:根据自己需要修改,否则报错!!!
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'http.dart';
/// response拦截器
class ResponseInterceptors extends Interceptor {
  @override
  onResponse(Response response, handler) async {
    try {
      ///token失效处理
      if (response.statusCode == 200) {
        if (HttpUtil().errTokenCode > 0) {
          int code = 0;
          if (response.data is String) {
            Map<String, dynamic> maps = json.decode(response.data);
            code = maps["code"];
          } else {
            code = response.data['code'];
          }

          if (code == HttpUtil().errTokenCode) {
            // ToastUtils.error('用户登录失效，请重新登录');
            // 延迟退出
            Future.delayed(const Duration(milliseconds: 500), () {
              // 退至登录页面
              // getUtil.Get.offAll(() => LoginPage(), transition: getUtil.Transition.rightToLeftWithFade);
            });

            return;
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        // print(e.toString(), tag: 'ResponseInterceptors');
        print(e.toString());
      }
    }

    return super.onResponse(response, handler);
  }
}
```

### request拦截器

```dart
/*
 * create by abert.zhang ， E-mail：z_chunhua@126.com
 *
 */
import 'package:flutter_common/http/app_exception.dart';
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
```

### 拦截器类Interceptor

#### 源码

```dart
class Interceptor {
  /// The callback will be executed before the request is initiated.
  /// If you want to continue the request, call [handler.next].
  /// If you want to complete the request with some custom data，
  /// you can resolve a [Response] object with [handler.resolve].
  /// If you want to complete the request with an error message,
  /// you can reject a [DioError] object with [handler.reject].
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) =>
      handler.next(options);

  /// The callback will be executed on success.
  /// If you want to continue the response, call [handler.next].
  ///
  /// If you want to complete the response with some custom data directly,
  /// you can resolve a [Response] object with [handler.resolve] and other
  /// response interceptor(s) will not be executed.
  ///
  /// If you want to complete the response with an error message,
  /// you can reject a [DioError] object with [handler.reject].
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) =>
      handler.next(response);

  /// The callback will be executed on error.
  /// If you want to continue the error , call [handler.next].
  /// If you want to complete the response with some custom data directly,
  /// you can resolve a [Response] object with [handler.resolve] and other
  /// error interceptor(s) will be skipped.
  /// If you want to complete the response with an error message directly,
  /// you can reject a [DioError] object with [handler.reject], and other
  ///  error interceptor(s) will be skipped.
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) =>
      handler.next(err);
}
```

### 预定义

```dart
typedef InterceptorSendCallback = void Function(
  RequestOptions options,
  RequestInterceptorHandler handler,
);
typedef InterceptorSuccessCallback = void Function(
  Response e,
  ResponseInterceptorHandler handler,
);

typedef InterceptorErrorCallback = void Function(
    DioError e, ErrorInterceptorHandler handler);

typedef ValidateStatus = bool Function(int? status);

typedef ResponseDecoder = String Function(
    List<int> responseBytes, RequestOptions options, ResponseBody responseBody);
typedef RequestEncoder = List<int> Function(
    String request, RequestOptions options);
typedef CancelWrapper = Future Function(Future);
typedef EnqueueCallback = FutureOr Function();
typedef HeaderForEachCallback = void Function(String name, List<String> values);
typedef InterceptorSendCallback = dynamic Function(RequestOptions options);
typedef InterceptorErrorCallback = dynamic Function(DioError e);
typedef InterceptorSuccessCallback = dynamic Function(Response e);
typedef JsonDecodeCallback = dynamic Function(String);
typedef ProgressCallback = void Function(int count, int total);
typedef RequestEncoder = List<int> Function(
    String request, RequestOptions options);
typedef ResponseDecoder = String Function(
    List<int> responseBytes, RequestOptions options, ResponseBody responseBody);
typedef ValidateStatus = bool Function(int status);
typedef VoidCallback = dynamic Function();
```

### 类_BaseHandler

```dart
class _BaseHandler {
  final _completer = Completer<InterceptorState>();
  void Function()? _processNextInQueue;
  Future<InterceptorState> get future => _completer.future;
  bool get isCompleted => _completer.isCompleted;
}
```

### 类ErrorInterceptorHandler

#### 源码

```dart
class ErrorInterceptorHandler extends _BaseHandler {
  /// Continue to call the next error interceptor.
  void next(DioError err) {
    _completer.completeError(
      InterceptorState<DioError>(err),
      err.stackTrace,
    );
    _processNextInQueue?.call();
  }
  /// Complete the request with Response object and other error interceptor(s) will not be executed.
  /// This will be considered a successful request!
  /// [response]: Response object to return.
  void resolve(Response response) {
    _completer.complete(InterceptorState<Response>(
      response,
      InterceptorResultType.resolve,
    ));
    _processNextInQueue?.call();
  }

  /// Complete the request with a error directly! Other error interceptor(s) will not be executed.
  void reject(DioError error) {
    _completer.completeError(
      InterceptorState<DioError>(
        error,
        InterceptorResultType.reject,
      ),
      error.stackTrace,
    );
    _processNextInQueue?.call();
  }
}
```

### 类RequestInterceptorHandler

```dart
class RequestInterceptorHandler extends _BaseHandler {
  /// Continue to call the next request interceptor.
  void next(RequestOptions requestOptions) {
    _completer.complete(InterceptorState<RequestOptions>(requestOptions));
    _processNextInQueue?.call();
  }

  /// Return the response directly! Other request interceptor(s) will not be executed,
  /// but response and error interceptor(s) may be executed, which depends on whether
  /// the value of parameter [callFollowingResponseInterceptor] is true.
  ///
  /// [response]: Response object to return.
  /// [callFollowingResponseInterceptor]: Whether to call the response interceptor(s).
  void resolve(Response response,
      [bool callFollowingResponseInterceptor = false]) {
    _completer.complete(
      InterceptorState<Response>(
        response,
        callFollowingResponseInterceptor
            ? InterceptorResultType.resolveCallFollowing
            : InterceptorResultType.resolve,
      ),
    );
    _processNextInQueue?.call();
  }

  /// Complete the request with an error! Other request/response interceptor(s) will not
  /// be executed, but error interceptor(s) may be executed, which depends on whether the
  /// value of parameter [callFollowingErrorInterceptor] is true.
  ///
  /// [error]: Error info to reject.
  /// [callFollowingErrorInterceptor]: Whether to call the error interceptor(s).
  void reject(DioError error, [bool callFollowingErrorInterceptor = false]) {
    _completer.completeError(
      InterceptorState<DioError>(
        error,
        callFollowingErrorInterceptor
            ? InterceptorResultType.rejectCallFollowing
            : InterceptorResultType.reject,
      ),
      error.stackTrace,
    );
    _processNextInQueue?.call();
  }
}
```

### 类ResponseInterceptorHandler

#### 源码

```dart
class ResponseInterceptorHandler extends _BaseHandler {
  /// Continue to call the next response interceptor.
  void next(Response response) {
    _completer.complete(
      InterceptorState<Response>(response),
    );
    _processNextInQueue?.call();
  }

  /// Return the response directly! Other response interceptor(s) will not be executed.
  /// [response]: Response object to return.
  void resolve(Response response) {
    _completer.complete(
      InterceptorState<Response>(
        response,
        InterceptorResultType.resolve,
      ),
    );
    _processNextInQueue?.call();
  }

  /// Complete the request with an error! Other response interceptor(s) will not
  /// be executed, but error interceptor(s) may be executed, which depends on whether the
  /// value of parameter [callFollowingErrorInterceptor] is true.
  /// [error]: Error info to reject.
  /// [callFollowingErrorInterceptor]: Whether to call the error interceptor(s).
  void reject(DioError error, [bool callFollowingErrorInterceptor = false]) {
    _completer.completeError(
      InterceptorState<DioError>(
        error,
        callFollowingErrorInterceptor
            ? InterceptorResultType.rejectCallFollowing
            : InterceptorResultType.reject,
      ),
      error.stackTrace,
    );
    _processNextInQueue?.call();
  }
}
```

### 类Response

```dart
class Response<T> {
  Response({
    this.data,
    Headers? headers,
    required this.requestOptions,
    this.isRedirect,
    this.statusCode,
    this.statusMessage,
    List<RedirectRecord>? redirects,
    Map<String, dynamic>? extra,
  }) {
    this.headers = headers ?? Headers();
    this.extra = extra ?? {};
    this.redirects = redirects ?? [];
  }
  /// Response body. may have been transformed, please refer to [ResponseType].
  T? data;
  /// Response headers.
  late Headers headers;
  /// The corresponding request info.
  late RequestOptions requestOptions;
  /// Http status code.
  int? statusCode;
  /// Returns the reason phrase associated with the status code.
  /// The reason phrase must be set before the body is written
  /// to. Setting the reason phrase after writing to the body.
  String? statusMessage;
  /// Custom field that you can retrieve it later in `then`.
  late Map<String, dynamic> extra;
  /// Returns the series of redirects this connection has been through. The
  /// list will be empty if no redirects were followed. [redirects] will be
  /// updated both in the case of an automatic and a manual redirect.
  /// ** Attention **: Whether this field is available depends on whether the
  /// implementation of the adapter supports it or not.
  late List<RedirectRecord> redirects;
  /// Whether this response is a redirect.
  /// ** Attention **: Whether this field is available depends on whether the
  /// implementation of the adapter supports it or not.
  bool? isRedirect;
  /// Return the final real request uri (maybe redirect).
  ///
  /// ** Attention **: Whether this field is available depends on whether the
  /// implementation of the adapter supports it or not.
  Uri get realUri =>
      (redirects.isNotEmpty) ? redirects.last.location : requestOptions.uri;
  /// We are more concerned about `data` field.
  @override
  String toString() {
    if (data is Map) {
      return json.encode(data);
    }
    return data.toString();
  }
}
```

### 类_RequestConfig

#### 源码_RequestConfig

```dart
/// The [_RequestConfig] class describes the http request information and configuration.
class _RequestConfig {
  _RequestConfig({
    int? receiveTimeout,
    int? sendTimeout,
    String? method,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? headers,
    String? contentType,
    ListFormat? listFormat,
    bool? followRedirects,
    int? maxRedirects,
    bool? receiveDataWhenStatusError,
    ValidateStatus? validateStatus,
    ResponseType? responseType,
    this.requestEncoder,
    this.responseDecoder,
  }) {
    this.headers = headers;
    var contentTypeInHeader =
        this.headers.containsKey(Headers.contentTypeHeader);
    assert(
      !(contentType != null && contentTypeInHeader) ||
          this.headers[Headers.contentTypeHeader] == contentType,
      'You cannot set different values for contentType param and a content-type header',
    );
    this.method = method ?? 'GET';
    this.sendTimeout = sendTimeout ?? 0;
    this.receiveTimeout = receiveTimeout ?? 0;
    this.listFormat = listFormat ?? ListFormat.multi;
    this.extra = extra ?? {};
    this.followRedirects = followRedirects ?? true;
    this.maxRedirects = maxRedirects ?? 5;
    this.receiveDataWhenStatusError = receiveDataWhenStatusError ?? true;
    this.validateStatus = validateStatus ??
        (int? status) {
          return status != null && status >= 200 && status < 300;
        };
    this.responseType = responseType ?? ResponseType.json;
    if (!contentTypeInHeader) {
      this.contentType = contentType ?? Headers.jsonContentType;
    }
  }

  /// Http method.
  late String method;

  /// Http request headers. The keys of initial headers will be converted to lowercase,
  /// for example 'Content-Type' will be converted to 'content-type'.
  ///
  /// The key of Header Map is case-insensitive, eg: content-type and Content-Type are
  /// regard as the same key.

  Map<String, dynamic> get headers => _headers;
  late Map<String, dynamic> _headers;

  set headers(Map<String, dynamic>? headers) {
    _headers = caseInsensitiveKeyMap(headers);
    if (_defaultContentType != null &&
        !_headers.containsKey(Headers.contentTypeHeader)) {
      _headers[Headers.contentTypeHeader] = _defaultContentType;
    }
  }

  /// Timeout in milliseconds for sending data.
  /// [Dio] will throw the [DioError] with [DioErrorType.sendTimeout] type
  ///  when time out.
  late int sendTimeout;

  ///  Timeout in milliseconds for receiving data.
  ///
  ///  Note: [receiveTimeout]  represents a timeout during data transfer! That is to say the
  ///  client has connected to the server, and the server starts to send data to the client.
  ///
  /// [0] meanings no timeout limit.
  late int receiveTimeout;

  /// The request Content-Type. The default value is [ContentType.json].
  /// If you want to encode request body with 'application/x-www-form-urlencoded',
  /// you can set `ContentType.parse('application/x-www-form-urlencoded')`, and [Dio]
  /// will automatically encode the request body.
  set contentType(String? contentType) {
    if (contentType != null) {
      _headers[Headers.contentTypeHeader] =
          _defaultContentType = contentType.trim();
    } else {
      _defaultContentType = null;
      _headers.remove(Headers.contentTypeHeader);
    }
  }

  String? _defaultContentType;

  String? get contentType => _headers[Headers.contentTypeHeader] as String?;

  /// [responseType] indicates the type of data that the server will respond with
  /// options which defined in [ResponseType] are `json`, `stream`, `plain`.
  ///
  /// The default value is `json`, dio will parse response string to json object automatically
  /// when the content-type of response is 'application/json'.
  ///
  /// If you want to receive response data with binary bytes, for example,
  /// downloading a image, use `stream`.
  ///
  /// If you want to receive the response data with String, use `plain`.
  ///
  /// If you want to receive the response data with  original bytes,
  /// that's to say the type of [Response.data] will be List<int>, use `bytes`
  late ResponseType responseType;

  /// `validateStatus` defines whether the request is successful for a given
  /// HTTP response status code. If `validateStatus` returns `true` ,
  /// the request will be perceived as successful; otherwise, considered as failed.
  late ValidateStatus validateStatus;

  /// Whether receiving response data when http status code is not successful.
  /// The default value is true
  late bool receiveDataWhenStatusError;

  /// Custom field that you can retrieve it later in [Interceptor]、[Transformer] and the [Response] object.
  late Map<String, dynamic> extra;

  /// see [HttpClientRequest.followRedirects],
  /// The default value is true
  late bool followRedirects;

  /// Set this property to the maximum number of redirects to follow
  /// when [followRedirects] is `true`. If this number is exceeded
  /// an error event will be added with a [RedirectException].
  ///
  /// The default value is 5.
  late int maxRedirects;

  /// The default request encoder is utf8encoder, you can set custom
  /// encoder by this option.
  RequestEncoder? requestEncoder;

  /// The default response decoder is utf8decoder, you can set custom
  /// decoder by this option, it will be used in [Transformer].
  ResponseDecoder? responseDecoder;

  /// The [listFormat] indicates the format of collection data in request
  /// query parameters and `x-www-url-encoded` body data.
  /// Possible values defined in [ListFormat] are `csv`, `ssv`, `tsv`, `pipes`, `multi`, `multiCompatible`.
  /// The default value is `multi`.
  ///
  /// The value can be overridden per parameter by adding a [MultiParam]
  /// object to the query or body data map.
  late ListFormat listFormat;
}
```

### 混合OptionsMixin

```dart
mixin OptionsMixin {
  /// Request base url, it can contain sub path, like: "https://www.google.com/api/".
  late String baseUrl;
  /// Common query parameters.\
  /// List values use the default [ListFormat.multiCompatible].
  /// The value can be overridden per parameter by adding a [MultiParam]
  /// object wrapping the actual List value and the desired format.
  late Map<String, dynamic> queryParameters;
  /// Timeout in milliseconds for opening url.
  /// [Dio] will throw the [DioError] with [DioErrorType.connectTimeout] type
  ///  when time out.
  late int connectTimeout;
}
```

### 类BaseOptions

#### 构造函数

```
BaseOptions({
    String method, 
    int connectTimeout, 
    int receiveTimeout, 
    int sendTimeout, 
    String baseUrl, 
    Map<String, dynamic> queryParameters, 
    Map<String, 
    dynamic> extra, 
    Map<String, 
    dynamic> headers, 
    ResponseType responseType = ResponseType.json, 
    String contentType, 
    ValidateStatus validateStatus, 
    bool receiveDataWhenStatusError = true, 
    bool followRedirects = true, 
    int maxRedirects = 5, 
    RequestEncoder requestEncoder, 
    ResponseDecoder responseDecoder
})
```

#### 源码BaseOptions

```dart
/// The common config for the Dio instance.
/// `dio.options` is a instance of [BaseOptions]
class BaseOptions extends _RequestConfig with OptionsMixin {
  BaseOptions({
    String? method,
    int? connectTimeout,
    int? receiveTimeout,
    int? sendTimeout,
    String baseUrl = '',
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? headers,
    ResponseType? responseType = ResponseType.json,
    String? contentType,
    ValidateStatus? validateStatus,
    bool? receiveDataWhenStatusError,
    bool? followRedirects,
    int? maxRedirects,
    RequestEncoder? requestEncoder,
    ResponseDecoder? responseDecoder,
    ListFormat? listFormat,
    this.setRequestContentTypeWhenNoPayload = false,
  }) : super(
          method: method,
          receiveTimeout: receiveTimeout,
          sendTimeout: sendTimeout,
          extra: extra,
          headers: headers,
          responseType: responseType,
          contentType: contentType,
          validateStatus: validateStatus,
          receiveDataWhenStatusError: receiveDataWhenStatusError,
          followRedirects: followRedirects,
          maxRedirects: maxRedirects,
          requestEncoder: requestEncoder,
          responseDecoder: responseDecoder,
          listFormat: listFormat,
        ) {
    this.queryParameters = queryParameters ?? {};
    this.baseUrl = baseUrl;
    this.connectTimeout = connectTimeout ?? 0;
  }

  /// Create a Option from current instance with merging attributes.
  BaseOptions copyWith({
    String? method,
    String? baseUrl,
    Map<String, dynamic>? queryParameters,
    String? path,
    int? connectTimeout,
    int? receiveTimeout,
    int? sendTimeout,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? headers,
    ResponseType? responseType,
    String? contentType,
    ValidateStatus? validateStatus,
    bool? receiveDataWhenStatusError,
    bool? followRedirects,
    int? maxRedirects,
    RequestEncoder? requestEncoder,
    ResponseDecoder? responseDecoder,
    ListFormat? listFormat,
    bool? setRequestContentTypeWhenNoPayload,
  }) {
    return BaseOptions(
      method: method ?? this.method,
      baseUrl: baseUrl ?? this.baseUrl,
      queryParameters: queryParameters ?? this.queryParameters,
      connectTimeout: connectTimeout ?? this.connectTimeout,
      receiveTimeout: receiveTimeout ?? this.receiveTimeout,
      sendTimeout: sendTimeout ?? this.sendTimeout,
      extra: extra ?? Map.from(this.extra),
      headers: headers ?? Map.from(this.headers),
      responseType: responseType ?? this.responseType,
      contentType: contentType ?? this.contentType,
      validateStatus: validateStatus ?? this.validateStatus,
      receiveDataWhenStatusError:
          receiveDataWhenStatusError ?? this.receiveDataWhenStatusError,
      followRedirects: followRedirects ?? this.followRedirects,
      maxRedirects: maxRedirects ?? this.maxRedirects,
      requestEncoder: requestEncoder ?? this.requestEncoder,
      responseDecoder: responseDecoder ?? this.responseDecoder,
      listFormat: listFormat ?? this.listFormat,
      setRequestContentTypeWhenNoPayload: setRequestContentTypeWhenNoPayload ??
          this.setRequestContentTypeWhenNoPayload,
    );
  }

  static const _allowPayloadMethods = ['POST', 'PUT', 'PATCH', 'DELETE'];

  /// if false, content-type in request header will be deleted when method is not on of `_allowPayloadMethods`
  bool setRequestContentTypeWhenNoPayload;

  String? contentTypeWithRequestBody(String method) {
    if (setRequestContentTypeWhenNoPayload) {
      return contentType;
    } else {
      return _allowPayloadMethods.contains(method) ? contentType : null;
    }
  }
}
```



### 类Options

#### 继承关系

```
Implementers RequestOptions
```

#### 构造函数

```
Options({
    String method, 
    int sendTimeout, 
    int receiveTimeout, 
    Map<String, dynamic> extra, 
    Map<String, dynamic> headers, 
    ResponseType responseType, 
    String contentType, 
    ValidateStatus validateStatus, 
    bool receiveDataWhenStatusError, 
    bool followRedirects, 
    int maxRedirects, 
    RequestEncoder requestEncoder, 
    ResponseDecoder responseDecoder
})
```

#### 源码Options

```dart
/// Every request can pass an [Options] object 
///which will be merged with [Dio.options]
class Options {
  Options({
    this.method,
    this.sendTimeout,
    this.receiveTimeout,
    this.extra,
    this.headers,
    this.responseType,
    this.contentType,
    this.validateStatus,
    this.receiveDataWhenStatusError,
    this.followRedirects,
    this.maxRedirects,
    this.requestEncoder,
    this.responseDecoder,
    this.listFormat,
  });
  /// Create a Option from current instance with merging attributes.
  Options copyWith({
    String? method,
    int? sendTimeout,
    int? receiveTimeout,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? headers,
    ResponseType? responseType,
    String? contentType,
    ValidateStatus? validateStatus,
    bool? receiveDataWhenStatusError,
    bool? followRedirects,
    int? maxRedirects,
    RequestEncoder? requestEncoder,
    ResponseDecoder? responseDecoder,
    ListFormat? listFormat,
  }) {
    Map<String, dynamic>? _headers;
    if (headers == null && this.headers != null) {
      _headers = caseInsensitiveKeyMap(this.headers!);
    }

    if (headers != null) {
      headers = caseInsensitiveKeyMap(headers);
      assert(
        !(contentType != null &&
            headers.containsKey(Headers.contentTypeHeader)),
        'You cannot set both contentType param and a content-type header',
      );
    }

    Map<String, dynamic>? _extra;
    if (extra == null && this.extra != null) {
      _extra = Map.from(this.extra!);
    }

    return Options(
      method: method ?? this.method,
      sendTimeout: sendTimeout ?? this.sendTimeout,
      receiveTimeout: receiveTimeout ?? this.receiveTimeout,
      extra: extra ?? _extra,
      headers: headers ?? _headers,
      responseType: responseType ?? this.responseType,
      contentType: contentType ?? this.contentType,
      validateStatus: validateStatus ?? this.validateStatus,
      receiveDataWhenStatusError:
          receiveDataWhenStatusError ?? this.receiveDataWhenStatusError,
      followRedirects: followRedirects ?? this.followRedirects,
      maxRedirects: maxRedirects ?? this.maxRedirects,
      requestEncoder: requestEncoder ?? this.requestEncoder,
      responseDecoder: responseDecoder ?? this.responseDecoder,
      listFormat: listFormat ?? this.listFormat,
    );
  }

  RequestOptions compose(
    BaseOptions baseOpt,
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) {
    var query = <String, dynamic>{};
    query.addAll(baseOpt.queryParameters);
    if (queryParameters != null) query.addAll(queryParameters);

    var _headers = caseInsensitiveKeyMap(baseOpt.headers);
    _headers.remove(Headers.contentTypeHeader);

    String? _contentType;

    if (headers != null) {
      _headers.addAll(headers!);
      _contentType = _headers[Headers.contentTypeHeader] as String?;
    }

    var _extra = Map<String, dynamic>.from(baseOpt.extra);
    if (extra != null) {
      _extra.addAll(extra!);
    }
    var _method = (method ?? baseOpt.method).toUpperCase();
    var requestOptions = RequestOptions(
      method: _method,
      headers: _headers,
      extra: _extra,
      baseUrl: baseOpt.baseUrl,
      path: path,
      data: data,
      connectTimeout: baseOpt.connectTimeout,
      sendTimeout: sendTimeout ?? baseOpt.sendTimeout,
      receiveTimeout: receiveTimeout ?? baseOpt.receiveTimeout,
      responseType: responseType ?? baseOpt.responseType,
      validateStatus: validateStatus ?? baseOpt.validateStatus,
      receiveDataWhenStatusError:
          receiveDataWhenStatusError ?? baseOpt.receiveDataWhenStatusError,
      followRedirects: followRedirects ?? baseOpt.followRedirects,
      maxRedirects: maxRedirects ?? baseOpt.maxRedirects,
      queryParameters: query,
      requestEncoder: requestEncoder ?? baseOpt.requestEncoder,
      responseDecoder: responseDecoder ?? baseOpt.responseDecoder,
      listFormat: listFormat ?? baseOpt.listFormat,
    );

    requestOptions.onReceiveProgress = onReceiveProgress;
    requestOptions.onSendProgress = onSendProgress;
    requestOptions.cancelToken = cancelToken;

    requestOptions.contentType = _contentType ??
        contentType ??
        baseOpt.contentTypeWithRequestBody(_method);
    return requestOptions;
  }

  /// Http method.
  String? method;

  /// Http request headers. The keys of initial headers will be converted to lowercase,
  /// for example 'Content-Type' will be converted to 'content-type'.
  ///
  /// The key of Header Map is case-insensitive, eg: content-type and Content-Type are
  /// regard as the same key.
  Map<String, dynamic>? headers;

  /// Timeout in milliseconds for sending data.
  /// [Dio] will throw the [DioError] with [DioErrorType.sendTimeout] type
  ///  when time out.
  int? sendTimeout;

  ///  Timeout in milliseconds for receiving data.
  ///
  ///  Note: [receiveTimeout]  represents a timeout during data transfer! That is to say the
  ///  client has connected to the server, and the server starts to send data to the client.
  ///
  /// [0] meanings no timeout limit.
  int? receiveTimeout;

  /// The request Content-Type. The default value is [ContentType.json].
  /// If you want to encode request body with 'application/x-www-form-urlencoded',
  /// you can set `ContentType.parse('application/x-www-form-urlencoded')`, and [Dio]
  /// will automatically encode the request body.
  String? contentType;

  /// [responseType] indicates the type of data that the server will respond with
  /// options which defined in [ResponseType] are `json`, `stream`, `plain`.
  ///
  /// The default value is `json`, dio will parse response string to json object automatically
  /// when the content-type of response is 'application/json'.
  ///
  /// If you want to receive response data with binary bytes, for example,
  /// downloading a image, use `stream`.
  ///
  /// If you want to receive the response data with String, use `plain`.
  ///
  /// If you want to receive the response data with original bytes,
  /// that's to say the type of [Response.data] will be List<int>, use `bytes`
  ResponseType? responseType;

  /// `validateStatus` defines whether the request is successful for a given
  /// HTTP response status code. If `validateStatus` returns `true` ,
  /// the request will be perceived as successful; otherwise, considered as failed.
  ValidateStatus? validateStatus;

  /// Whether receiving response data when http status code is not successful.
  /// The default value is true
  bool? receiveDataWhenStatusError;

  /// Custom field that you can retrieve it later in [Interceptor]、[Transformer] and the [Response] object.
  Map<String, dynamic>? extra;

  /// see [HttpClientRequest.followRedirects],
  /// The default value is true
  bool? followRedirects;

  /// Set this property to the maximum number of redirects to follow
  /// when [followRedirects] is `true`. If this number is exceeded
  /// an error event will be added with a [RedirectException].
  ///
  /// The default value is 5.
  int? maxRedirects;

  /// The default request encoder is utf8encoder, you can set custom
  /// encoder by this option.
  RequestEncoder? requestEncoder;

  /// The default response decoder is utf8decoder, you can set custom
  /// decoder by this option, it will be used in [Transformer].
  ResponseDecoder? responseDecoder;

  /// The [listFormat] indicates the format of collection data in request
  /// query parameters and `x-www-url-encoded` body data.
  /// Possible values defined in [ListFormat] are `csv`, `ssv`, `tsv`, `pipes`, `multi`, `multiCompatible`.
  /// The default value is `multi`.
  ListFormat? listFormat;
}
```

### 类RequestOptions

```
RequestOptions({
    String method, 
    int sendTimeout, 
    int receiveTimeout, 
    int connectTimeout, 
    dynamic data, 
    String path, 
    Map<String, dynamic> queryParameters, 
    String baseUrl, 
    ProgressCallback onReceiveProgress, 
    ProgressCallback onSendProgress, 
    CancelToken cancelToken, 
    Map<String, dynamic> extra, 
    Map<String, dynamic> headers, 
    ResponseType responseType, 
    String contentType, 
    ValidateStatus validateStatus, 
    bool receiveDataWhenStatusError, 
    bool followRedirects, 
    int maxRedirects, 
    RequestEncoder requestEncoder, 
    ResponseDecoder responseDecoder
})
```

#### 源码RequestOptions

```dart
class RequestOptions extends _RequestConfig with OptionsMixin {
  RequestOptions({
    String? method,
    int? sendTimeout,
    int? receiveTimeout,
    int? connectTimeout,
    this.data,
    required this.path,
    Map<String, dynamic>? queryParameters,
    this.onReceiveProgress,
    this.onSendProgress,
    this.cancelToken,
    String? baseUrl,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? headers,
    ResponseType? responseType,
    String? contentType,
    ValidateStatus? validateStatus,
    bool? receiveDataWhenStatusError,
    bool? followRedirects,
    int? maxRedirects,
    RequestEncoder? requestEncoder,
    ResponseDecoder? responseDecoder,
    ListFormat? listFormat,
    bool? setRequestContentTypeWhenNoPayload,
  }) : super(
          method: method,
          sendTimeout: sendTimeout,
          receiveTimeout: receiveTimeout,
          extra: extra,
          headers: headers,
          responseType: responseType,
          contentType: contentType,
          validateStatus: validateStatus,
          receiveDataWhenStatusError: receiveDataWhenStatusError,
          followRedirects: followRedirects,
          maxRedirects: maxRedirects,
          requestEncoder: requestEncoder,
          responseDecoder: responseDecoder,
          listFormat: listFormat,
        ) {
    this.queryParameters = queryParameters ?? {};
    this.baseUrl = baseUrl ?? '';
    this.connectTimeout = connectTimeout ?? 0;
  }

  /// Create a Option from current instance with merging attributes.
  RequestOptions copyWith({
    String? method,
    int? sendTimeout,
    int? receiveTimeout,
    int? connectTimeout,
    dynamic data,
    String? path,
    Map<String, dynamic>? queryParameters,
    String? baseUrl,
    ProgressCallback? onReceiveProgress,
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? headers,
    ResponseType? responseType,
    String? contentType,
    ValidateStatus? validateStatus,
    bool? receiveDataWhenStatusError,
    bool? followRedirects,
    int? maxRedirects,
    RequestEncoder? requestEncoder,
    ResponseDecoder? responseDecoder,
    ListFormat? listFormat,
    bool? setRequestContentTypeWhenNoPayload,
  }) {
    var contentTypeInHeader = headers != null &&
        headers.keys
            .map((e) => e.toLowerCase())
            .contains(Headers.contentTypeHeader);

    assert(
      !(contentType != null && contentTypeInHeader),
      'You cannot set both contentType param and a content-type header',
    );

    var ro = RequestOptions(
      method: method ?? this.method,
      sendTimeout: sendTimeout ?? this.sendTimeout,
      receiveTimeout: receiveTimeout ?? this.receiveTimeout,
      connectTimeout: connectTimeout ?? this.connectTimeout,
      data: data ?? this.data,
      path: path ?? this.path,
      baseUrl: baseUrl ?? this.baseUrl,
      queryParameters: queryParameters ?? Map.from(this.queryParameters),
      onReceiveProgress: onReceiveProgress ?? this.onReceiveProgress,
      onSendProgress: onSendProgress ?? this.onSendProgress,
      cancelToken: cancelToken ?? this.cancelToken,
      extra: extra ?? Map.from(this.extra),
      headers: headers ?? Map.from(this.headers),
      responseType: responseType ?? this.responseType,
      validateStatus: validateStatus ?? this.validateStatus,
      receiveDataWhenStatusError:
          receiveDataWhenStatusError ?? this.receiveDataWhenStatusError,
      followRedirects: followRedirects ?? this.followRedirects,
      maxRedirects: maxRedirects ?? this.maxRedirects,
      requestEncoder: requestEncoder ?? this.requestEncoder,
      responseDecoder: responseDecoder ?? this.responseDecoder,
      listFormat: listFormat ?? this.listFormat,
    );

    if (contentType != null) {
      ro.headers.remove(Headers.contentTypeHeader);
      ro.contentType = contentType;
    } else if (!contentTypeInHeader) {
      ro.contentType = this.contentType;
    }

    return ro;
  }

  /// generate uri
  Uri get uri {
    var _url = path;
    if (!_url.startsWith(RegExp(r'https?:'))) {
      _url = baseUrl + _url;
      var s = _url.split(':/');
      if (s.length == 2) {
        _url = s[0] + ':/' + s[1].replaceAll('//', '/');
      }
    }
    var query = Transformer.urlEncodeMap(queryParameters, listFormat);
    if (query.isNotEmpty) {
      _url += (_url.contains('?') ? '&' : '?') + query;
    }
    // Normalize the url.
    return Uri.parse(_url).normalizePath();
  }

  /// Request data, can be any type.
  ///
  /// When using `x-www-url-encoded` body data,
  /// List values use the default [ListFormat.multi].
  ///
  /// The value can be overridden per value by adding a [MultiParam]
  /// object wrapping the actual List value and the desired format.
  dynamic data;

  /// If the `path` starts with 'http(s)', the `baseURL` will be ignored, otherwise,
  /// it will be combined and then resolved with the baseUrl.
  String path;

  CancelToken? cancelToken;

  ProgressCallback? onReceiveProgress;

  ProgressCallback? onSendProgress;
}
```

### 参考文档

[Flutter中基于Dio实现OAuth票据刷新](https://juejin.cn/post/7033608244098662437?from=search-suggest)

[flutetr dio 拦截器实现 token 失效刷新(解决并发)](https://juejin.cn/post/7300875360371310631?searchId=20240426113146F1537A1CAF9C2A6AEED8)
