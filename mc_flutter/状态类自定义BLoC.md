BLoC应用场景

BLoC代码示例

```
import 'dart:async';
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: BlocScaffold()));
class BlocScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CounterInherited(
      bloc: CounterBloc(),
      child: Scaffold(
          appBar: AppBar(title: Text("Bloc的演示")), body: CounterBody()));
}
class CounterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterInherited.of(context).bloc; 
    return Center(
        child: Column(children: <Widget>[
      StreamBuilder(
          stream: _counterBloc.counterCountStream,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot snapshot) => Container(
                child: Text('利用广播接收:${snapshot.data}'),
              )),
      StreamBuilder(
          stream: _counterBloc.counterCountStream,
          initialData: 0,
          builder: (BuildContext context, AsyncSnapshot snapshot) => Container(
              child: ActionChip(
                  avatar: Icon(Icons.add),
                  label: Text('${snapshot.data}'),
                  onPressed: () {
                    _counterBloc.counterActionSink.add(1);
                  })))
    ]));
  }
}
class CounterInherited extends InheritedWidget {
  CounterInherited({Key key, this.child, this.bloc})
      : super(key: key, child: child);
  final Widget child;
  final CounterBloc bloc;
  static CounterInherited of(BuildContext context) =>      context.dependOnInheritedWidgetOfExactType<CounterInherited>();
  @override
  bool updateShouldNotify(CounterInherited oldWidget) => true;
}
class CounterBloc {
  int _count = 0;
  final _counterActionController = StreamController<int>.broadcast();
  StreamSink<int> get counterActionSink => _counterActionController.sink;
  final _counterCountController = StreamController<int>.broadcast();
  Stream<int> get counterCountStream => _counterCountController.stream;
  CounterBloc() {
    _counterActionController.stream.listen(onActionData);
  }
  void onActionData(int data) {
    _count = data + _count;
    _counterCountController.add(_count);
  }
  void dispose() {
    _counterActionController.close();
    _counterCountController.close();
  }
}
```

