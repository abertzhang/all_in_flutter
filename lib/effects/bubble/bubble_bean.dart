import 'package:flutter/material.dart';

class BubbleBean {
  Offset? position; //位置
  Color? color; //颜色
  double? speed; //速度
  double? theta; //角度,angle
  double? radius; //半径

  BubbleBean({this.position, this.color, this.speed, this.theta, this.radius});

  // Map<String, dynamic> toMap() {
  //   return {
  //     'position': position.toMap(),
  //     'color': color.toMap(),
  //     'speed': speed,
  //     'theta': theta,
  //     'radius': radius,
  //   };
  // }
}
