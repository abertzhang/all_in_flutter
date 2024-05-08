/*
 * create by abert.zhang
 */

import 'package:flutter/material.dart';

class ParticleBean {
  Size size;
  Color color;
  double dx;
  double accelerateX;
  double velocityX;
  double dy;
  double accelerateY;
  double velocityY;
  double dz;
  double accelerateZ;
  double velocityZ;
  double maxY; //最大垂直高度

  ParticleBean({
    this.size = Size.zero,
    this.color = Colors.blue,
    this.dx = 0,
    this.accelerateX = 0,
    this.velocityX = 0,
    this.dy = 0,
    this.accelerateY = 0,
    this.velocityY = 0,
    this.dz = 0,
    this.accelerateZ = 0,
    this.velocityZ = 0,
    this.maxY = 0,
  });
}
