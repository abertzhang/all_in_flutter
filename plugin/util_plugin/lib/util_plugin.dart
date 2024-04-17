
import 'util_plugin_platform_interface.dart';

class UtilPlugin {
  Future<String?> getPlatformVersion() {
    return UtilPluginPlatform.instance.getPlatformVersion();
  }
}
