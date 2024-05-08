/*
 * create by abert.zhang
 */

import 'package:flutter/material.dart';

import 'circle.dart';

class CircleTween extends Tween<Circle> {
  @override
  Circle lerp(double t) {
    return Circle(
      color: Color.lerp(begin!.color, end!.color, t),
      radius: (begin?.radius ?? 0 + (end?.radius ?? .0 - (begin?.radius ?? 0)) * t),
      center: Offset.lerp(begin?.center, end?.center, t),
    );
  }

  // @override
  // Circle transform(double t) {
  //   if (t == 0) return begin as Circle;
  //   if (t == 1) return begin ?? Circle();
  //   return lerp(t);
  // }
}
