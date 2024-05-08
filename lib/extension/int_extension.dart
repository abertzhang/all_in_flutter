extension IntExtension on int {
  String simple() {
    int d = this;
    int s = (d / 10000).floor();
    if (s < 1) return '$d';
    if (s < 100) return '$s万';
    s ~/= 100;
    if (s < 10) return '$s百万';
    s ~/= 10;
    if (s < 10) return '$s千万';
    s ~/= 10;
    return '$s亿';
  }

  String simpleEn() {
    int d = this;
    if (d < 100000) return '$d';

    double s = (d / 10000);
    if (s < 1000) return '${s.toStringAsFixed(1)}w';
    return '${s.toStringAsFixed(0)}w';
  }
}
