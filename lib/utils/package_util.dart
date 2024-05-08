import 'package:package_info_plus/package_info_plus.dart';

class PackageUtil {
  PackageUtil._internal();

  ///获取应用包信息
  static Future<PackageInfo> getPackageInfo() {
    return PackageInfo.fromPlatform();
  }

  ///获取应用包信息
  static Future<Map<String, dynamic>> getPackageInfoMap() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return <String, dynamic>{
      'appName': packageInfo.appName,
      'packageName': packageInfo.packageName,
      'version': packageInfo.version,
      'buildNumber': packageInfo.buildNumber,
    };
  }

  // 判断当前是否是debug模式
  static bool get isDebugMode {
    bool inDebugMode = false;
    assert(inDebugMode = true); //如果debug模式下会触发赋值
    return inDebugMode;
  }
}
