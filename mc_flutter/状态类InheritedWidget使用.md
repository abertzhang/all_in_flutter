@[TOC](文章目录)
## 前言
InheritedWidget类结合ValueListenableBuilder和ValueNotifier来代替setState,可以用stateless的类,而且数据变化时局部数据刷新,有效节省资源.
## 步骤
#### 步骤1定义管理

第1定义管理的监控类CounterInheritedNotify, 作用放置监控包裹Widget
```
class CounterInheritedNotify extends InheritedWidget {
  CounterInheritedNotify({Key key, this.child, this.counterNotify})
      : super(key: key, child: child);
  final Widget child;
  final CounterNotify counterNotify;
  static CounterInheritedNotify of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterInheritedNotify>();  }
  @override
  bool updateShouldNotify(CounterInheritedNotify oldWidget) {    return true;  }}
```

第2定义管理的数据类CounterNotify ,数据分离出来,逻辑更清晰
```
class CounterNotify with ChangeNotifier {
  ValueNotifier<int> _countListenable = ValueNotifier<int>(0);
  ValueNotifier<int> get countListenable => _countListenable;
  void addValue(int i) { _countListenable.value += i;  }}
```

#### 步骤2放置监控

```
class InheritedNotify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterInheritedNotify(       //监控的管理类CounterInheritedNotify
      counterNotify: CounterNotify(),      //绑定监控的数据类,完成数据类的实例化
      child: Scaffold(                    //放置监控包裹Scaffold
        appBar: AppBar(
          title: Text("InheritedWidget演示"), ),
        body:...}
```

#### 步骤3绑定数据
 在放置监控的同时已经绑定的监控数据类,单独强调为了便于理解
```
counterNotify: CounterNotify(),  //绑定监控的数据类
```

#### 步骤4数据展示
第1调用CounterInheritedNotify.of(context)获取到监控的数据类

```
CounterNotify counterNotify =
                CounterInheritedNotify.of(context).counterNotify;
```

第2通过ValueListenableBuilder获取变化值,取代setState

```
ValueListenableBuilder(
                    valueListenable: counterNotify.countListenable,
                    builder:
                        (BuildContext context, dynamic value, Widget child) {
                      return Text('$value'); }, ),
```

#### 步骤5总体说明
类CounterInheritedNotify 监控的管理类,用来包裹Scaffold,也可其他的
类CounterNotify 监控的数据类,负责数据的存放,add等
类ValueNotifier 监控的数据类里面的存放数据的变量必须是这个类型的
CounterInheritedNotify.of通过这个方法让监控的数据类都能被访问到
类ValueListenableBuilder通过build生成需要变化值的Widget的Widget,还有一个参数valueListenable用来绑定监控的数据类的值(类型必须是ValueNotifier类)

## 代码

```dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
  SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InheritedNotify (),
    );
  }
}
class InheritedNotify extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('scaffold上面刷新');
    return CounterInheritedNotify(
      counterNotify: CounterNotify(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("InheritedWidget演示"),
        ),
        body: Builder(
          builder: (BuildContext context) {
            CounterNotify counterNotify =
                CounterInheritedNotify.of(context).counterNotify;  //利用
            return Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Text("InheritedWidget结合ValueNotify<T>和ValueListenableBuilder"),
                  SizedBox(
                    height: 10,
                  ),
                  ValueListenableBuilder(
                    valueListenable: counterNotify.countListenable,
                    builder:
                        (BuildContext context, dynamic value, Widget child) {
                          print('ValueListenableBuilder里面刷新');
                      return Text('$value');
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),                
                  RaisedButton(
                    child: Text('加 1'),
                    onPressed: () {
                      counterNotify.addValue(3);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CounterInheritedNotify extends InheritedWidget {
  CounterInheritedNotify({Key key, this.child, this.counterNotify})
      : super(key: key, child: child);

  final Widget child;

  final CounterNotify counterNotify;

  static CounterInheritedNotify of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterInheritedNotify>();
  }

  @override
  bool updateShouldNotify(CounterInheritedNotify oldWidget) {
    return true;
  }
}

class CounterNotify with ChangeNotifier {
  ValueNotifier<int> _countListenable = ValueNotifier<int>(0);
  ValueNotifier<int> get countListenable => _countListenable;

  void addValue(int i) {
    _countListenable.value += i;
  }
}

```
