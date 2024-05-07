void main() {
  DateTime(2024, 5, 1).describe();
  DateTime(2024, 4, 26).describe();
  DateTime(2024, 10, 26).describe();
  DateTime(2024, 2, 30).describe();
}

extension DescribeDate on DateTime {
  void describe() {
    DateTime now = DateTime.now();
    Duration diff = difference(DateTime(now.year, now.month, now.day));
    String result = switch (diff) {
      Duration(inDays: -1) => '昨天',
      Duration(inDays: -0) => '今天',
      Duration(inDays: 1) => '明天',
      Duration(inDays: int d) => d < 0 ? '${d.abs()}是天前' : '$d天后',
    };
    print(result);
  }
}
