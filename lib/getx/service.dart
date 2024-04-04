import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppService extends GetxService {
  static AppService get to => Get.find<AppService>();

  Rx<ThemeMode> themeMode = ThemeMode.dark.obs;
  void modifyThemeMode(ThemeMode mode) {
    if (themeMode.value == ThemeMode.dark) {
      themeMode.value = ThemeMode.light;
    } else {
      themeMode.value = ThemeMode.dark;
    }
  }
}
