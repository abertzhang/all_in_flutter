import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ClockStyleOne extends StatefulWidget {
  const ClockStyleOne({Key? key, required this.radius}) : super(key: key);
  final double radius;

  @override
  State<ClockStyleOne> createState() => _ClockStyleOneState();
}

class _ClockStyleOneState extends State<ClockStyleOne> with SingleTickerProviderStateMixin {
  ValueNotifier<DateTime> dateTime = ValueNotifier<DateTime>(DateTime.now());
  late Ticker ticker;

  @override
  void initState() {
    super.initState();
    ticker = createTicker(tick)..start();
  }

  void tick(Duration duration) {
    if (dateTime.value.second != DateTime.now().second) {
      dateTime.value = DateTime.now();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ClockPainter(radius: widget.radius, listenable: dateTime),
      size: Size(widget.radius * 2, widget.radius * 2),
    );
  }
}

//绘制钟盘
class ClockPainter extends CustomPainter {
  final ValueListenable<DateTime> listenable;
  final double radius;
  ClockPainter({required this.radius, required this.listenable}) : super(repaint: listenable);
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawOuterCircle(canvas, size);
    drawScale(canvas, size);
    drawClockText(canvas, size, position: Offset(0, -size.width / 2 + 30), text: 'foly');
    drawClockText(canvas, size, position: Offset(0, -size.width / 2 - 15), text: 'Ⅻ');
    drawClockText(canvas, size, position: Offset(size.width / 2 - 15, 0), text: 'Ⅲ');
    drawClockText(canvas, size, position: Offset(0, size.width / 2 - 15), text: 'Ⅵ');
    drawClockText(canvas, size, position: Offset(-size.width / 2 - 15, 0), text: 'Ⅸ');
    drawArrow(canvas, size, dateTime: listenable.value);
    canvas.drawCircle(Offset.zero, 6, Paint()..style = PaintingStyle.fill);
    // Rect rect = Rect.fromCenter(center: Offset.zero, width: 100, height: 100);
    // canvas.drawLine(Offset(0, 0), Offset(50, 50), Paint()..style = PaintingStyle.fill);
    // canvas.drawArc(rect, 0, pi / 180 * 45, true, Paint());
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

void drawArrow(Canvas canvas, Size size, {required DateTime dateTime}) {
  int second = dateTime.second;
  int minute = dateTime.minute;
  int hour = dateTime.hour;
  double secondRadian = 2 * pi / 60 * second;
  double minuteRadian = 2 * pi / 60 * minute;
  double hourRadian = 2 * pi / 12 * hour;
  canvas.save();
  canvas.rotate(-pi / 2);
  canvas.rotate(secondRadian);
  canvas.drawLine(
      const Offset(-30, 0),
      const Offset(115, -0),
      Paint()
        ..color = Colors.black45
        ..strokeWidth = 2
        ..style = PaintingStyle.fill);
  canvas.restore();
  canvas.save();
  canvas.rotate(-pi / 2);
  canvas.rotate(minuteRadian);
  canvas.drawLine(
      const Offset(-20, 0),
      const Offset(90, -0),
      Paint()
        ..color = Colors.black45
        ..strokeWidth = 3
        ..style = PaintingStyle.fill);
  canvas.restore();
  canvas.save();
  canvas.rotate(-pi / 2);
  canvas.rotate(hourRadian);
  canvas.drawLine(
      const Offset(-15, 0),
      const Offset(60, -0),
      Paint()
        ..color = Colors.black45
        ..strokeWidth = 5
        ..style = PaintingStyle.fill);
  canvas.restore();
}

//绘制文字
void drawClockText(
  Canvas canvas,
  Size size, {
  required Offset position,
  required String text,
}) {
  final TextPainter textPainter = TextPainter(
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  );
  textPainter.text = TextSpan(text: text, style: const TextStyle(fontSize: 15, color: Colors.blue));
  textPainter.layout();
  Offset textPosition = position;
  if (position.dx == 0) {
    if (position.dy < 0) {
      textPosition = position + Offset(-textPainter.width / 2, textPainter.width / 2);
    } else {
      textPosition = position + Offset(-textPainter.width / 2, textPainter.width / 2);
    }
  }
  if (position.dy == 0) {
    if (position.dx < 0) {
      textPosition = position + Offset(textPainter.height / 2, -textPainter.width / 2);
    } else {
      textPosition = position + Offset(textPainter.height / 2, -textPainter.width / 2);
    }
  }
  textPainter.paint(canvas, textPosition);
}

//绘制刻度
void drawScale(Canvas canvas, Size size) {
  Paint paint = Paint()
    ..color = const Color(0xff333333)
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 1
    ..style = PaintingStyle.fill;
  double count = 60;
  double perAngle = 2 * pi / 60; //每秒弧度,360/60为6度
  canvas.save();
  // canvas.rotate(pi / 2);
  for (int i = 0; i < count; i++) {
    if (i % 5 == 0) {
      canvas.drawLine(Offset(0, size.width / 2 - 20), Offset(0, size.width / 2 - 10), paint);
      canvas.drawCircle(Offset(0, size.width / 2 - 30), 3, paint);
    } else {
      canvas.drawLine(Offset(0, size.width / 2 - 15), Offset(0, size.width / 2 - 10), paint);
    }
    canvas.rotate(perAngle);
  }
  canvas.restore();
}

//绘制外框
void drawOuterCircle(Canvas canvas, Size size, {Paint? paint}) {
  paint ??= Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2
    ..color = Colors.blue;

  paint.maskFilter = const MaskFilter.blur(BlurStyle.outer, 5);
  final Path pathOne = Path();
  final Path pathTwo = Path();
  Rect rect = Rect.fromCenter(center: Offset.zero, width: size.width, height: size.height);
  pathOne.addArc(rect, pi / 180 * 10, pi / 180 * 70);
  Rect rectTwo = Rect.fromCenter(center: const Offset(-3, 0), width: size.width, height: size.height);

  pathTwo.addArc(rectTwo, pi / 180 * 10, pi / 180 * 70);
  Path path = Path.combine(PathOperation.difference, pathOne, pathTwo);
  for (int i = 0; i < 4; i++) {
    canvas.rotate(pi / 2); //选择90度
    canvas.drawPath(path, paint..style = PaintingStyle.fill);
  }
}
