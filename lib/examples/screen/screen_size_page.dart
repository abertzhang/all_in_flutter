// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_common_v2/imports/common.dart';
//
// import '../../widgets/widgets.dart';
//
// class ScreenSizePage extends StatelessWidget {
//   const ScreenSizePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: false,
//       child: Scaffold(
//         appBar: AppBarGradient(
//           title: const Text('屏幕尺寸数据'),
//           gradientAlignmentBegin: Alignment.topCenter,
//           gradientAlignmentEnd: Alignment.bottomCenter,
//           gradientBegin: Colors.blue,
//           gradientEnd: Colors.lightBlueAccent,
//           elevation: 0,
//         ),
//         body: _buildBody(),
//       ),
//     );
//   }
//
//   _buildBody() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//       child: Column(
//         children: [
//           _buildRowText(title: '分辨率window.physicalSize', content: window.physicalSize.toString()),
//           const Divider(),
//           _buildRowText(title: 'window.viewPadding', content: window.viewPadding.toString()),
//           const Divider(),
//           _buildRowText(title: 'window.padding', content: window.padding.toString()),
//           const Divider(),
//           _buildRowText(title: '键盘高度window.viewInsets', content: window.viewInsets.toString()),
//           const Divider(),
//           _buildRowText(title: 'dpi-像素密度window.devicePixelRatio', content: window.devicePixelRatio.toString()),
//           const Divider(thickness: 5),
//           _buildRowText(title: '通知栏MediaQuery.viewPadding', content: MediaQueryData.fromWindow(window).viewPadding.toString()),
//           const Divider(),
//           _buildRowText(title: 'MediaQuery.padding', content: MediaQueryData.fromWindow(window).padding.toString()),
//           const Divider(),
//           _buildRowText(title: '键盘高度MediaQuery.viewInsets', content: MediaQueryData.fromWindow(window).viewInsets.toString()),
//           const Divider(),
//           _buildRowText(title: 'dpi-像素密度MediaQuery.devicePixelRatio', content: MediaQueryData.fromWindow(window).devicePixelRatio.toString()),
//           const Divider(),
//           _buildRowText(title: '宽高-dp-MediaQuery.size', content: MediaQueryData.fromWindow(window).size.toString()),
//           const Divider(thickness: 5),
//           _buildRowText(title: 'ScreenUtil().pixelRatio', content: ScreenUtil().pixelRatio.toString()),
//           const Divider(),
//           _buildRowText(title: '通知栏ScreenUtil().statusBarHeight', content: screen.ScreenUtil().statusBarHeight.toString()),
//           const Divider(),
//           _buildRowText(title: 'ScreenUtil().bottomBarHeight', content: screen.ScreenUtil().bottomBarHeight.toString()),
//           const Divider(),
//           _buildRowText(title: 'ScreenUtil().scaleWidth', content: screen.ScreenUtil().scaleWidth.toString()),
//           const Divider(),
//           _buildRowText(title: 'ScreenUtil().scaleHeight', content: screen.ScreenUtil().scaleHeight.toString()),
//           const Divider(),
//           _buildRowText(title: 'ScreenUtil().screenWidth', content: screen.ScreenUtil().screenWidth.toString()),
//           const Divider(),
//           _buildRowText(title: 'ScreenUtil().screenHeight', content: screen.ScreenUtil().screenHeight.toString()),
//           const Divider(thickness: 5),
//           _buildRowText(title: 'sizer.width', content: sizer.SizerUtil.width.toString()),
//           const Divider(),
//           _buildRowText(title: 'sizer.width', content: sizer.SizerUtil.height.toString()),
//           const Divider(thickness: 5),
//           _buildRowText(title: 'Get.pixelRatio', content: Get.pixelRatio.toString()),
//           const Divider(),
//           _buildRowText(title: 'Get.width', content: Get.width.toString()),
//           const Divider(),
//           _buildRowText(title: 'Get.height', content: Get.height.toString()),
//           const Divider(),
//           _buildRowText(title: 'Get.bottomBarHeight', content: Get.bottomBarHeight.toString()),
//           const Divider(),
//           _buildRowText(title: 'Get.statusBarHeight', content: Get.statusBarHeight.toString()),
//         ],
//       ),
//     );
//   }
//
//   Row _buildRowText({required String title, required String content}) {
//     return Row(
//       children: [
//         Expanded(child: Text(title, style: const TextStyle(fontSize: 15))),
//         Container(width: 2, color: Colors.blue),
//         Expanded(child: Text(content, style: const TextStyle(fontSize: 15))),
//       ],
//     );
//   }
// }
