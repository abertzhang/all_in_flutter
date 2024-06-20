import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_proxy/shelf_proxy.dart';

// 运行
// dart ./lib/proxy.dart
Future<void> main() async {
  final server = await shelf_io.serve(
    proxyHandler('https://dart.cn'),
    'localhost',
    8080,
  );

  debugPrint('Proxying at http://${server.address.host}:${server.port}');
}

class ProxyHttpOverrides extends HttpOverrides {
  final String? _port;
  final String? _host;

  ProxyHttpOverrides(this._port, this._host);
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) {
        return _host != null ? "PROXY $_host:$_port;" : 'DIRECT';
      };
  }
}

/*
(_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
            client.findProxy = (url) {
              ///设置代理 电脑ip地址
              return "PROXY 192.168.31.102:8888";

              ///不设置代理
//          return 'DIRECT';
            };

            ///忽略证书
            client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      };

*/

/*

  String? proxyInfo = await DeviceProxy().getProxy();
  HttpOverrides.global = ProxyHttpOverrides(proxyInfo);
  ///
class ProxyHttpOverrides extends HttpOverrides {
  final String? _proxy;

  ProxyHttpOverrides(this._proxy);
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) {
        return _proxy != null || _proxy == '' ? "PROXY $_proxy;DIRECT" : 'DIRECT';
      };
  }

  @override
  String findProxyFromEnvironment(Uri url, Map<String, String>? environment) {
    LogUtil.v('覆盖的proxy信息${environment.toString()}--uri$url');
    return _proxy != null || _proxy == '' ? "PROXY $_proxy;DIRECT" : 'DIRECT';
  }
}
*/

/*
class ProxyHttpOverrides extends HttpOverrides {
  final String? _proxy;

  ProxyHttpOverrides(this._proxy);
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) {
        // if (const bool.fromEnvironment('dart.vm.product')) return 'DIRECT';
        return _proxy != null || _proxy == '' ? "PROXY $_proxy;DIRECT" : 'DIRECT';
      };
  }
}
*/
