/*
 * create by abert.zhang
 */

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('手势检测')),
          body: const DemoTaps(),
        ),
      ),
    );

class DemoTaps extends StatelessWidget {
  const DemoTaps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class RawGestureDetectorDemo extends StatefulWidget {
  const RawGestureDetectorDemo({Key? key}) : super(key: key);

  @override
  State<RawGestureDetectorDemo> createState() => _RawGestureDetectorDemoState();
}

class _RawGestureDetectorDemoState extends State<RawGestureDetectorDemo> {
  var gestures = <Type, GestureRecognizerFactory>{};
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
