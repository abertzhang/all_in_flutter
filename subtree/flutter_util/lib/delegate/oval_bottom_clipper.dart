/*
 *  create by zhangchunhua
 */

import 'package:flutter/material.dart';

class OvalBottomClipper extends CustomClipper<Path> {
  double waveHeight;
  double? waveWidth;

  OvalBottomClipper({this.waveWidth, required this.waveHeight});

  @override
  Path getClip(Size size) {
    if (waveHeight > size.height) waveHeight = size.height;
    waveWidth ??= size.width;

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height - waveHeight);
    path.relativeQuadraticBezierTo(waveWidth! / 2, 2 * waveHeight, waveWidth!, 0);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
