/*
 * create by abert.zhang
 */

import 'dart:math';

import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';

class GameCoronaExample extends StatefulWidget {
  const GameCoronaExample({super.key, required this.size, this.innerRadius = 20});
  final double innerRadius;
  final Size size;
  @override
  State<GameCoronaExample> createState() => _GameCoronaExampleState();
}

class _GameCoronaExampleState extends State<GameCoronaExample> {
  final ValueNotifier<Offset> _offsetNotify = ValueNotifier(Offset.zero);
  late final double outRadius;
  late final double minSide;
  double _angle = 0;
  @override
  void initState() {
    super.initState();
    minSide = min(widget.size.width / 2, widget.size.height / 2);
    outRadius = minSide - widget.innerRadius;
  }

  void move(double angle) {
    _angle = angle * 0.6;
    LogUtil.v(_angle);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onPanEnd: (DragEndDetails details) {
              // move(0);
              _offsetNotify.value = Offset.zero;
            },
            onPanDown: (details) {
              double dx = details.localPosition.dx - minSide;
              double dy = details.localPosition.dy - minSide;
              //计算夹角--弧度
              double radian = atan2(dx, dy);
              LogUtil.v('三角函数:${atan2(-1, -1) * 180 / pi}');
              // LogUtil.v('弧度:$radian');
              double radius = sqrt(dx * dx + dy * dy);
              if (radius > outRadius) {
                radian = radian - pi / 2;
                dx = outRadius * cos(radian);
                dy = -outRadius * sin(radian);
              }
              LogUtil.v(Offset(dx, dy));
              move(radian * 180 / pi);
              _offsetNotify.value = Offset(dx, dy);
            },
            onPanUpdate: parser,
            child: CustomPaint(
              painter: GameCoronaPainter(
                repaint: _offsetNotify,
                innerRadius: widget.innerRadius,
                outRadius: outRadius,
                move: move,
              ),
              size: widget.size,
            ),
          ),
          Center(
            child: Transform.rotate(
              angle: _angle,
              child: Container(
                width: 100,
                height: 80,
                color: Colors.blueGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void parser(DragUpdateDetails details) {
    double dx = details.localPosition.dx - minSide;
    double dy = details.localPosition.dy - minSide;
    //计算夹角--弧度
    double radian = atan2(dx, dy);
    double angle = radian * 180 / pi;
    LogUtil.v('弧度:$radian');
    LogUtil.v('度数:$angle');
    double radius = sqrt(dx * dx + dy * dy);
    if (radius > outRadius) {
      radian = radian - pi / 2;
      dx = outRadius * cos(radian);
      dy = -outRadius * sin(radian);
    }
    LogUtil.v(Offset(dx, dy));
    move(angle);
    _offsetNotify.value = Offset(dx, dy);
  }
}

class GameCoronaPainter extends CustomPainter {
  GameCoronaPainter({
    required this.repaint,
    this.innerRadius = 20,
    required this.outRadius,
    required this.move,
  }) : super(repaint: repaint) {
    _paint
      ..color = Colors.blue
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
  }
  void Function(double) move;
  ValueNotifier<Offset> repaint;
  final Paint _paint = Paint();
  double innerRadius;
  double outRadius;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Offset.zero & size);
    canvas.translate(size.width / 2, size.height / 2);
    canvas.drawCircle(Offset.zero, outRadius, _paint..color = Colors.blueGrey.withOpacity(0.5));
    canvas.drawCircle(repaint.value, innerRadius, _paint..color = Colors.purple.withOpacity(0.8));
    canvas.drawLine(Offset.zero, repaint.value, _paint);
  }

  @override
  bool shouldRepaint(covariant GameCoronaPainter oldDelegate) {
    return oldDelegate.innerRadius != innerRadius || oldDelegate.repaint != repaint;
  }
}
