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
    //如果设置渐变则在paint里加上
    if (gradient != null) {
      paint.shader = gradient!.createShader(rect);
    }
    if (paintStyle == PaintingStyle.stroke) {
      paint.strokeWidth = strokeWidth;
    }
    canvas.drawRRect(rRect, paint);
  }
}
