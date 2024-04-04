// import 'package:flutter/material.dart';
//
// class GradientTabIndicator extends Decoration {
//   @override
//   BoxPainter createBoxPainter([VoidCallback? onChanged]) {
//     return _UnderlinePainter(this, onChanged);
//   }
//
//   ///决定控制器宽度的方法
//   Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
//     assert(rect != null);
//     assert(textDirection != null);
//     final Rect indicator = insets.resolve(textDirection).deflateRect(rect);
//
//     // 希望的宽度
//     double wantWidth = this.width;
//     // 取中间坐标
//     double cw = (indicator.left + indicator.right) / 2;
//
//     //这里是核心代码
//     //下划线靠左
//     // return Rect.fromLTWH(indicator.left,
//     //     indicator.bottom - borderSide.width, wantWidth, borderSide.width);
//
//     //下划线居中
//     return Rect.fromLTWH(cw - wantWidth / 2, indicator.bottom - borderSide.width, wantWidth, borderSide.width);
//   }
//
//   @override
//   Path getClipPath(Rect rect, TextDirection textDirection) {
//     return Path()..addRect(_indicatorRectFor(rect, textDirection));
//   }
// }
//
// class _UnderlinePainter extends BoxPainter {
//   _UnderlinePainter(this.decoration, VoidCallback? onChanged) : super(onChanged);
//
//   final GradientTabIndicator decoration;
//   @override
//   void paint(
//     Canvas canvas,
//     Offset offset,
//     ImageConfiguration configuration,
//   ) {
//     assert(configuration.size != null);
//     final Rect rect = offset & configuration.size!;
//     final TextDirection textDirection = configuration.textDirection!;
//     //调用 decoration._indicatorRectFor(rect, textDirection) 方法计算出指示器的位置和尺寸，
//     //并使用 deflate 方法缩小矩形的大小，以便将边框的一半包含在矩形内。
//     final Rect indicator = decoration._indicatorRectFor(rect, textDirection).deflate(decoration.borderSide.width / 2.0);
//     const gradient = LinearGradient(
//       colors: [Color(0xFFFA709A), Color(0xFFFF8C1A)],
//       begin: Alignment.centerLeft,
//       end: Alignment.centerRight,
//     );
//     final Paint paint = decoration.borderSide.toPaint()
//       ..shader = gradient.createShader(indicator)
//       ..strokeCap = decoration.strokeCap; //这块更改为想要的形状
//     canvas.drawLine(indicator.bottomLeft, indicator.bottomRight, paint);
//   }
// }
