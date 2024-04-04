import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '/effects/bubble/bubble_custom_painter.dart';
import 'bubble_bean.dart';

class BubbleEffect extends StatefulWidget {
  const BubbleEffect({Key? key}) : super(key: key);

  @override
  State<BubbleEffect> createState() => _BubbleEffectState();
}

class _BubbleEffectState extends State<BubbleEffect> with TickerProviderStateMixin {
  double canvasWidth = MediaQueryData.fromWindow(window).size.width;
  double canvasHeight = 500;
  //泡泡集合
  List<BubbleBean> bobbles = [];
  //最大半径
  double maxRadius = 100;
  //最大速度
  double maxSpeed = 0.7;
  //最大弧度360度
  double maxRadian = 2 * pi;
  //动画控制器
  late AnimationController ctrlAnimation;
  late AnimationController ctrlAnimationFade;
  //流控制器
  StreamController<double> ctrlStream = StreamController();
  @override
  void initState() {
    super.initState();
    randomBobbles();
    ctrlAnimation = AnimationController(vsync: this, duration: const Duration(milliseconds: 1000));
    ctrlAnimation.addListener(() {
      ctrlStream.add(0.0);
    });
    ctrlAnimationFade = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    ctrlAnimationFade.addStatusListener((status) {
      if (status == AnimationStatus.completed) ctrlAnimation.repeat();
    });
    ctrlAnimationFade.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackground(context),
        _buildBubble(),
        _buildBlur(),
      ],
    );
  }

  //生成随机气泡
  void randomBobbles() {
    for (int i = 0; i < 20; i++) {
      BubbleBean particle = BubbleBean(); //粒子
      // particle.color = ColorUtil.randomColor();
      particle.color = Colors.primaries[Random.secure().nextInt(Colors.primaries.length)];
      particle.position = const Offset(-1, -1);
      particle.speed = Random.secure().nextDouble() * maxSpeed;
      particle.theta = Random.secure().nextDouble() * maxRadian;
      particle.theta = Random.secure().nextDouble() * maxRadius;
      bobbles.add(particle);
    }
  }

  //第一层--背景
  Widget _buildBackground(BuildContext context) {
    return Container(
      height: canvasHeight,
      width: canvasWidth,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.lightBlue.withOpacity(0.3), Colors.lightBlueAccent.withOpacity(0.3), Colors.blue.withOpacity(0.3)],
      )),
    );
  }

  //第二层--气泡
  Widget _buildBubble() {
    //使用Stream流实现局部更新
    return StreamBuilder<double>(
      builder: (context, snapshot) {
        return CustomPaint(
          painter: BubbleCustomPainter(bobbles),
          // child: Container(),
        );
      },
      stream: null,
    );
  }

  //第三层--高斯模糊
  Widget _buildBlur() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 0.3, sigmaY: 0.3),
      child: Container(
        color: Colors.white.withOpacity(0.1),
      ),
    );
  }

  @override
  void dispose() {
    ctrlAnimation.dispose();
    ctrlAnimationFade.dispose();
    ctrlStream.close();
    super.dispose();
  }
}
