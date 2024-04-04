import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: Scaffold(appBar: AppBar(title: const Text('特效演示')), body: const PathMetricsEffect()),
    ),
  );
}

class PathMetricsEffect extends StatefulWidget {
  const PathMetricsEffect({Key? key, this.width = 300, this.height = 300}) : super(key: key);
  final double width;
  final double height;
  @override
  State<PathMetricsEffect> createState() => _PathMetricsEffectState();
}

class _PathMetricsEffectState extends State<PathMetricsEffect> with SingleTickerProviderStateMixin {
  late AnimationController ctrlAnimation;

  @override
  void initState() {
    super.initState();
    ctrlAnimation = AnimationController(duration: const Duration(seconds: 10), vsync: this);
    ctrlAnimation.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: CustomPaint(
        painter: MetricsPainter(progress: ctrlAnimation),
        size: Size(widget.width, widget.height),
      ),
    );
  }

  @override
  void dispose() {
    ctrlAnimation.dispose();
    super.dispose();
  }
}

class MetricsPainter extends CustomPainter {
  final Animation<double> progress;

  MetricsPainter({required this.progress}) : super(repaint: progress);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 3);
    Paint paint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path
      ..relativeMoveTo(0, 0)
      ..relativeLineTo(-30, 120)
      ..relativeLineTo(30, -30)
      ..relativeLineTo(30, 30)
      ..close();
    path.addOval(Rect.fromCenter(center: Offset.zero, width: 50, height: 50));
    PathMetrics pms = path.computeMetrics();
    for (var pm in pms) {
      Tangent? tangent = pm.getTangentForOffset(pm.length * progress.value);
      if (tangent == null) continue;
      canvas.drawCircle(tangent.position, 5, Paint()..color = Colors.deepOrange);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant MetricsPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
