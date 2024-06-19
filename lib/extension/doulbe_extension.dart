///double
extension DoubleExtension on double? {
  //简化去除最后一位零
  String? toSimplify(int fractionDigits) {
    if (this == null) return null;
    if (this == 0) return '0';
    //最后一位清零
    String clearLastZero(double original, int fractionDigits) {
      if (original == 0) return '0';
      if (fractionDigits < 1) return original.toStringAsFixed(0);
      String targetStr = original.toStringAsFixed(fractionDigits);
      bool flag = (targetStr.contains('0', targetStr.length - 1));
      if (!flag) return targetStr;
      return clearLastZero(double.tryParse(targetStr) ?? 0, fractionDigits - 1);
    }

    return clearLastZero(this ?? 0, fractionDigits);
  }
}
