import 'package:flutter/animation.dart';

///自定义的cure
///效果--t完成后,0马上变成1
class ShakeCurve extends Curve {
  final double value;
  const ShakeCurve(this.value);
  @override
  double transform(double t) {
    return t < value ? 0.0 : 1.0;
  }
}
