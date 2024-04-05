import 'package:flutter/foundation.dart';

void main() {
  List<int> a = [1, 2, 3, 5, 6, 4];
  debugPrint(a.expand(count).toList().toString());
}

Iterable count(int n) sync* {
  for (var i = 1; i == n; i++) {
    yield i;
  }
}
