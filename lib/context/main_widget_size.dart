import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(title: 'SizeDemo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final GlobalKey? boxKey;
  late final GlobalKey? sliverKey;

  @override
  void initState() {
    boxKey = GlobalKey();
    sliverKey = GlobalKey();
    WidgetsBinding.instance.addPostFrameCallback(_getWidgetSize);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('获取尺寸'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 50, bottom: 10),
              child: const Text(
                "RenderBox",
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              key: boxKey,
              height: 60,
              width: 100,
              color: Colors.blue,
            ),
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 10),
              child: const Text(
                "RenderSliver",
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [SliverList(key: sliverKey, delegate: SliverChildBuilderDelegate((context, index) => _buildSliverItem(index), childCount: 18))],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _getWidgetSize(Duration timeStamp) {
    final RenderBox renderBox = boxKey?.currentContext?.findRenderObject() as RenderBox;
    final boxHeight = renderBox.size.height ?? 0.0;
    final boxWidth = renderBox.size.width ?? 0.0;
    log("boxHeight:$boxHeight boxWidth:$boxWidth");
    final RenderSliver renderSliver = sliverKey?.currentContext?.findRenderObject() as RenderSliver;
    final sliverListHeight = renderSliver.semanticBounds.height ?? 0.0;
    final sliverListWidth = renderSliver.semanticBounds.width ?? 0.0;
    log("sliverListHeight:$sliverListHeight sliverListWidth:$sliverListWidth");
  }

  Widget _buildSliverItem(int index) {
    return Container(
      height: 30,
      child: Text(
        "${index + 1}",
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
