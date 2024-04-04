import 'dart:async';

import 'package:flutter/gestures.dart';

typedef GestureNTapCallback = void Function();
typedef GestureNTapDownCallback = void Function(TapDownDetails details, int n);
typedef GestureNTapCancelCallback = void Function(int n);

/*
  1 相邻触点大于 200 ms --- 取消 N 击
  2 触点自己触发取消事件 --- 取消 N 击
  3 落点在追踪中偏移量 > 18 逻辑像素 --- 取消 N 击
  4 落点与第一触点距离 > 200逻辑像素 --- 无效 N 击
  5 相邻触点间距 小于 40 ms --- 无效 N 击，重新追踪
* */
class NTapGestureRecognizer extends GestureRecognizer {
  NTapGestureRecognizer({Object? debugOwner, required PointerDeviceKind kind, this.maxN = 3}) : super(debugOwner: debugOwner);
  GestureNTapCallback? onNTap;
  GestureNTapCancelCallback? onNTapCancel;
  GestureNTapDownCallback? onNTapDown;
  final int maxN;
  // late _TapTracker _preTap;
  int tapCount = 0;
  // late final Map<int, _TapTracker> _trackers = <int, _TapTracker>{};
  // late Timer _tapTimer;
  @override
  void acceptGesture(int pointer) {
    // TODO: implement acceptGesture
  }

  @override
  // TODO: implement debugDescription
  String get debugDescription => 'N tap';

  @override
  void rejectGesture(int pointer) {
    // TODO: implement rejectGesture
  }
}

class _TapTracker {
  _TapTracker({
    required PointerDownEvent event,
    required this.entry,
    required Duration doubleTapMinTime,
  })  : assert(doubleTapMinTime != null),
        assert(event != null),
        assert(event.buttons != null),
        pointer = event.pointer,
        _initialGlobalPosition = event.position,
        initialButtons = event.buttons,
        _doubleTapMinTimeCountdown = _CountdownZoned(duration: doubleTapMinTime);

  final int pointer;
  final GestureArenaEntry entry;
  final Offset _initialGlobalPosition;
  final int initialButtons;
  final _CountdownZoned _doubleTapMinTimeCountdown;

  bool _isTrackingPointer = false;

  void startTrackingPointer(PointerRoute route, Matrix4 transform) {
    if (!_isTrackingPointer) {
      _isTrackingPointer = true;
      GestureBinding.instance.pointerRouter.addRoute(pointer, route, transform);
    }
  }

  void stopTrackingPointer(PointerRoute route) {
    if (_isTrackingPointer) {
      _isTrackingPointer = false;
      GestureBinding.instance.pointerRouter.removeRoute(pointer, route);
    }
  }

  bool isWithinGlobalTolerance(PointerEvent event, double tolerance) {
    final Offset offset = event.position - _initialGlobalPosition;
    return offset.distance <= tolerance;
  }

  bool hasElapsedMinTime() {
    return _doubleTapMinTimeCountdown.timeout;
  }

  bool hasSameButton(PointerDownEvent event) {
    return event.buttons == initialButtons;
  }
}

class _CountdownZoned {
  _CountdownZoned({required Duration duration}) : assert(duration != null) {
    Timer(duration, _onTimeout);
  }

  bool _timeout = false;

  bool get timeout => _timeout;

  void _onTimeout() {
    _timeout = true;
  }
}
