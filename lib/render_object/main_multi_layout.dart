import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('继承RenderBox'), centerTitle: true),
        body: const Demo(),
      ),
    ),
  );
}

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.greenAccent,
      child: CustomMultiChildLayout(
        delegate: MyDelegate(),
        children: [
          LayoutId(id: 1, child: const FlutterLogo(size: 30)),
          LayoutId(id: 2, child: const FlutterLogo(size: 60)),
        ],
      ),
    );
  }
}

class MyDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    // late Size size_1, size_2;
    if (hasChild(1)) {
      // size_1 = layoutChild(1, BoxConstraints.tight(Size(50, 50)));
      layoutChild(1, BoxConstraints.tight(const Size(30, 30)));
    }
    if (hasChild(2)) {
      // size_2 = layoutChild(1, BoxConstraints.tight(Size(100, 100)));
      layoutChild(2, BoxConstraints.tight(const Size(60, 60)));
    }
    positionChild(1, const Offset(60, 90));
    positionChild(2, const Offset(160, 90));
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }
}
