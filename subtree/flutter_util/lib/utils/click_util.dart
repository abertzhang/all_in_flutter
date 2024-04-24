import 'dart:io';

import 'package:flutter/material.dart';

class ClickUtil {
  ClickUtil._internal();

  static DateTime? _lastPressedAt; //上次点击时间

  //双击返回
  static Future<bool> exitBy2Click(BuildContext context, {int duration = 2000, ScaffoldState? status}) async {
    if (status != null && status.isDrawerOpen) {
      exit(0);
      return Future.value(true);
    }

    if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt!) > Duration(milliseconds: duration)) {
      //两次点击间隔超过1秒则重新计时,
      // showToast(
      //   '再按一次退出程序',
      //   context: context,
      //   axis: Axis.horizontal,
      //   alignment: Alignment.center,
      //   position: StyledToastPosition.center,
      //   toastHorizontalMargin: 20,
      // );

      _lastPressedAt = DateTime.now();
      return Future.value(false);
    }

    exit(0);
    return Future.value(true);
  }

  // 关闭键盘
  static void closeKeyBoard() {
    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
  }
}
