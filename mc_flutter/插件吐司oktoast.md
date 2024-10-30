### 插件oktoast

依赖导包

```
dependencies:
  oktoast: ^3.0.0  //支持空安全
  oktoast: 2.3.2	//选择其中一个
import 'package:oktoast/oktoast.dart';
```

### 类OKToast

文档资料

```
https://pub.flutter-io.cn/documentation/oktoast/latest/oktoast/OKToast-class.html
```

继承关系

```
Inheritance
Object DiagnosticableTree Widget StatefulWidget OKToast
```

构造函数

```
OKToast({
	Key? key, 
	required Widget child, 
	TextStyle? textStyle, 
	double radius = 10.0, 
	ToastPosition position = ToastPosition.center, 
	TextDirection textDirection = TextDirection.ltr, 
	bool dismissOtherOnShow = false, 
	bool movingOnWindowChange = true, 
	Color? backgroundColor, 
	EdgeInsets? textPadding, 
	TextAlign? textAlign, 
	bool handleTouth = false, 
	OKToastAnimationBuilder? animationBuilder, 
	Duration animationDuration = _defaultAnimDuration, 
	Curve? animationCurve, 
	Duration? duration
})
```

### 类ToastFuture

```
https://pub.flutter-io.cn/documentation/oktoast/latest/oktoast/ToastFuture-class.html
```

### 类ToastPosition

构造函数

```
ToastPosition({
	AlignmentGeometry align = Alignment.center, 
	double offset = 0.0
})
```

### 方法dismissAllToast

```
void dismissAllToast(
{bool showAnim = false}
)
```

##### Implementation

```
void dismissAllToast({bool showAnim = false}) {
  ToastManager().dismissAll(showAnim: showAnim);
}
```

### 方法showToast

```
ToastFuture showToast(
    String msg,
    {BuildContext? context,
    Duration? duration,
    ToastPosition? position,
    TextStyle? textStyle,
    EdgeInsetsGeometry? textPadding,
    Color? backgroundColor,
    double? radius,
    VoidCallback? onDismiss,
    TextDirection? textDirection,
    bool? dismissOtherToast,
    TextAlign? textAlign,
    OKToastAnimationBuilder? animationBuilder,
    Duration? animationDuration,
    Curve? animationCurve}
)
```

### 方法showToastWidget

```
ToastFuture showToastWidget(
    Widget widget,
    {BuildContext? context,
    Duration? duration,
    ToastPosition? position,
    VoidCallback? onDismiss,
    bool? dismissOtherToast,
    TextDirection? textDirection,
    bool? handleTouch,
    OKToastAnimationBuilder? animationBuilder,
    Duration? animationDuration,
    Curve? animationCurve}
)
```

### 简例01

```
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
void main() => runApp(MaterialApp(home: DemoOkToast()));
class DemoOkToast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: Scaffold(
      appBar: AppBar(
        title: Text('oktoast演示'),
      ),
      body: GestureDetector(
          onTap: () {
            showToast('这是oktoast提示框!', duration: Duration(seconds: 20));
            Future.delayed(Duration(seconds: 2), () {
              dismissAllToast(); //用then来调用,确保showToastWidget在dismissAllToast之后执行
            }).then((value) => showToastWidget(Material(
                child: Container(
                    height: 50,
                    width: 100,
                    color: Colors.grey,
                    child: Center(child: Text('widget形式'))))));
          },
          child: Text('oktoast'))
    ));
  }
}
```

