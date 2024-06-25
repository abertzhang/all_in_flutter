import 'dart:isolate';

import 'package:all_in_flutter/async/main_isolate_run.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Isolate spawn'),
      ),
      body: Column(
        children: [
          Center(
              child: TextButton(
            onPressed: () async {
              final p = ReceivePort();
              await Isolate.spawn(spawnFib, p.sendPort);
              SendPort? sendPort;
              await for (var response in p) {
                if (response is SendPort) {
                  sendPort = response;
                  sendPort.send(40);
                }
                if (response is int) {
                  print('received message $response');
                  break;
                }
              }
              if (sendPort != null) sendPort.send(null);
            },
            child: Text('计算'),
          ))
        ],
      ),
    );
  }

  Future<void> spawnFib(SendPort sendPort) async {
    final commandPort = ReceivePort();
    sendPort.send(commandPort.sendPort);
    await for (final message in commandPort) {
      if (message is int) {
        final target = message;
        print('received message $target');
        final result = slowFib(target);
        print('received message $result');
        sendPort.send(result);
      } else if (message == null) {
        break;
      }
    }
    print('Spawn isolate exiting...');
    Isolate.exit();
  }
}
