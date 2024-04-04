import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('特效演示')),
        body: const PacManOne(radius: 300),
      ),
    ),
  );
}

class PacManOne extends StatefulWidget {
  const PacManOne({Key? key, required this.radius}) : super(key: key);
  final double radius;

  @override
  State<PacManOne> createState() => _PacManOneState();
}

class _PacManOneState extends State<PacManOne> with SingleTickerProviderStateMixin {
  late AnimationController ctrlAnimation;
  @override
  void initState() {
    ctrlAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PacManPainter(ctrlAnimation),
      size: Size(widget.radius, widget.radius),
    );
  }
}

class PacManPainter extends CustomPainter {
  late Animation<double> ctrlAnimation;
  late Animation<double> animationAngle;
  late Animation<Color?> animationColor;

  PacManPainter(this.ctrlAnimation) : super(repaint: ctrlAnimation);

  Paint paintDou = Paint();
  @override
  void paint(Canvas canvas, Size size) {
    //颜色变化值
    animationColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: ctrlAnimation,
      curve: Curves.linearToEaseOut,
    ));
    //角度变化值
    animationAngle = Tween<double>(begin: 5, end: 40).animate(CurveTween(
      curve: Curves.easeOut,
    ).animate(ctrlAnimation));
    //张嘴角度
    double sweepAngle = 360 - 2 * animationAngle.value;
    canvas.translate(size.width / 2, size.height / 2);
    double short = min(size.width / 2, size.height / 2);
    Rect rect = Rect.fromCenter(center: Offset.zero, width: short, height: short);
    paintDou.color = animationColor.value ?? Colors.blue;
    canvas.drawArc(rect, pi / 180 * animationAngle.value, pi / 180 * sweepAngle, true, paintDou);
  }

  @override
  bool shouldRepaint(covariant PacManPainter oldDelegate) {
    return oldDelegate.ctrlAnimation != ctrlAnimation;
  }
}
