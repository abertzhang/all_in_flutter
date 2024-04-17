import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'util_plugin_platform_interface.dart';

class MethodChannelUtilPlugin extends UtilPluginPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('util_plugin');

  ///获取当前sdk版本
  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  ///获取代理信息
  @override
  Future<String?> getProxyInfo() async {
    final proxyInfo = await methodChannel.invokeMethod<String>('getProxyInfo');
    return proxyInfo;
  }
}
