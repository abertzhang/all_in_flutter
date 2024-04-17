import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'util_plugin_method_channel.dart';

abstract class UtilPluginPlatform extends PlatformInterface {
  UtilPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static UtilPluginPlatform _instance = MethodChannelUtilPlugin();

  static UtilPluginPlatform get instance => _instance;

  static set instance(UtilPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  ///获取当前sdk版本
  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  ///获取代理信息
  Future<String?> getProxyInfo() {
    throw UnimplementedError('getProxyInfo() has not been implemented.');
  }
}
