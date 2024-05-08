import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class PolarTrendEffect extends StatefulWidget {
  const PolarTrendEffect({Key? key}) : super(key: key);
  @override
  State<PolarTrendEffect> createState() => _PolarTrendEffectState();
}

class _PolarTrendEffectState extends State<PolarTrendEffect> with SingleTickerProviderStateMixin {
  late AnimationController ctrlAnimation;
  @override
  void initState() {
    super.initState();
    ctrlAnimation = AnimationController(
      duration: const Duration(seconds: 15),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: PolarTrendPainter(ctrlAnimation),
        size: const Size(300, 400),
      ),
    );
  }

  @override
  void dispose() {
    ctrlAnimation.dispose();
    super.dispose();
  }
}

class PolarTrendPainter extends CustomPainter {
  final Animation<double> repaint;
  final List<Offset> points = [];
  Path path = Path();
  final double step = 4;
  final double min = 0;
  final double max = 360;
  PolarTrendPainter(this.repaint) : super(repaint: repaint) {
    initPoints();
  }
  //极函数
  double polar(double x) {
    double y = 150 * sin(5 * x).abs();
    // double y = 150 * sin(9 * x).abs();
    return y;
  }

  //初始化
  void initPoints() {
    for (double i = min; i < max; i += step) {
      //角度转化为弧度
      double x = (pi / 180 * i);
      var y = polar(x);
      points.add(Offset(y * cos(x), y * sin(x)));
    }
    double x = (pi / 180 * max);
    points.add(Offset(polar(x) * cos(x), polar(x) * sin(x)));
    points.add(Offset(polar(x) * cos(x), polar(x) * sin(x)));
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    Paint paint = Paint()
      ..color = Colors.redAccent
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    var colors = [
      const Color(0xFFF60C0C),
      const Color(0xFFF3B913),
      const Color(0xFFE7F716),
      const Color(0xFF3DF30B),
      const Color(0xFF0DF6EF),
      const Color(0xFF0829FB),
      const Color(0xFFB709F4),
    ];
    var pos = [1.0 / 7, 2.0 / 7, 3.0 / 7, 4.0 / 7, 5.0 / 7, 6.0 / 7, 1.0];

    paint.shader = ui.Gradient.linear(
      const Offset(0, 0),
      const Offset(100, 0),
      colors,
      pos,
      TileMode.mirror,
    );

    Offset p1 = points[0];
    path.reset();
    path.moveTo(p1.dx, p1.dy);
    for (int i = 1; i < points.length - 1; i++) {
      double xc = (points[i].dx + points[i + 1].dx) / 2;
      double yc = (points[i].dy + points[i + 1].dy) / 2;
      Offset p2 = points[i];
      path.quadraticBezierTo(p2.dx, p2.dy, xc, yc);
    }
    // canvas.drawPath(path, paint);
    ui.PathMetrics pms = path.computeMetrics();
    for (var pm in pms) {
      ui.Tangent? tangent = pm.getTangentForOffset(pm.length * repaint.value);
      if (tangent == null) return;
      canvas.drawPath(pm.extractPath(0, pm.length * repaint.value), paint);

      canvas.drawCircle(tangent.position, 5, Paint()..color = Colors.blue);
    }
  }

  @override
  bool shouldRepaint(covariant PolarTrendPainter oldDelegate) {
    return oldDelegate.repaint != repaint;
  }
}
