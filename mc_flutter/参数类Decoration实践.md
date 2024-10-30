### 标题--细说抽象类Decoration

在flutter中最常见的要属BoxDecoration,起到装饰作用,设置的属性有常用的圆角,颜色,形状等;或许还能想起TabBar中也用到此类装饰器,那么从他们共同的抽象类Decoration来入手,摸清他们的结构和关系。

### 继承关系
先看继承关系结构图,Decoration有四个子类,关系结构还是相对简单的,因此将他们的构造函数也放在图上，只要稍作整理就能理清知识点和用途。
![decoration.png](http://qiniu-article.myflutter.cn/img/12b7bc427a1c4ad3a90c1aefc70611b9~tplv-k3u1fbpfcp-watermark.png)

### 类BoxDecoration
对常用的装饰类BoxDecoration([官方文档](https://api.flutter.dev/flutter/painting/BoxDecoration-class.html))简单说明

```dart
BoxDecoration(
//颜色
  Color color,
//背景图
  DecorationImage? image,
//边框  
  Border? border,
//圆角  
  BorderRadiusGeometry? borderRadius,
//阴影叠加  
  List<BoxShadow>? boxShadow,
//渐变  
  Gradient? gradient,
  BlendMode? backgroundBlendMode,
//枚举类，这里默认矩形，另外枚举值circle圆形
  BoxShape shape=BoxShape.rectangle
)
```
### 自定义Decration
Decoration是抽象类，在extends后需要实现接口方法createBoxPainter，在该方法里返回抽象类BoxPainter的实例，也是需要我们定义一个类来实现BoxPainter,同样去实现接口方法paint。自此，我们就可以拿到绘制的条件，画布canvas、位置offset以及大小size，万事俱备，只欠你的想象力。

```dart
class LineTabDecoration extends Decoration { 
  @override 
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _LineBoxPaint();
 } 
} 
class _LineBoxPaint extends BoxPainter { 
  @override 
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
      //这里可以发挥你的天才想象力
      canvas.drawRect(configuration.size!.bottomCenter(offset) & Size(15, -3),
          Paint()); 
      } 
}
```

<img src="http://qiniu-article.myflutter.cn/img/fcbb70774da840f9af312f8c9f9b6b8e~tplv-k3u1fbpfcp-watermark.jpeg" alt="1231649742194_.pic.jpg" style="zoom:50%;" />


### 抽象类ShapeBorder
继承关系图对ShapeBoder抽象类一目了然，也可移步[我的Notion笔记](https://jelly-golf-f46.notion.site/ShapeBorder-27815ba5d2d14c1383933ea86311d56a)查看类的详情。
<img src="http://qiniu-article.myflutter.cn/img/6a473418a0ce45d69991397e55a39548~tplv-k3u1fbpfcp-watermark-20230319185152394.png" alt="Untitled1.png" style="zoom:50%;" />

### 类BoxPainter

#### 构造函数

```
BoxPainter([VoidCallback? onChanged])
```

常用属性

```
onChanged → VoidCallback?
```

#### 常用方法

```dart
dispose() → void
paint(
	Canvas canvas, 
	Offset offset, 
	ImageConfiguration configuration
	) → void
```



### 类ImageConfiguration

#### 构造函数

```dart
ImageConfiguration({
  AssetBundle? bundle, 
  double? devicePixelRatio, 
  Locale? locale, 
  TextDirection? textDirection, 
  Size? size, 
  TargetPlatform? platform
})
```

#### 简例01继承Decoration

#### 1-自定义继承

````dart
/*
继承抽象类Decoration需要override方法createBoxPainter并返回BoxPainter类
*/
class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomIndicatorPainter(
      this,
      onChanged,
      //这里后期增加相关入参来丰富功能
    );
  }
}
````

#### 2-创建继承BoxPainter的类

```dart
//创建继承BoxPainter的新类,
//override方法painter可实现最基本自己的下划线
class _CustomIndicatorPainter extends BoxPainter {
  late Decoration decoration;

  _CustomIndicatorPainter(
    this.decoration,
    VoidCallback? onChanged, {
		//这里后期增加相关入参来丰富功能
  }) : super(onChanged);
  @override
  void paint(
    Canvas canvas,
    Offset offset, //当前tab左上角点的offset
    ImageConfiguration configuration, //当前tab的大小数据
  ) {
    //根据offset和configuration用canvas画tab的装饰器
  }
}
```

#### 3-增加入参丰富功能

```dart
/*
完整代码
功能:指定indicator的宽度和高度,颜色或渐变色,
圆角,相对于底部的indicator位置,是否空心还是fill,如果空心则指定边框的粗细和颜色等
关键点:理解BoxPainter类方法painter的入参offset和configuration
offset指当前tab标签的位置
configuration指当前tab标签的大小等参数
上面两个参数根据切换tab而变化
可以引入TabController来丰富下划线的动画功能
*/
import 'package:flutter/material.dart';
class CustomTabIndicator extends Decoration {
  final double width; //宽度
  final double height; //厚度
  final Color color; //颜色
  final double paddingBottom; //距离tab底部的距离
  final double radius; //圆角
  final Gradient? gradient; //渐变
  final double strokeWidth;
  final PaintingStyle paintStyle;

  const CustomTabIndicator({
    this.width = 15.0,
    this.height = 3,
    this.color = const Color(0xff000000),
    this.paddingBottom = 0,
    this.radius = 3,
    this.gradient,
    this.strokeWidth = 2,
    this.paintStyle = PaintingStyle.fill,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomIndicatorPainter(
      this,
      onChanged,
      width: width,
      height: height,
      color: color,
      paddingBottom: paddingBottom,
      radius: radius,
      gradient: gradient,
      strokeWidth: strokeWidth,
      paintStyle: paintStyle,
    );
  }
}

class _CustomIndicatorPainter extends BoxPainter {
  late Decoration decoration;
  final double width;
  final double height;
  final Color color;
  final double paddingBottom;
  final double radius;
  final Gradient? gradient;
  final double strokeWidth;
  final PaintingStyle paintStyle;

  _CustomIndicatorPainter(
    this.decoration,
    VoidCallback? onChanged, {
    required this.width,
    required this.height,
    required this.color,
    required this.paddingBottom,
    required this.radius,
    required this.gradient,
    required this.strokeWidth,
    required this.paintStyle,
  }) : super(onChanged);

  @override
  void paint(
    Canvas canvas,
    Offset offset, //当前tab左上角点的offset
    ImageConfiguration configuration, //当前tab的大小数据
  ) {
    //
    Paint paint = Paint()..color = color;
    //tab宽度和实际宽度的差值
    double dxDiff = (configuration.size?.width ?? 30) - width;
    //新的位置点
    Offset newOffset = offset + Offset(dxDiff / 2, (configuration.size?.height ?? 0) - height - paddingBottom);
    //矩形
    Rect rect = newOffset & Size(width, height);
    //圆角矩形
    RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    if (gradient != null) {
      paint.shader = gradient!.createShader(rect);
    }
    if (paintStyle == PaintingStyle.stroke) {
      paint.strokeWidth = strokeWidth;
    }
    canvas.drawRRect(rRect, paint);
  }
}

```



