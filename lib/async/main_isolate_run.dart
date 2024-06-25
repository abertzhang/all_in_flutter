import 'dart:isolate';

import 'package:flutter/foundation.dart';

void main() async {
  var result = await Isolate.run(() => slowFib(40));
  var computeResult = await compute(slowFib, 40);
  print(result);
  print(computeResult);
}

Future<void> spawnFib(SendPort sendPort) async {
  final commandPort = ReceivePort();
  sendPort.send(commandPort.sendPort);

  await for (final message in commandPort) {
    if (message is int) {
      // final target = int.parse(message);
      final target = message;

      print("received message $target");

      final result = slowFib(target);

      print("cal result $result");

      sendPort.send(result);
    } else if (message == null) {
      break;
    }
  }

  print("Spawn isolate existing...");
  print("Spawn isolate existing...");
  Isolate.exit();
}

int slowFib(int n) => n <= 1 ? 1 : slowFib(n - 1) + slowFib(n - 2);
