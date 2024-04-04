/*
 * create by abert.zhang
 */

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class PolarMath extends StatelessWidget {
  const PolarMath({
    Key? key,
    required this.polar,
    this.size = const Size(300, 300),
  }) : super(key: key);
  final Polar polar;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PolarMathPainter(polar: polar),
      // size: Size(Get.width, Get.width),
      size: Size(300, 300),
    );
  }
}

///极函数
///x,y都是弧度
///y=10*x
///y=100*(1-cos x)
///y=150*|sin(5*x)|
typedef Polar = double Function(double);

class PolarMathPainter extends CustomPainter {
  final double step;
  final double min;
  final double max;
  List<Offset> points = [];
  Polar polar;

  PolarMathPainter({required this.polar, this.step = 3, this.min = 0, this.max = 360 * 3});
  //ρ = 10 * θ,极坐标是由 (θ，ρ) 构成的坐标系统，其中 θ 是点与 x 轴的夹角，ρ 是点与原点的长度
  Paint paintCoordinate = Paint()..color = Colors.lightBlueAccent;
  void getPolarPoints() {
    points.clear();
    for (double x = min; x <= max; x += step) {
      double polarX = x * pi / 180;
      double polarY = polar(polarX);
      points.add(Offset(polarY * cos(polarX), polarY * sin(polarX)));
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    //画布中心点
    canvas.translate(size.width / 2, size.height / 2);
    // CoordinateUtil().drawGrid(canvas, size, paint: paintCoordinate);
    // CoordinateUtil().drawAxis(canvas, size, paint: paintCoordinate..color = Colors.redAccent);
    getPolarPoints();
    canvas.drawPoints(PointMode.polygon, points, Paint()..color = Colors.black);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
