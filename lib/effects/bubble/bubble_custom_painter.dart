import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bubble_bean.dart';

class BubbleCustomPainter extends CustomPainter {
  final Paint _paint = Paint();
  late List<BubbleBean>? list;

  BubbleCustomPainter(this.list);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //每次重新计算位置
    list?.forEach((bobble) {
      //计算偏移
      var velocity = calculateXY(bobble.speed ?? 0, bobble.theta ?? 0);
      var dx = (bobble.position?.dx ?? 0) + (velocity.dx);
      var dy = (bobble.position?.dy ?? 0) + (velocity.dy);
      //x轴边界计算
      if ((bobble.position?.dx ?? 0) < 0 || (bobble.position?.dx ?? 0) > size.width) {
        dx = Random.secure().nextDouble() * size.width;
      }
      //y轴边界计算
      if ((bobble.position?.dy ?? 0) < 0 || (bobble.position?.dy ?? 0) > size.height) {
        dy = Random.secure().nextDouble() * size.height;
      }
      bobble.position = Offset(dx, dy);
    });
    //循环绘制气泡
    list?.forEach((bobble) {
      _paint.color = bobble.color ?? Colors.lightBlueAccent;
      canvas.drawCircle(bobble.position!, bobble.radius!, _paint);
    });
  }

  Offset calculateXY(double speed, double angle) {
    return Offset(speed * cos(angle), speed * sin(angle));
  }
}
