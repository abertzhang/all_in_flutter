import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: LifecycleHomePage()));
}

class LifecycleHomePage extends StatefulWidget {
  const LifecycleHomePage({super.key});

  @override
  State<LifecycleHomePage> createState() => _LifecycleHomePageState();
}

class _LifecycleHomePageState extends State<LifecycleHomePage> {
  late final AppLifecycleListener _listener;
  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onDetach: () {},
      onHide: () {},
      onInactive: () {},
      onPause: () {},
      onRestart: () {},
      onResume: () {},
      onShow: () {},
      onStateChange: (AppLifecycleState state) {},
      onExitRequested: _onExitRequested,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant LifecycleHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('生命周期')),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                exit(0);
              },
              child: const Text('退出')),
        ],
      ),
    );
  }

  Future<AppExitResponse> _onExitRequested() async {
    final response = await showDialog<AppExitResponse>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog.adaptive(
        title: const Text('Are you sure you want to quit this app?'),
        content: const Text('All unsaved progress will be lost.'),
        actions: [
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(AppExitResponse.cancel);
            },
          ),
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(AppExitResponse.exit);
            },
          ),
        ],
      ),
    );
    return response ?? AppExitResponse.exit;
  }
}
