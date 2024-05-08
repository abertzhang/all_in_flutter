/*
 * create by zhangchunhua
 */

import 'dart:async';

class TimerPeriod {
  //定义
  late Timer _timer;
  int durationSecond = 0;
  int interval = 1000;

  void start() {
    if (_timer.isActive) _timer.cancel();
    _timer = Timer.periodic(Duration(milliseconds: interval), (timer) {});
  }

  void pause() {
    if (!_timer.isActive) return;
    durationSecond += _timer.tick;
    _timer.cancel();
  }

  void close() {
    if (!_timer.isActive) return;
    durationSecond += _timer.tick;
    _timer.cancel();
  }

  TimerPeriod({this.durationSecond = 0, this.interval = 1000}) {
    _timer = Timer.periodic(Duration(milliseconds: interval), (timer) {});
  }
}
