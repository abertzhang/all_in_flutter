/*
sync 配合 yield
sync* 为多个Iterable
*/
import 'package:flutter/material.dart';

main() {
  getEmoji(10).forEach(debugPrint);
}

Iterable<String> getEmoji(int count) sync* {
  Runes first = Runes('\u{1f47f}');
  for (int i = 0; i < count; i++) {
    yield String.fromCharCodes(first.map((e) => e + i));
  }
}
