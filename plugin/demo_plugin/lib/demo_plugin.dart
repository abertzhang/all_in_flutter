import 'demo_plugin_platform_interface.dart';

class DemoPlugin {
  Future<String?> getPlatformVersion() {
    return DemoPluginPlatform.instance.getPlatformVersion();
  }

  Future<int?> add() {
    return DemoPluginPlatform.instance.addInt();
  }
}
