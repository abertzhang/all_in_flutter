// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'util_plugin_platform_interface.dart';

class UtilPluginWeb extends UtilPluginPlatform {
  UtilPluginWeb();

  static void registerWith(Registrar registrar) {
    UtilPluginPlatform.instance = UtilPluginWeb();
  }

  @override
  Future<String?> getPlatformVersion() async {
    final version = html.window.navigator.userAgent;
    return version;
  }

  ///获取代理信息--web端未实现方法
  @override
  Future<String?> getProxyInfo() async => null;
}
