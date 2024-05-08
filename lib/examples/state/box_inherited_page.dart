import 'package:flutter/material.dart';

class BoxInheritedPage extends StatelessWidget {
  const BoxInheritedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InheritedWidget演示')),
      body: BoxInherited(
        size: const Size(300, 100),
        color: Colors.brown,
        child: Builder(builder: (context) {
          var provider = BoxInherited.of(context);
          return Container(
            height: provider.size.height,
            width: provider.size.width,
            color: provider.color,
          );
        }),
      ),
    );
  }
}

class BoxInherited extends InheritedWidget {
  final Color color;
  final Size size;
  const BoxInherited({
    super.key,
    required super.child,
    required this.color,
    required this.size,
  });
  static BoxInherited of(BuildContext context) {
    var inherited = context.dependOnInheritedWidgetOfExactType<BoxInherited>();
    assert(inherited != null, 'error:No ColorInherited ');
    return inherited!;
  }

  @override
  bool updateShouldNotify(covariant BoxInherited oldWidget) {
    return oldWidget.size != size || oldWidget.color != color;
  }
}
