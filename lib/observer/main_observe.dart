import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_util/app_start/app_catch.dart';

void main() {
  AppCatch.start(() async {
    WidgetsFlutterBinding.ensureInitialized();
    GestureBinding.instance.resamplingEnabled = true;
    //日志
    LogUtil.init(tag: 'Logger', isDebug: !const bool.fromEnvironment("dart.vm.product"));
    runApp(const MyApp()); //DemoApp类含MaterialApp
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeMetrics() {
    if (MediaQuery.of(context).viewInsets.bottom == 0) {
      debugPrint('关闭键盘');
    } else {
      debugPrint('打开键盘');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('观察者')),
      body: Column(
        children: [TextField()],
      ),
    );
  }
}
