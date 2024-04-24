/*
 * create by zhangchunhua
 */
import 'dart:math';

import 'package:flutter/material.dart';

class RectArcCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint painter = Paint()..color = const Color(0xFF3478FF);
    Offset offset = Offset(size.width * 0.5, size.height * 0);
    canvas.drawArc(Rect.fromCenter(center: offset, width: size.width * 1.05, height: size.height * 2), 0, pi, true, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
