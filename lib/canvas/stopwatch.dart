import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

const double _kScaleWidthRate = 0.4 / 10;
const double _kIndicatorRate = 0.2 / 10;
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('枚举新功能')),
        body: StopwatchClock(
          radius: 300,
          duration: Duration(seconds: 2),
        ),
      ),
    ),
  );
}

class StopwatchClock extends StatefulWidget {
  final double radius;
  final Duration duration;
  final Color? themeColor;
  final TextStyle? textStyle;
  final Color? scaleColor;

  const StopwatchClock({
    Key? key,
    required this.radius,
    required this.duration,
    this.themeColor = const Color(0xffDADADA),
    this.textStyle = const TextStyle(fontSize: 12, color: Color(0xff343434)),
    this.scaleColor = const Color(0xffDADADA),
  }) : super(key: key);

  @override
  State<StopwatchClock> createState() => _StopwatchClockState();
}

class _StopwatchClockState extends State<StopwatchClock> {
  TextStyle get commonStyle => TextStyle(
        fontSize: widget.radius / 3,
        fontWeight: FontWeight.w200,
        color: const Color(0xff343434),
      );
  late Ticker ticker;
  Duration dt = Duration.zero;
  Duration lastDuration = Duration.zero;
  void onTick(Duration elapsed) {
    dt = elapsed - lastDuration;
    durationNotifier.value += dt;
    lastDuration = elapsed;
  }

  ValueNotifier durationNotifier = ValueNotifier<Duration>(Duration.zero);
  @override
  void initState() {
    super.initState();
    ticker = Ticker(onTick);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ValueListenableBuilder(
            valueListenable: durationNotifier,
            builder: (ctx, v, w) {
              return CustomPaint(
                painter: StopwatchPainter(
                  duration: v,
                  themeColor: widget.themeColor!,
                  scaleColor: widget.scaleColor!,
                  textStyle: widget.textStyle!,
                ),
                size: Size(widget.radius * 2, widget.radius * 2),
              );
            }),
        Positioned(
          bottom: widget.radius / 3,
          child: Row(
            children: [
              TextButton(
                  onPressed: () {
                    if (ticker.isTicking) {
                      ticker.stop();
                      lastDuration = Duration.zero;
                    } else {
                      ticker.start();
                    }
                  },
                  child: const Text('开始')),
              const SizedBox(width: 5),
              TextButton(
                  onPressed: () {
                    if (ticker.isTicking) {
                      ticker.stop();
                      lastDuration = Duration.zero;
                    }
                    durationNotifier.value = Duration.zero;
                  },
                  child: const Text('重置')),
            ],
          ),
        )
      ],
    );
  }
}

class StopwatchPainter extends CustomPainter {
  final Duration duration;
  final Color themeColor;
  final Color scaleColor; //刻度色
  final TextStyle textStyle;

  StopwatchPainter({
    required this.duration,
    required this.themeColor,
    required this.scaleColor,
    required this.textStyle,
  });

  final Paint scalePainter = Paint();
  final Paint indicatorPainter = Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.green;
  double indicatorRadius = 0;
  int minute = 0;
  int second = 0;
  int millisecond = 0;
  double radians = 0;
  @override
  void paint(Canvas canvas, Size size) {
    indicatorRadius = size.width * _kIndicatorRate;
    minute = duration.inMinutes % 60;
    second = duration.inSeconds % 60;
    millisecond = duration.inMilliseconds % 1000;
    radians = (second * 1000 + millisecond) / (60 * 1000) * 2 * pi;
    canvas.translate(size.width / 2, size.height / 2);
    scalePainter
      ..color = Colors.red
      ..style = PaintingStyle.stroke;
    final double scaleLineWidth = size.width * _kScaleWidthRate;
    for (int i = 0; i < 180; i++) {
      canvas.drawLine(
        Offset(size.width / 2, 0),
        Offset(size.width / 2 - scaleLineWidth, 0),
        scalePainter,
      );
      canvas.rotate(pi / 180 * 2); //转化成弧度,pi有180度,2pi分成180份
    }
    canvas.drawLine(
      Offset(0, -size.width / 2 + indicatorRadius / 2 + scaleLineWidth),
      Offset(0, -size.width / 2),
      Paint()
        ..color = Colors.green
        ..strokeWidth = 2,
    );
    //绘制文字
    TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    drawText(canvas, textPainter);
    canvas.save();
    canvas.rotate(radians);
    //绘制指示器
    canvas.drawCircle(
      //原点位置在圆盘中心点
      Offset(0, -size.width / 2 + scaleLineWidth + indicatorRadius),
      indicatorRadius / 2,
      indicatorPainter,
    );
    canvas.restore();
    //
  }

  @override
  bool shouldRepaint(covariant StopwatchPainter oldDelegate) {
    return oldDelegate.duration != duration || oldDelegate.textStyle != textStyle || oldDelegate.themeColor != themeColor || oldDelegate.scaleColor != scaleColor;
  }

  //绘制文本
  void drawText(Canvas canvas, TextPainter textPainter) {
    int minute = duration.inMinutes % 60;
    int second = duration.inSeconds % 60;
    int millisecond = duration.inMilliseconds % 1000;
    String commonStr = '${minute.toString().padLeft(2, "0")}:${second.toString().padLeft(2, "0")}';
    String highlightStr = '.${(millisecond ~/ 10).toString().padLeft(2, "0")}';
    textPainter.text = TextSpan(
      text: commonStr,
      // style: const TextStyle(color: Colors.redAccent ),
      // style: GoogleFonts.monoton(color: Colors.red),
      children: [TextSpan(text: highlightStr, style: const TextStyle(color: Colors.blue))],
    );
    textPainter.layout();
    final double width = textPainter.size.width;
    final double height = textPainter.size.height;
    textPainter.paint(canvas, Offset(-width / 2, -height / 2));
  }
}
