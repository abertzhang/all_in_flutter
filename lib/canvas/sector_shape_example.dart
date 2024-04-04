/*
 * create by abert.zhang
 */
import 'dart:math';
import 'dart:ui';

import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';

class SectorShapeExample extends StatefulWidget {
  const SectorShapeExample({super.key, required this.size});
  final Size size;

  @override
  State<SectorShapeExample> createState() => _SectorShapeExampleState();
}

class _SectorShapeExampleState extends State<SectorShapeExample> {
  ValueNotifier<double> valueListen = ValueNotifier<double>(0);
  late TimerUtil timer;
  @override
  void initState() {
    super.initState();
    timer = TimerUtil(mInterval: 100);
    timer.setOnTimerTickCallback((ticker) {
      if (valueListen.value >= 1) valueListen.value = 0;
      valueListen.value += 100 / 4000;
    });
    timer.startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: CustomPaint(
        painter: SectorShapePainter(valueListen),
        size: widget.size,
      ),
    );
  }
}

class SectorShapePainter extends CustomPainter {
  ValueNotifier<double> valueListen;

  SectorShapePainter(this.valueListen) : super(repaint: valueListen);

  @override
  void paint(Canvas canvas, Size size) {
    SectorShapeBean sector = SectorShapeBean(
      center: Offset.zero,
      innerRadius: 90,
      outRadius: 165,
      startAngle: 0,
      sweepAngle: 145,
    );

    Paint paint = Paint()..style = PaintingStyle.stroke;
    canvas.translate(size.width / 2, size.height / 2);

    Path path = sector.pathByCombine();
    // canvas.drawPath(path, paint..style);

    PathMetrics pms = path.computeMetrics();
    for (var pm in pms) {
      Tangent? tangent = pm.getTangentForOffset(pm.length * valueListen.value);
      if (tangent == null) continue;
      canvas.drawPath(pm.extractPath(pm.length * valueListen.value * 0.1, pm.length * valueListen.value), paint..style);
      canvas.drawCircle(tangent!.position, 5, paint..color = Colors.blue);
    }
  }

  @override
  bool shouldRepaint(covariant SectorShapePainter oldDelegate) {
    return oldDelegate.valueListen.value != valueListen.value;
  }
}

class SectorShapeBean {
  late Offset center;
  late double innerRadius;
  late double outRadius;
  late double startAngle;
  late double sweepAngle;

  SectorShapeBean({
    required this.center,
    required this.innerRadius,
    required this.outRadius,
    required this.startAngle,
    required this.sweepAngle,
  });

  Path pathByCombine({Offset center = Offset.zero}) {
    Path pathInner = Path();
    Path pathOut = Path();
    //外圆扇形
    pathOut.addArc(
      Rect.fromCenter(center: center, width: outRadius, height: outRadius),
      startAngle * pi / 180,
      sweepAngle * pi / 180,
    );
    pathOut.lineTo(0, 0);
    pathOut.close();
    //内圆扇形
    pathInner.addArc(
      Rect.fromCenter(center: center, width: innerRadius, height: innerRadius),
      startAngle * pi / 180,
      sweepAngle * pi / 180,
    );
    pathInner.lineTo(0, 0);
    pathInner.close();
    return Path.combine(PathOperation.difference, pathOut, pathInner);
  }

  Path pathByMath({Offset center = Offset.zero}) {
    //求出扇形的四个坐标位置

    return Path();
  }
}
