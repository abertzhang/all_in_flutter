import 'package:flutter/material.dart';

class CounterInheritedPage extends StatelessWidget {
  const CounterInheritedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CounterInherited(
      counterNotify: CounterNotify(),
      child: Scaffold(
        appBar: AppBar(title: const Text('InheritedWidget计数器')),
        //需要Builder促使context实例,否则无context
        body: Builder(builder: (context) {
          var provider = CounterInherited.of(context).counterNotify;
          return Center(
            child: GestureDetector(
              onTap: provider.add,
              //局部刷新
              child: ValueListenableBuilder(
                valueListenable: provider.countState,
                builder: (context, value, child) {
                  return Text('${provider.countState.value}');
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}

//类似于Provider类
class CounterInherited extends InheritedWidget {
  const CounterInherited({
    super.key,
    required super.child,
    required this.counterNotify,
  });
  final CounterNotify counterNotify;
  static CounterInherited of(BuildContext context) {
    var inherited = context.dependOnInheritedWidgetOfExactType<CounterInherited>();
    assert(inherited != null, '在context中未找到CounterInherited类');
    return inherited!;
  }

  @override
  bool updateShouldNotify(covariant CounterInherited oldWidget) {
    return oldWidget.counterNotify != counterNotify;
  }
}

//存放需要监听的变量
class CounterNotify extends ChangeNotifier {
  final countState = ValueNotifier<int>(0);
  void add() => countState.value++;
}
