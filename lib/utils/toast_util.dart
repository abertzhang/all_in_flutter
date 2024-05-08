import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ToastUtil {
  ToastUtil._internal();
  static const defaultDuration = Duration(seconds: 4);
  static const defaultColor = Color(0x99000000);

  ///全局初始化Toast配置, child为MaterialApp
  static init(Widget child) {
    return StyledToast(
      locale: const Locale('zh', 'CH'),

      ///字体大小
      textStyle: const TextStyle(fontSize: 14, color: Colors.white),
      backgroundColor: defaultColor,
      borderRadius: BorderRadius.circular(10.0),
      textPadding: const EdgeInsets.symmetric(horizontal: 17.0, vertical: 10.0),
      toastAnimation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade,
      startOffset: const Offset(0.0, -1.0),
      reverseEndOffset: const Offset(0.0, -1.0),
      duration: defaultDuration,
      animDuration: const Duration(seconds: 1),
      alignment: Alignment.center,
      toastPositions: StyledToastPosition.bottom,
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.fastOutSlowIn,
      dismissOtherOnShow: true,
      fullWidth: false,
      child: child,
    );
  }

  static void toast(
    String? msg, {
    Duration duration = defaultDuration,
    Color color = defaultColor,
    AlignmentGeometry position = Alignment.center,
  }) {
    showToast(msg,
        duration: duration,
        backgroundColor: color,
        animation: StyledToastAnimation.slideFromBottomFade,
        reverseAnimation: StyledToastAnimation.slideToBottomFade,
        startOffset: const Offset(0.0, 2.0),
        reverseEndOffset: const Offset(0.0, 3.0),
        position: StyledToastPosition(align: position as Alignment, offset: 40.0),
        animDuration: const Duration(seconds: 1),
        curve: Curves.elasticOut,
        reverseCurve: Curves.elasticOut);
  }

  static void waring(String msg, {Duration duration = defaultDuration}) {
    showToast(msg,
        duration: duration,
        backgroundColor: const Color(0x99F9A825),
        animation: StyledToastAnimation.slideFromBottomFade,
        reverseAnimation: StyledToastAnimation.slideToBottomFade,
        startOffset: const Offset(0.0, 2.0),
        reverseEndOffset: const Offset(0.0, 3.0),
        position: const StyledToastPosition(align: Alignment.center, offset: 40.0),
        animDuration: const Duration(seconds: 1),
        curve: Curves.elasticOut,
        reverseCurve: Curves.elasticOut);
  }

  static void error(String? msg, {Duration duration = defaultDuration}) {
    showToast(msg,
        duration: duration,
        backgroundColor: const Color(0x99FF3D00),
        animation: StyledToastAnimation.slideFromBottomFade,
        reverseAnimation: StyledToastAnimation.slideFromBottomFade,
        startOffset: const Offset(0.0, 2.0),
        reverseEndOffset: const Offset(0.0, 3.0),
        position: StyledToastPosition.center,
        animDuration: const Duration(seconds: 1),
        curve: Curves.elasticOut,
        reverseCurve: Curves.elasticOut);
  }

  static void success(String? msg, {Duration duration = defaultDuration}) {
    showToast(msg,
        duration: duration,
        backgroundColor: const Color(0x99689F38),
        animation: StyledToastAnimation.slideFromBottomFade,
        reverseAnimation: StyledToastAnimation.slideFromBottomFade,
        startOffset: const Offset(0.0, 2.0),
        reverseEndOffset: const Offset(0.0, 3.0),
        position: const StyledToastPosition(align: Alignment.center, offset: 0.0),
        animDuration: const Duration(seconds: 1),
        curve: Curves.elasticOut,
        reverseCurve: Curves.elasticOut);
  }
}
