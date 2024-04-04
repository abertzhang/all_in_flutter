import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('继承RenderBox')),
        body: const Demo(),
      ),
    ),
  );
}

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.greenAccent,
      child: MyProxyRenderBoxWidget(
        child: FlutterLogo(size: 200),
      ),
    );
  }
}

class MyProxyRenderBoxWidget extends SingleChildRenderObjectWidget {
  const MyProxyRenderBoxWidget({
    super.key,
    required Widget child,
  }) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderMyRenderBox();
  }
}

class RenderMyRenderBox extends RenderProxyBox {
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
