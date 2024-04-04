import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool isLock = true;
  @override
  Widget build(BuildContext context) {
    //使用时会影响ios的侧拉
    return Scaffold(
      appBar: AppBar(title: Text('SecondPage')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            isLock = !isLock;
            if (isLock) {
              ModalRoute.of(context)?.addScopedWillPopCallback((preventExit));
            } else {
              ModalRoute.of(context)?.removeScopedWillPopCallback((preventExit));
            }
            setState(() {});
          },
          child: Icon(isLock ? Icons.lock : Icons.lock_open, size: 50),
        ),
      ),
    );
  }

  Future<bool> preventExit() async => false;
}
