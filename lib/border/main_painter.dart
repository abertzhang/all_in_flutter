import 'package:flutter/material.dart';

/*
参考资料
https://juejin.cn/post/7250071693544685625

*/
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Painter渐变边框')),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      children: [
        Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(shape: BoxShape.circle),
          // color: Colors.red,
          child: LayoutBuilder(
            builder: (ctx, bc) {
              return CustomPaint(
                foregroundPainter: GradientBorderPainter(
                  colors: [Colors.green, Colors.red, Colors.blue],
                  width: bc.maxWidth,
                  height: bc.maxHeight,
                ),
                size: Size(280, 48),
                child: Center(child: Text('paiter')),
              );
            },
          ),
        )
      ],
    );
  }
}

//画板
class GradientBorderPainter extends CustomPainter {
  final List<Color> colors;
  final double width;
  final double height;
  final double strokeWidth;

  GradientBorderPainter({
    required this.colors,
    required this.width,
    required this.height,
    this.strokeWidth = 5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    //
    final double rectWidth = width;
    final double rectHeight = height;
    const double radius = 10.0;
    // Rect rect = Offset(size.width / 2 - rectWidth / 2, size.height - rectHeight / 2) & Size(rectWidth, rectHeight);
    Rect rect = Offset(0, 0) & Size(rectWidth, rectHeight);
    RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(radius));
    //开始绘制
    Paint paint = Paint()
      ..shader = (LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: colors).createShader(rect))
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    // canvas.drawRRect(rRect, paint);
    canvas.drawCircle(Offset(size.width / 2, size.width / 2), size.width / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
