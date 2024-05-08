import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CoordinateCanvas extends StatelessWidget {
  const CoordinateCanvas({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CoordinatePainter(),
      size: Size(width, height),
    );
  }
}

class CoordinatePainter extends CustomPainter {
  double step = 30;
  Paint paintGrid = Paint()
    ..style = PaintingStyle.stroke
    ..color = Colors.blue;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    drawGrid(canvas, size, step, paintGrid);
    canvas.drawCircle(Offset.zero, 3, paintGrid);
    drawAxis(canvas, size);
    drawAxisText(canvas: canvas, size: size, step: step);
    //
    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//绘制坐标和箭头
void drawAxis(Canvas canvas, Size size) {
  Paint paint = Paint()
    ..color = Colors.blue
    ..strokeWidth = 1.5;
  canvas.drawLine(Offset(-size.width / 2, 0), Offset(size.width / 2, 0), paint);
  canvas.drawLine(Offset(0, -size.height / 2), Offset(0, size.height / 2), paint);
  canvas.drawLine(
    Offset(size.width / 2, 0),
    Offset(size.width / 2 - 10, -5),
    paint..strokeWidth = 2,
  );
  canvas.drawLine(
    Offset(size.width / 2, 0),
    Offset(size.width / 2 - 10, 5),
    paint..strokeWidth = 2,
  );
  canvas.drawLine(
    Offset(0, size.height / 2),
    Offset(5, size.height / 2 - 10),
    paint..strokeWidth = 2,
  );
  canvas.drawLine(
    Offset(0, size.height / 2),
    Offset(-5, size.height / 2 - 10),
    paint..strokeWidth = 2,
  );
}

//绘制网格
void drawGrid(Canvas canvas, Size size, double step, Paint paint) {
  drawBottomRight(canvas, size, step, paint);
  canvas.save();
  canvas.scale(1, -1); //沿x轴镜像
  drawBottomRight(canvas, size, step, paint);
  canvas.restore();
  canvas.save();
  canvas.scale(-1, 1); //沿y轴镜像
  drawBottomRight(canvas, size, step, paint);
  canvas.restore();
  canvas.save();
  canvas.scale(-1, -1); //沿原点镜像
  drawBottomRight(canvas, size, step, paint);
  canvas.restore();
}

//绘制底部右下的网格1/4
void drawBottomRight(Canvas canvas, Size size, double step, Paint paint) {
  canvas.save();
  //绘制X轴
  for (int i = 0; i < size.height / 2 / step; i++) {
    canvas.drawLine(Offset.zero, Offset(size.width / 2, 0), paint);
    canvas.translate(0, step);
  }
  canvas.restore();
  canvas.save();
  //绘制Y轴
  for (int i = 0; i < size.width / 2 / step; i++) {
    canvas.drawLine(Offset.zero, Offset(0, size.height / 2), paint);
    canvas.translate(step, 0);
  }
  canvas.restore();
}

//绘制文字Paragraph方式
void drawTextByParagraph(Canvas canvas, TextAlign textAlign) {
  Paint paint = Paint()..color = Colors.blue.withAlpha(33);
  var builder = ui.ParagraphBuilder(ui.ParagraphStyle(
    textAlign: textAlign,
    fontSize: 20,
    maxLines: 1,
  ));
  builder.pushStyle(ui.TextStyle(
    color: Colors.black87,
    textBaseline: ui.TextBaseline.alphabetic,
  ));

  builder.addText('多端Flutter');
  ui.Paragraph paragraph = builder.build();
  paragraph.layout(const ui.ParagraphConstraints(width: 200));
  canvas.drawParagraph(paragraph, Offset.zero);
  canvas.drawRect(const Rect.fromLTRB(0, 0, 100, 40), paint);
}

//绘制文字TextPainter方式
void drawTextPainter({
  required Canvas canvas,
  required String text,
  Offset position = Offset.zero,
  TextStyle textStyle = const TextStyle(fontSize: 15, color: Color(0xff666666)),
}) {
  var textPainter = TextPainter(
    text: TextSpan(text: text, style: textStyle),
    textAlign: TextAlign.center,
    textDirection: TextDirection.ltr,
  );
  textPainter.layout(maxWidth: 200);
  Size textSize = textPainter.size;
  textPainter.paint(
    canvas,
    Offset(-textSize.width / 2, -textSize.height / 2) + position,
  );
}

void drawHollowTextPainter(Canvas canvas) {
  Paint textPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1
    ..color = Colors.black54;
  var textPainter = TextPainter(
      text: TextSpan(
        text: '快速Flutter',
        style: TextStyle(fontSize: 40, foreground: textPaint),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr);
  textPainter.layout(maxWidth: 200);
  Size textSize = textPainter.size;
  textPainter.paint(
    canvas,
    Offset(-textSize.width / 2, -textSize.height / 2),
  );
  canvas.drawRect(
    Rect.fromLTRB(0, 0, textSize.width, textSize.height).translate(
      -textSize.width / 2,
      -textSize.height / 2,
    ),
    Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1
      ..color = Colors.blue.withAlpha(40),
  );
}

//绘制坐标刻度
void drawAxisText({
  required Canvas canvas,
  required Size size,
  required double step,
  TextStyle textStyle = const TextStyle(fontSize: 12, color: Color(0xff999999)),
}) {
  //y正轴刻度
  canvas.save();
  for (int i = 0; i < size.height / 2 / step; i++) {
    if (step < 30 && i.isOdd || i == 0) {
      canvas.translate(0, step);
      continue;
    } else {
      var str = (i * step).toInt().toString();
      drawTextPainter(canvas: canvas, text: str, position: const Offset(-10, 0), textStyle: textStyle);
    }
    canvas.translate(0, step);
  }
  canvas.restore();
  //y负轴刻度
  canvas.save();
  for (int i = 0; i < size.height / 2 / step; i++) {
    if (step < 30 && i.isOdd || i == 0) {
      canvas.translate(0, -step);
      continue;
    } else {
      var str = (-i * step).toInt().toString();
      drawTextPainter(canvas: canvas, text: str, position: const Offset(10, 0), textStyle: textStyle);
    }
    canvas.translate(0, -step);
  }
  canvas.restore();

  //x正轴刻度
  canvas.save();
  for (int i = 0; i < size.width / 2 / step; i++) {
    if (step < 30 && i.isOdd || i == 0) {
      canvas.translate(step, 0);
      continue;
    } else {
      var str = (i * step).toInt().toString();
      drawTextPainter(canvas: canvas, text: str, position: const Offset(0, 10), textStyle: textStyle);
    }
    canvas.translate(step, 0);
  }
  canvas.restore();

  //x负轴刻度
  canvas.save();
  for (int i = 0; i < size.width / 2 / step; i++) {
    if (step < 30 && i.isOdd || i == 0) {
      canvas.translate(-step, 0);
      continue;
    } else {
      var str = (-i * step).toInt().toString();
      drawTextPainter(canvas: canvas, text: str, position: const Offset(0, -10), textStyle: textStyle);
    }
    canvas.translate(-step, 0);
  }
  canvas.restore();
}
