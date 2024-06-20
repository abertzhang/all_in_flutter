import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('继承RenderBox')),
        body: const DemoPage(),
      ),
    ),
  );
}

class DemoPage extends StatelessWidget {
  const DemoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.greenAccent,
      child: MyRenderBoxWidget(
        child: FlutterLogo(size: 200),
      ),
    );
  }
}

class MyRenderBoxWidget extends SingleChildRenderObjectWidget {
  const MyRenderBoxWidget({super.key, required Widget child}) : super(child: child);
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderMyRenderBox();
  }
}

class RenderMyRenderBox extends RenderBox with RenderObjectWithChildMixin {
  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    // child?.layout(BoxConstraints.tight(const Size(50, 50)));
    size = const Size(300, 600);
    // size = (child as RenderBox).size;
    // super.layout(constraints);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child!, offset);
    context.canvas.drawCircle(offset, 2, Paint());
    context.pushOpacity(offset, 127, (context, offset) {
      context.paintChild(child!, offset + Offset(130, 130));
    });
    // super.paint(context, offset);
  }
}
