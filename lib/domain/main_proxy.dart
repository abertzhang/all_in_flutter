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
