import 'package:flutter/cupertino.dart';

main() {
  fetchEmojiList(10).listen(debugPrint);
}

Stream<String> fetchEmojiList(int count) async* {
  for (int i = 0; i < count; i++) {
    yield await fetchEmoji(i);
  }
}

Future<String> fetchEmoji(int count) async {
  Runes first = Runes('\u{1f37f}');
  debugPrint('加载开始--${DateTime.now().toIso8601String()}');
  await Future.delayed(Duration(seconds: 2));
  debugPrint('加载结束--${DateTime.now().toIso8601String()}');
  return String.fromCharCodes(first.map((e) => e + count));
}
