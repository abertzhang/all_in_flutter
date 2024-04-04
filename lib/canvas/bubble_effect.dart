import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('枚举新功能')),
        body: const BubbleEffect(),
      ),
    ),
  );
}

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
      // particle.color = ColorUtil.randomColor();
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

class BubbleBean {
  Offset? position; //位置
  Color? color; //颜色
  double? speed; //速度
  double? theta; //角度,angle
  double? radius; //半径

  BubbleBean({this.position, this.color, this.speed, this.theta, this.radius});
}

class BubbleCustomPainter extends CustomPainter {
  final Paint _paint = Paint();
  late List<BubbleBean>? list;

  BubbleCustomPainter(this.list);

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    //每次重新计算位置
    list?.forEach((bobble) {
      //计算偏移
      var velocity = calculateXY(bobble.speed ?? 0, bobble.theta ?? 0);
      var dx = (bobble.position?.dx ?? 0) + (velocity.dx);
      var dy = (bobble.position?.dy ?? 0) + (velocity.dy);
      //x轴边界计算
      if ((bobble.position?.dx ?? 0) < 0 || (bobble.position?.dx ?? 0) > size.width) {
        dx = Random.secure().nextDouble() * size.width;
      }
      //y轴边界计算
      if ((bobble.position?.dy ?? 0) < 0 || (bobble.position?.dy ?? 0) > size.height) {
        dy = Random.secure().nextDouble() * size.height;
      }
      bobble.position = Offset(dx, dy);
    });
    //循环绘制气泡
    list?.forEach((bobble) {
      _paint.color = bobble.color ?? Colors.lightBlueAccent;
      canvas.drawCircle(bobble.position!, bobble.radius!, _paint);
    });
  }

  Offset calculateXY(double speed, double angle) {
    return Offset(speed * cos(angle), speed * sin(angle));
  }
}
