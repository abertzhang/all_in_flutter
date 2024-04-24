/*
 * create by zhangchunhua
 *
 */
/*
用法:
插件:
导包:
*/
import 'dart:async';

import 'package:flutter/foundation.dart';

class AppCatch {
  static void start(VoidCallback run) {
    //捕获异常
    catchException(run);
  }

  ///异常捕获处理
  static void catchException<T>(T Function() callback) {
    //捕获异常的回调
    FlutterError.onError = (FlutterErrorDetails details) {
      reportErrorAndLog(details);
    };
    runZoned<Future<void>>(
      () async {
        callback();
      },
      zoneSpecification: ZoneSpecification(
        print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
          collectLog(parent, zone, line); // 收集日志
        },
      ),
      //未捕获的异常的回调
      // ignore: deprecated_member_use
      onError: (Object obj, StackTrace stack) {
        var details = makeDetails(obj, stack);
        reportErrorAndLog(details);
      },
    );
  }

  //日志拦截, 收集日志
  static void collectLog(ZoneDelegate parent, Zone zone, String line) {
    parent.print(zone, "日志拦截: $line");
  }

  //上报错误和日志逻辑
  static void reportErrorAndLog(FlutterErrorDetails details) {
    if (kDebugMode) print(details);
  }

  // 构建错误信息
  static FlutterErrorDetails makeDetails(Object obj, StackTrace stack) {
    return FlutterErrorDetails(exception: obj, stack: stack);
  }
}
