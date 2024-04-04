import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isLock = true;
  @override
  Widget build(BuildContext context) {
    //使用时会影响ios的侧拉
    return WillPopScope(
      onWillPop: isLock ? () async => false : null,
      child: Scaffold(
        appBar: AppBar(title: Text('FirstPage')),
        body: Center(
          child: GestureDetector(
            onTap: () {
              isLock = !isLock;
              setState(() {});
            },
            child: Icon(isLock ? Icons.lock : Icons.lock_open, size: 50),
          ),
        ),
      ),
    );
  }
}
