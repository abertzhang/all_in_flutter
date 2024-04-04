import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('特效演示')),
        body: const BezierCircleEffect(
          radius: 300,
        ),
      ),
    ),
  );
}

class BezierCircleEffect extends StatelessWidget {
  const BezierCircleEffect({Key? key, required this.radius}) : super(key: key);
  final double radius;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BezierCirclePainter(),
      size: Size(radius, radius),
    );
  }
}

class BezierCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const rate = 0.5522;
    const r1 = 100.0;
    const r2 = 100.0;

    Path path = Path();
    Paint paint = Paint()..style = PaintingStyle.stroke;

    Offset p0 = const Offset(-r1, 0);
    //
    Offset p1 = const Offset(-r1, rate * r2);
    Offset p2 = const Offset(-r1 * rate, r2);
    Offset p3 = const Offset(0, r2);
    //
    Offset p4 = const Offset(r1 * rate, r2);
    Offset p5 = const Offset(r1, r2 * rate);
    Offset p6 = const Offset(r1, 0);
    //
    Offset p7 = const Offset(r1, -r2 * rate);
    Offset p8 = const Offset(r1 * rate, -r2);
    Offset p9 = const Offset(0, -r2);
    //
    Offset p10 = const Offset(-r1 * rate, -r2);
    Offset p11 = const Offset(-r1, -r2 * rate);
    Offset p12 = p0;
    //
    canvas.save();
    canvas.translate(size.width / 2, size.height / 2);
    path.moveTo(p0.dx, p0.dy);
    path.cubicTo(p1.dx, p1.dy, p2.dx, p2.dy, p3.dx, p3.dy);
    path.cubicTo(p4.dx, p4.dy, p5.dx, p5.dy, p6.dx, p6.dy);
    path.cubicTo(p7.dx, p7.dy, p8.dx, p8.dy, p9.dx, p9.dy);
    path.cubicTo(p10.dx, p10.dy, p11.dx, p11.dy, p12.dx, p12.dy);
    canvas.drawPath(path, paint);
    //画贝塞尔点
    paint
      ..style = PaintingStyle.fill
      ..color = Colors.red;
    canvas.drawCircle(p0, 3, paint);
    canvas.drawCircle(p1, 3, paint);
    canvas.drawCircle(p2, 3, paint);
    canvas.drawCircle(p3, 3, paint);
    canvas.drawPoints(PointMode.polygon, [p0, p1, p2, p3], paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
