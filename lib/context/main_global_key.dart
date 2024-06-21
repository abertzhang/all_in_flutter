import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: GlobalKeyPage()));
}

class GlobalKeyPage extends StatefulWidget {
  const GlobalKeyPage({super.key});

  @override
  State<GlobalKeyPage> createState() => _GlobalKeyPageState();
}

class _GlobalKeyPageState extends State<GlobalKeyPage> {
  final GlobalKey _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('定位widget'),
      ),
      body: Column(
        children: [
          SizedBox(height: 200),
          TextButton(
            key: _globalKey,
            onPressed: () {
              RenderObject? obj = _globalKey.currentContext?.findRenderObject();
              print(obj?.sizedByParent.toString());
              print(obj?.semanticBounds.size);
              print(obj?.paintBounds.size.toString());
              print(_globalKey.currentContext?.size);
            },
            child: Text('按钮'),
          ),
          SizedBox(height: 200),
        ],
      ),
    );
  }
}
