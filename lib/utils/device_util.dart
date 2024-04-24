import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// 设备工具类
class DeviceUtil {
  // 沉浸式状态栏
  static setBarStatus(bool isDarkIcon, {Color color = Colors.transparent}) async {
    if (isDarkIcon) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    } else {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: color,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
