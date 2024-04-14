import 'package:demo_plugin/demo_plugin.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final plugin = DemoPlugin();
  int? sum = 0;
  String? version;
  @override
  void initState() {
    super.initState();
    initData();
  }

  Future initData() async {
    version = await plugin.getPlatformVersion() ?? 'nothing';
    sum = await plugin.add();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('$version ,$sum'),
        ],
      ),
    );
  }
}
