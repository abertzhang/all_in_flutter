/*
 * create by zhangchunhua
 */

import 'package:flutter/material.dart';

enum TabPosition { top, bottom }

class HorizontalTabDecoration extends Decoration {
  //指示器位置
  final TabPosition tabPosition;
  //右上角圆角
  final double topRightRadius;
  //左上角圆角
  final double topLeftRadius;
  //右下角圆角
  final double bottomRightRadius;
  //左下角圆角
  final double bottomLeftRadius;
  //指示器颜色
  final Color color;
  //水平内边距
  final double horizontalPadding;
  //垂直边距
  final double verticalPadding;

  //画笔风格，实心fill还是空心stroke
  final PaintingStyle paintingStyle;
  //画笔宽度
  final double strokeWidth;
  //指示器线条高度
  final double height;
  //指示器线条宽度
  final double width;

  HorizontalTabDecoration({
    this.height = 3,
    this.tabPosition = TabPosition.bottom,
    this.topRightRadius = 3,
    this.topLeftRadius = 3,
    this.bottomRightRadius = 3,
    this.bottomLeftRadius = 3,
    this.color = Colors.black,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.paintingStyle = PaintingStyle.fill,
    this.strokeWidth = 2,
    this.width = 0,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter(
      this,
      onChanged,
      bottomLeftRadius: bottomLeftRadius,
      bottomRightRadius: bottomRightRadius,
      color: color,
      height: height,
      horizontalPadding: horizontalPadding,
      tabPosition: tabPosition,
      topLeftRadius: topLeftRadius,
      topRightRadius: topRightRadius,
      paintingStyle: paintingStyle,
      strokeWidth: strokeWidth,
      width: width,
      verticalPadding: verticalPadding,
    );
  }
}

class _CustomPainter extends BoxPainter {
  final HorizontalTabDecoration decoration;
  final double height;
  final TabPosition tabPosition;
  final double topRightRadius;
  final double topLeftRadius;
  final double bottomRightRadius;
  final double bottomLeftRadius;
  final Color color;
  final double horizontalPadding;
  final double verticalPadding;
  final double strokeWidth;
  final PaintingStyle paintingStyle;
  final double width;

  _CustomPainter(
    this.decoration,
    VoidCallback? onChanged, {
    required this.height,
    required this.tabPosition,
    required this.topRightRadius,
    required this.topLeftRadius,
    required this.bottomRightRadius,
    required this.bottomLeftRadius,
    required this.color,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.paintingStyle,
    required this.strokeWidth,
    required this.width,
  }) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(horizontalPadding >= 0);
    assert(verticalPadding >= 0);
    assert(horizontalPadding < configuration.size!.width / 2, "Padding must be less than half of the size of the tab");
    assert(height > 0);
    assert(width >= 0);
    assert(strokeWidth >= 0 && strokeWidth < configuration.size!.width / 2 && strokeWidth < configuration.size!.height / 2);
    //根据四个参数verticalPadding,horizontalPadding,height,width，以及configuration.size
    //计算指示器线条的位置,和内边距有关系
    double dxOffset = 0; //相对偏移dx
    double dyOffset = 0; //相对偏移dy
    dxOffset = horizontalPadding;
    dyOffset = verticalPadding;
    if (tabPosition == TabPosition.bottom) {
      dyOffset = (configuration.size?.height ?? 0) - height - verticalPadding;
    }
    //计算指示器线条的大小
    double widthReal = configuration.size?.width ?? 0;
    double heightReal = configuration.size?.height ?? 0;
    if (width < widthReal) widthReal = width;
    if (height < widthReal) heightReal = height;
    if (widthReal - 2 * horizontalPadding > 0) widthReal -= 2 * horizontalPadding;
    if (heightReal - 2 * verticalPadding > 0) heightReal -= 2 * verticalPadding;

    Offset myOffset = Offset(
      offset.dx + dxOffset,
      offset.dy + dyOffset,
    );

    final Rect rect = myOffset & Size(widthReal, heightReal);
    final Paint paint = Paint();
    paint.color = color;
    paint.style = paintingStyle;
    paint.strokeWidth = strokeWidth;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          rect,
          bottomRight: Radius.circular(bottomRightRadius),
          bottomLeft: Radius.circular(bottomLeftRadius),
          topLeft: Radius.circular(topLeftRadius),
          topRight: Radius.circular(topRightRadius),
        ),
        paint);
  }
}

class LineTabDecoration extends Decoration {
  final Size size;

  LineTabDecoration({this.size = const Size(20, 5)});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _LineBoxPaint(this, onChanged, size);
  }

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    return Path()..addRect(rect);
  }

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is LineTabDecoration) {
      return LineTabDecoration(size: Size(2, 5));
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is LineTabDecoration) {
      return LineTabDecoration(size: Size(40, 10));
    }
    return super.lerpFrom(b, t);
  }
}

class _LineBoxPaint extends BoxPainter {
  final LineTabDecoration decoration;
  final Size size;
  _LineBoxPaint(this.decoration, VoidCallback? onChanged, this.size) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // canvas.drawRect(offset & (configuration.size!), Paint()..color = Colors.lightBlue);
    canvas.drawRect(configuration.size!.bottomCenter(offset) & Size(15, -3), Paint()..color = Colors.blue);
  }
}
