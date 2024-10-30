## 抽象类Curve

- 子类

```
CatmullRomCurve 
Cubic 
ElasticInCurve 
ElasticInOutCurve 
ElasticOutCurve 
FlippedCurve 
Interval 
SawTooth 
Threshold
```

- 类函数

```
//自定义Curve通过override下面函数实现
double transformInternal(double t) 
```

- 代码自定义Curve

```
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: CustomCurve()));
class CustomCurve extends StatefulWidget {
  @override
  _CustomCurveState createState() => _CustomCurveState();
}
class _CustomCurveState extends State<CustomCurve>
    with TickerProviderStateMixin {
  AnimationController ctrlAnimation;
  Animation animation;
  @override
  void initState() {
    super.initState();
    ctrlAnimation =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation =
        ctrlAnimation.drive(CurveTween(curve: StairsCurve(20)))
            .drive(Tween(begin: 50.0, end: 100.0));
//    animation = Tween(begin: 50.0, end: 100.0)
//        .chain(CurveTween(curve: StairsCurve(20)))
//        .chain(CurveTween(curve: Curves.bounceInOut))
//        .chain(Tween(begin: 0, end: 1))
//        .animate(ctrlAnimation);
    ctrlAnimation.forward();
    ctrlAnimation.addListener(() => setState(() {}));
    ctrlAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.reverse) {
        ctrlAnimation.reverse();
      } else {
        ctrlAnimation.forward();
      }
    });
  }
  @override
  void dispose() {
    ctrlAnimation.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) =>
      Scaffold(
          appBar: AppBar(title: Text('CustomCurved')),
          body: Container(
              child:
              Icon(Icons.favorite, size: animation.value, color: Colors.red)));
}
class StairsCurve extends Curve {
  final int num;
  double _perStairY;
  double _perStairX;
  StairsCurve(this.num) {
    _perStairY = 1.0 / (num - 1);
    _perStairX = 1.0 / num;
  }
  @override
  double transformInternal(double t) {
    return _perStairY * (t / _perStairX).floor();
  }
}
```

- 其他