import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '/utils/utils.dart';

/// create by tjie
/// 渐变进度条

class LineGradientProgress extends StatefulWidget {
  final double width; // 宽度
  final double height; // 高度
  final Color bgColor;
  final List<Color> colors;
  final double progress;
  final String content; // 在进度条后显示的文字
  final double fontSize; // 文字尺寸
  final Color fontColor; // 文字颜色
  final bool inside; // 内容文字
  final bool animation; // 是否有动画

  const LineGradientProgress({
    Key? key,
    required this.width,
    required this.height,
    this.bgColor = Colors.transparent,
    required this.colors,
    required this.progress,
    this.content = "",
    this.fontSize = 12,
    this.fontColor = const Color(0xFF333333),
    this.inside = false,
    this.animation = true,
  }) : super(key: key);

  @override
  LineGradientProgressState createState() => LineGradientProgressState();
}

class LineGradientProgressState extends State<LineGradientProgress> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: CustomPaint(
        size: Size(widget.width, widget.height),
        painter: LineProgressPainter(
          context,
          widget.colors,
          bgColor: widget.bgColor,
          progress: _animation.value,
          content: widget.content,
          fontSize: widget.fontSize,
          fontColor: widget.fontColor,
          inside: widget.inside,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: const Duration(milliseconds: 300), vsync: this);

    _animation = Tween(begin: 0.0, end: widget.progress).animate(_controller)
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });

    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(LineGradientProgress oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.progress != widget.progress) {
      if (widget.animation) {
        startAnimation();
      } else {
        startAnimation(begin: oldWidget.progress);
      }
    }
  }

  // 外部执行动画
  void startAnimation({double begin = 0.0}) {
    _animation = Tween(begin: begin, end: widget.progress).animate(_controller)
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });

    _controller.reset();
    _controller.forward();
  }
}

// 自定义绘制渐变进度条
class LineProgressPainter extends CustomPainter {
  final double progress; // 进度值
  final Color bgColor; // 背景色
  final List<Color> frontColors; //前置色 渐变色
  final String content;
  final double fontSize;
  final Color fontColor;
  final BuildContext context;
  final bool inside;

  LineProgressPainter(
    this.context,
    this.frontColors, {
    this.progress = 0,
    this.bgColor = Colors.transparent,
    this.content = "",
    required this.fontSize,
    required this.fontColor,
    this.inside = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var _painter = Paint()
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..strokeWidth = size.height / 2;

    // 先画背景色
    if (bgColor != Colors.transparent) {
      _painter.color = bgColor;
      canvas.drawLine(Offset(0, size.height / 2), Offset(size.width, size.height / 2), _painter);
    }

    if (progress > 0 && progress <= 1) {
      // 绘制进度条
      var rect = Rect.fromLTRB(0, 0, size.width * progress, size.height);
      _painter.shader = LinearGradient(colors: frontColors).createShader(rect);
      canvas.drawLine(Offset(0, size.height / 2), Offset(progress * size.width, size.height / 2), _painter);
    }

    // 绘制文字
    if (ObjectUtil.isNotEmpty(content)) {
      FontWeight fontWeight = FontWeight.w500;
      String showText = (progress * 100).toStringAsFixed(0) + content;
      // 文字宽度
      double valueWidth = _calculateTextWidget(context, showText, fontSize, fontWeight, size.width, 1);
      double paintX = progress * size.width + 12;
      double paintY = -2;
      TextAlign align = TextAlign.start;

      if (paintX >= size.width - valueWidth) {
        paintX = 0;
        align = TextAlign.end;
      }

      if (inside) {
        double temp = size.width * progress - valueWidth;

        if (temp < 0) {
          temp = 0;
        }

        paintX = temp;

        paintY = size.height / 2 - fontSize / 2;
        align = TextAlign.start;
      }

      ui.ParagraphBuilder pb = ui.ParagraphBuilder(ui.ParagraphStyle(
        textAlign: align,
        maxLines: 1,
      ))
        ..pushStyle(ui.TextStyle(color: fontColor, fontSize: fontSize))
        ..addText(showText);

      ui.ParagraphConstraints pc = ui.ParagraphConstraints(width: size.width);
      ui.Paragraph paragraph = pb.build()..layout(pc);

      canvas.drawParagraph(paragraph, Offset(paintX, paintY));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }

  // 获取文字宽度
  double _calculateTextWidget(BuildContext context, String value, fontSize, FontWeight fontWeight, double maxWidth, int maxLines) {
    value = _filterText(value);
    TextPainter painter = TextPainter(

        ///AUTO：华为手机如果不指定locale的时候，该方法算出来的文字高度是比系统计算偏小的。
        locale: Localizations.localeOf(context),
        maxLines: maxLines,
        textDirection: TextDirection.ltr,
        text: TextSpan(
            text: value,
            style: TextStyle(
              fontWeight: fontWeight,
              fontSize: fontSize,
            )));
    painter.layout(maxWidth: maxWidth);

    return painter.width;
    // return painter.height;
  }

  String _filterText(String text) {
    String tag = '<br>';
    while (text.contains('<br>')) {
// flutter 算高度,单个\n算不准,必须加两个
      text = text.replaceAll(tag, '\n\n');
    }
    return text;
  }
}
