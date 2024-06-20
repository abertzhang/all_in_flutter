import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: SystemLifecyclePage()));
}

class SystemLifecyclePage extends StatefulWidget {
  const SystemLifecyclePage({super.key});

  @override
  State<SystemLifecyclePage> createState() => _SystemLifecyclePageState();
}

class _SystemLifecyclePageState extends State<SystemLifecyclePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("单次Frame绘制回调"); //只回调一次
    });
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      print("实时Frame绘制回调"); //每帧都回调
    });

    super.initState();
    SystemChannels.lifecycle.setMessageHandler((msg) async {
      switch (msg) {
        case "AppLifecycleState.paused":
          print(msg);
          break;
        case "AppLifecycleState.inactive":
          print(msg);
          break;
        case "AppLifecycleState.resumed":
          print(msg);
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('生命周期')),
      body: Column(
        children: [
          TextButton(onPressed: () {}, child: const Text('按钮')),
        ],
      ),
    );
  }
}
