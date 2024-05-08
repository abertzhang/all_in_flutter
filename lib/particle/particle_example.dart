/*
 * create by abert.zhang
 */

import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';

import 'particle_bean.dart';
import 'particle_manager.dart';

class ParticleExample extends StatefulWidget {
  const ParticleExample({Key? key}) : super(key: key);

  @override
  State<ParticleExample> createState() => _ParticleExampleState();
}

class _ParticleExampleState extends State<ParticleExample> with SingleTickerProviderStateMixin {
  late AnimationController ctrlAnimation;
  late ParticleManager particleManager = ParticleManager(boxSize: const Size(200, 300));
  @override
  void initState() {
    super.initState();
    initParticleManager();
    ctrlAnimation = AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..addListener(() {
        particleManager.tick();
      })
      ..repeat();
  }

  void initParticleManager() {
    var bean = ParticleBean(accelerateY: 9.8 / 60, maxY: particleManager.boxSize.height, size: const Size(20, 20));
    var bean2 = ParticleBean(accelerateY: 1, maxY: particleManager.boxSize.height, size: const Size(10, 10), color: Colors.redAccent);
    particleManager.addParticle(bean);
    particleManager.addParticle(bean2);
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: CustomPaint(
        size: Size.infinite,
        painter: ParticlePainter(particleManager),
      ),
    );
  }
}

class ParticlePainter extends CustomPainter {
  ParticlePainter(this.particleManager) : super(repaint: particleManager);
  final ParticleManager particleManager;
  Paint ballPaint = Paint();
  Paint stokePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 0.5;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.translate(size.width / 2, size.height / 2);
    canvas.drawCircle(Offset.zero, 2, stokePaint);
    canvas.save();
    canvas.translate(0, particleManager.boxSize.height / 2);
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset.zero,
        width: particleManager.boxSize.width,
        height: particleManager.boxSize.height,
      ),
      stokePaint,
    );
    canvas.restore();
    for (var particle in particleManager.particles) {
      drawParticle(canvas, size, particle: particle);
    }
  }

  void drawParticle(Canvas canvas, Size size, {required ParticleBean particle}) {
    ballPaint.color = particle.color;
    LogUtil.v(particle.dy);
    canvas.drawCircle(Offset(particle.dx, particle.dy), particle.size.width / 2, ballPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
