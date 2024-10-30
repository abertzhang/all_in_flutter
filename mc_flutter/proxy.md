### 抓包配置

```
Flutter在http设置proxy为设备使用的代理ip和port
PC端安装Charles,并安装证书,破解地址https://www.zzzmode.com/mytools/charles/
手机端安装证书,chls.pro/ssl
手机端设置代理为PC端的ip和8888端口
```

### Android端实现获取proxy配置

```kotlin
  ///获取代理
  private  fun getProxy():String{
    val proxyAddress = System.getProperty("http.proxyHost","")
    val portStr=System.getProperty("http.proxyPort","")
    if(proxyAddress==""||portStr=="") return "";
    return  "$proxyAddress:$portStr"
  }
```

### IOS端获取proxy配置

```swift
    private func getProxy()->String?{
        guard let settings = CFNetworkCopySystemProxySettings()?.takeUnretainedValue(),
              let url = URL(string: "https://www.ping.com/")else{
            return nil
        }
        let proxys = CFNetworkCopyProxiesForURL((url as CFURL), settings).takeUnretainedValue() as NSArray
        guard let setting = proxys.firstObject as? NSDictionary,
              let _ = setting.object(forKey: (kCFProxyTypeKey as String)) as? String else{
            return nil
        }
        if let hostNam = setting.object(forKey: (kCFProxyTypeKey as String)),let port = setting.object(forKey: (kCFProxyPortNumberKey as String)){
            return "\(hostNam):\(port)"
        }
        return nil
    }
```

### Flutter端现有插件

```
# 设备代理信息
native_flutter_proxy: ^0.1.15
```

### http实现proxy

```dart
//新建类继承
class ProxyHttpOverrides extends HttpOverrides {
  final String? host;
  final String? port;

  ProxyHttpOverrides(this.host, this.port);
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) {
        // if (kReleaseMode) return 'DIRECT';
        return (host != null || host == '') ? "PROXY $host:$port;DIRECT" : 'DIRECT';
      };
  }
}
//加入插件,或从android和ios两端自写插件
native_flutter_proxy: ^0.1.15
//main.dart
ProxySetting proxy = await NativeProxyReader.proxySetting;
HttpOverrides.global = ProxyHttpOverrides(proxy.host, proxy.port.toString());
```

### dio实现proxy

```dart
//在Dio初始后 
ProxySetting proxy = await NativeProxyReader.proxySetting;
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
        client.findProxy = (uri) {
          if (proxy.host == null || proxy.host == '') return 'DIRECT';
          return 'PROXY ${proxy.host}:${proxy.port};DIRECT';
        };
      };
```

```dart
//DefaultHttpClientAdapter被废弃用IOHttpClientAdapter代替
ProxySetting proxy = await NativeProxyReader.proxySetting;
      (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
        HttpClient client = HttpClient();
        client.findProxy = (uri) {
          if (proxy.host == null || proxy.host == '') return 'DIRECT';
          return 'PROXY ${proxy.host}:${proxy.port};DIRECT';
        };
        return client;
      };
```

```
'projectAddressDetail': jsonEncode(controller.projectAddressDetail?.toMap()),
```

