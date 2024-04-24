/*
 * create by zhangchunhua
 */

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

Future<void> appInit() async {
  // void main() {
  //   AppCatch.start(() async {
  //     WidgetsFlutterBinding.ensureInitialized();
  //     GestureBinding.instance.resamplingEnabled = true;
  //     //本地存储
  //     await SpUtil.getInstance();
  //     //日志
  //     LogUtil.init(tag: 'Logger', isDebug: !const bool.fromEnvironment("dart.vm.product"));
  //     runApp(const MyApp()); //DemoApp类含MaterialApp
  //   });
  // }
  //
  // class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);
  //
  // @override
  // Widget build(BuildContext context) {
  // return const GetMaterialApp(
  // home: MainPage(),
  // );
  // }
  // }

  //---------根据需要来初始化---------
  WidgetsFlutterBinding.ensureInitialized();
  //滚动性能优化 1.22.0
  GestureBinding.instance.resamplingEnabled = true;
  //初始化--本地存储
  // await SpUtil.getInstance();
  //初始化--目录工具
  // DirectoryUtil.getInstance();
  //初始化--日志
  // LogUtil.init(tag: 'Logger', isDebug: !const bool.fromEnvironment("dart.vm.product"));
  //初始化--高德地图
  // await AMapLocationUtil().init(androidKey, iosKey);
  //初始化--吐司
  // ToastUtil.init(child)
  //屏幕适配
  // ScreenUtilInit(builder: (BuildContext context, Widget? child) {  },)
  //初始化--get
  //初始化--riverpod
}
