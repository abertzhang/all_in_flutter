import 'dart:async';
import 'dart:isolate';

void fibonacci(SendPort sendPort) {
  final port = ReceivePort();
  sendPort.send(port.sendPort);

  // port.listen((message) {
  //   if (message is int) {
  //     final result = _fibonacci(message);
  //     sendPort.send(result);
  //     port.close();
  //   }
  // });
}

int _fibonacci(int n) {
  if (n == 0 || n == 1) {
    return n;
  }
  return _fibonacci(n - 1) + _fibonacci(n - 2);
}

void main() async {
  final receivePort = ReceivePort();
  final isolate = await Isolate.spawn(fibonacci, receivePort.sendPort);

  final sendPort = await receivePort.first as SendPort;
  final completer = Completer<int>();
  final message = 20;
  sendPort.send(message);
  // receivePort.listen((result) {
  //   completer.complete(result);
  //   receivePort.close();
  // });

  final result = await completer.future;
  print('Fibonacci: $result');

  isolate.kill();
}
