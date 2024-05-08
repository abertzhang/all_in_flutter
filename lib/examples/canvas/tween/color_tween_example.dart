/*
 * create by abert.zhang
 */

import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';

import 'circle.dart';

class ColorTweenExample extends StatefulWidget {
  const ColorTweenExample({Key? key}) : super(key: key);

  @override
  State<ColorTweenExample> createState() => _ColorTweenExampleState();
}

class _ColorTweenExampleState extends State<ColorTweenExample> {
  late TimerUtil timer;
  ValueNotifier<Circle> circleNotifier = ValueNotifier(Circle(color: Colors.redAccent, radius: 30, center: Offset.zero));
  ValueNotifier<double> notifier = ValueNotifier(0);
  @override
  void initState() {
    super.initState();
    timer = TimerUtil(mInterval: 300);
    timer.setOnTimerTickCallback((ticker) {
      if (notifier.value >= 30) notifier.value = 0;
      notifier.value += 1;
      LogUtil.v(ticker);
    });
    timer.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 300,
      height: 200,
      color: Colors.white,
      child: AnimatedBuilder(
        animation: notifier,
        builder: (BuildContext context, Widget? child) {
          LogUtil.v(notifier.value);
          return Center(
            child: Container(
              color: Colors.cyan,
              width: 30 - notifier.value,
              height: 40 + notifier.value,
            ),
          );
        },
      ),
    ));
  }
}
