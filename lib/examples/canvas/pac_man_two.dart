import 'dart:math';

import 'package:flutter/material.dart';

class PacManTwo extends StatefulWidget {
  const PacManTwo({Key? key, required this.radius}) : super(key: key);
  final double radius;

  @override
  State<PacManTwo> createState() => _PacManTwoState();
}

class _PacManTwoState extends State<PacManTwo> with SingleTickerProviderStateMixin {
  late AnimationController ctrlAnimation;
  late Animation<double> ctrlAngle;
  late Animation<Color?> ctrlColor;
  @override
  void initState() {
    ctrlAnimation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    // ctrlAngle = ctrlAnimation.drive(Tween(begin: 10, end: 40));
    ctrlAngle = Tween<double>(begin: 10, end: 40).animate(CurvedAnimation(
      parent: ctrlAnimation,
      curve: Curves.slowMiddle,
    ));
    // ctrlColor = ColorTween(begin: Colors.blue, end: Colors.red).animate(ctrlAnimation);
    ctrlColor = ColorTween(begin: Colors.blue, end: Colors.red).animate(
      ReverseAnimation(ctrlAnimation),
    );
    ctrlColor = ColorTween(begin: Colors.blue, end: Colors.red).animate(
      CurvedAnimation(curve: Curves.easeOut, parent: ctrlAnimation),
    );

    ctrlAnimation.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PacManPainter(ctrlAnimation, ctrlAngle, ctrlColor),
      size: Size(widget.radius, widget.radius),
    );
  }

  @override
  void dispose() {
    ctrlAnimation.dispose();
    super.dispose();
  }
}

class PacManPainter extends CustomPainter {
  late Animation<double> ctrlAnimation;
  late Animation<double> animationAngle;
  late Animation<Color?> animationColor;

  PacManPainter(this.ctrlAnimation, this.animationAngle, this.animationColor) : super(repaint: ctrlAnimation);

  Paint paintDou = Paint();
  @override
  void paint(Canvas canvas, Size size) {
    animationColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(ctrlAnimation);
    double sweepAngle = 360 - 2 * animationAngle.value;
    canvas.translate(size.width / 2, size.height / 2);
    double short = min(size.width / 2, size.height / 2);
    Rect rect = Rect.fromCenter(center: Offset.zero, width: short, height: short);
    paintDou.color = animationColor.value ?? Colors.blue;
    canvas.drawArc(rect, pi / 180 * animationAngle.value, pi / 180 * sweepAngle, true, paintDou);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
