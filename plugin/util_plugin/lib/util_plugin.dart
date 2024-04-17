import 'util_plugin_platform_interface.dart';

class UtilPlugin {
  ///获取sdk版本号
  Future<String?> getPlatformVersion() {
    return UtilPluginPlatform.instance.getPlatformVersion();
  }

  ///获取代理信息
  Future<String?> getProxyInfo() async {
    return UtilPluginPlatform.instance.getProxyInfo();
  }
}
