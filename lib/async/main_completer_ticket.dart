import 'dart:async';
import 'dart:math';

void main() {
  _incrementCounter();
}

void _incrementCounter() {
  completerDemo()
      .then((value) => print('返回数据:$value'))
      .catchError(
        (err) => print('请求失败:$err'),
      )
      .whenComplete(
        () => print('请求完成'),
      );
}

Future<int> completerDemo() {
  final Completer<int> completer = Completer();
  Future.delayed(const Duration(seconds: 5), () {
    final int value = Random().nextInt(10);
    if (value < 500) {
      completer.complete(value);
    } else {
      completer.completeError('失败');
    }
  });
  return completer.future;
}
