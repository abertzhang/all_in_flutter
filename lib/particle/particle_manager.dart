/*
 * create by abert.zhang
 */
import 'package:flutter/cupertino.dart';

import 'particle_bean.dart';

class ParticleManager with ChangeNotifier {
  List<ParticleBean> particles = [];
  Size boxSize = Size.zero;

  ParticleManager({required this.boxSize});
  void addParticle(ParticleBean particle) {
    particles.add(particle);
    notifyListeners();
  }

  void tick() {
    particles.forEach(updateByGravity);
    notifyListeners();
  }

  //粒子的运动方式--垂直下落
  void updateByGravity(ParticleBean particle) {
    //距离=时间X速度
    particle.dy = particle.dy + particle.velocityY;
    particle.velocityY += particle.accelerateY;
    //超出底部线
    if (particle.dy > (boxSize.height - particle.size.height / 2)) {
      //反弹的高度为之前4/5
      particle.maxY = particle.maxY * 0.8;
      particle.dy = boxSize.height - particle.size.height / 2;
      //能量损失,反弹为下落最大速度的4/5
      particle.velocityY = -particle.velocityY * 0.8;
    }
    if (particle.dy < boxSize.height - particle.maxY) {
      particle.dy = boxSize.height - particle.maxY;
      particle.velocityY = 0;
    }
    if (particle.maxY < 0.01) {
      particle.dy = particle.size.height / 2;
      particle.maxY = boxSize.height - particle.size.height;
    }
  }
}
