///String
extension StringExttension on String? {
  String? formatPhone({String pattern = ' '}) {
    if (this == null) return null;
    if ((this?.length ?? 0) < 7) return this;
    return '${this!.substring(0, 3)}$pattern${this!.substring(3, 7)}$pattern${this!.substring(7)}';
  }
}
