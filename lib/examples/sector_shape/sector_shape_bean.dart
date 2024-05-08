/*
 * create by abert.zhang
 */

import 'dart:math';

import 'package:flutter/material.dart';

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
