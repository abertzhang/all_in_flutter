import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const MaterialApp(home: HomePage()),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 300),
            AnimationButton(),
            SizedBox(height: 30),
            TextButton(onPressed: () {}, child: Text('倒计时按钮')),
          ],
        ),
      ),
    );
  }
}

class AnimationButton extends StatefulWidget {
  const AnimationButton({super.key});

  @override
  State<AnimationButton> createState() => _AnimationButtonState();
}

class _AnimationButtonState extends State<AnimationButton> with SingleTickerProviderStateMixin {
  late AnimationController ctrlAnimation = AnimationController(
    value: 0,
    duration: Duration(milliseconds: 3000),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    ctrlAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ButtonCustomPainter(animation: ctrlAnimation),
      size: Size(300, 90),
      child: Container(
        width: 300,
        height: 80,
        // color: Colors.red,
        child: TextButton(onPressed: () {}, child: Text('倒计时按钮')),
      ),
    );
  }
}

class ButtonCustomPainter extends CustomPainter {
  AnimationController animation;

  ButtonCustomPainter({required this.animation}) : super(repaint: animation) {
    Rect rect = Rect.fromLTWH(0, 0, 300, 90);
    rRect = RRect.fromRectAndRadius(rect, Radius.circular(18));
    path.addRRect(rRect);
    pathMetric = path.computeMetrics().single;
  }
  Path path = Path();

  late RRect rRect;
  late PathMetric pathMetric;
  Paint paintBorder = Paint()
    ..strokeWidth = 1
    ..style = PaintingStyle.stroke
    ..color = Colors.redAccent;
  @override
  void paint(Canvas canvas, Size size) {
    var current = pathMetric.length * animation.value;
    debugPrint(current.toString());
    Path newPath = Path()..addPath(pathMetric.extractPath(0, current), Offset.zero);
    // canvas.drawPath(path, paintBorder);
    canvas.drawPath(newPath, paintBorder);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
