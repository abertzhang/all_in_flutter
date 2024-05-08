/*
 * create by abert.zhang
 */
import 'package:flutter/material.dart';

class CircleTweenAnimation extends StatefulWidget {
  const CircleTweenAnimation({Key? key}) : super(key: key);

  @override
  State<CircleTweenAnimation> createState() => _CircleTweenAnimationState();
}

class _CircleTweenAnimationState extends State<CircleTweenAnimation> with SingleTickerProviderStateMixin {
  late AnimationController ctrlAnimation;
  late CurvedAnimation curvedAnimation;
  late Animation<double> tweenAnimation;
  @override
  void initState() {
    super.initState();
    ctrlAnimation = AnimationController(duration: const Duration(seconds: 3), vsync: this);
    curvedAnimation = CurvedAnimation(parent: ctrlAnimation, curve: Curves.easeInCubic);
    // tweenAnimation = ctrlAnimation.drive(Tween<double>(begin: 30, end: 80));
    tweenAnimation = curvedAnimation.drive(Tween<double>(begin: 30, end: 80));
    // tweenAnimation = Tween<double>(begin: 30, end: 80).animate(curvedAnimation);
    ctrlAnimation.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: tweenAnimation,
      builder: (ctx, child) {
        return Center(
          child: Container(
            color: Colors.yellow,
            width: tweenAnimation.value,
            height: 20 + tweenAnimation.value,
          ),
        );
      },
    );
  }
}
