import 'package:flutter/material.dart';

import '../utils/utils.dart';

class CircleCountdown extends StatefulWidget {
  const CircleCountdown({
    Key? key,
    this.size = const Size(80, 80),
    required this.onFinish,
    required this.second,
    this.strokeWidth = 4,
    this.text,
  })  : color = Colors.blueAccent,
        super(key: key);
  final Size size;
  final VoidCallback onFinish;
  final int second;
  final Color color;
  final double strokeWidth;
  final String? text;

  @override
  State<CircleCountdown> createState() => _CircleCountdownState();
}

class _CircleCountdownState extends State<CircleCountdown> {
  ValueNotifier<double> countdown = ValueNotifier(0);
  late TimerUtil timer;

  @override
  void initState() {
    super.initState();
    timer = TimerUtil(mInterval: 1000, mTotalTime: widget.second * 1000);
    timer.setOnTimerTickCallback((ticker) {
      if (ticker == 0) {
        timer.cancel();
        widget.onFinish();
        return;
      }
      countdown.value = countdown.value + 1 / widget.second;
      setState(() {});
    });
    timer.startCountDown();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String text = widget.text ?? '${(widget.second - countdown.value * widget.second).toInt()}秒';
    return GestureDetector(
      onTap: () {
        timer.cancel();
        widget.onFinish();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            backgroundColor: Colors.grey.withAlpha(33),
            valueColor: AlwaysStoppedAnimation(widget.color),
            value: countdown.value,
            strokeWidth: widget.strokeWidth,
          ),
          Text(text)
        ],
      ),
    );
  }
}
