/*
 * create by zhangchunhua
 */
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog extends Dialog {
  //loading动画
  final Widget loadingView;

  //提示内容
  final String content;

  //是否显示提示文字
  final bool showContent;

  //圆角大小
  final double radius;

  //背景颜色
  final Color backgroundColor;

  // 字体颜色
  final Color textColor;

  // 字体大小
  final double textSize;

  LoadingDialog(
      {Key? key,
      this.loadingView = const SpinKitCircle(color: Colors.white),
      this.content = "加载中...",
      this.showContent = true,
      this.radius = 10,
      this.textColor = Colors.white,
      this.textSize = 15,
      this.backgroundColor = Colors.black38})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: SizedBox(
          width: showContent ? 120 : 80,
          height: showContent ? 120 : 80,
          child: Container(
            decoration: ShapeDecoration(
              color: backgroundColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(radius))),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                loadingView,
                if (showContent)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      content,
                      style: TextStyle(color: textColor, fontSize: textSize),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
