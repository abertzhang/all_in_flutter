import 'package:flutter/material.dart';

void main() {
  final countdown = countDown(5);
  for (final i in countdown) {
    debugPrint(i.toString());
  }
}

Iterable<int> countDown(int from) sync* {
  while (from > 0) {
    yield from;
    from--;
  }
}
