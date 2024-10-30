### 依赖导包

```
dependencies:
  event_bus: ^1.1.1
import 'package:event_bus/event_bus.dart';
```

### 类EventBus

##### 构造函数

```
EventBus({bool sync = false})
EventBus.customController(StreamController controller)
```

##### 常用属性

```
streamController → StreamController
```

##### 常用方法

```
destroy() → void
fire(dynamic event) → void
on<T>() → Stream<T>
```

##### 类EventBus源码

```
class EventBus{
  StreamController _streamController;
  StreamController get streamController => _streamController;
  EventBus ({bool sync = false}):_streamController= StreamController.broadcast(sync: sync);
  EventBus.customController(StreamController controller):_streamController = controller;
  Stream<T> on<T>(){
    if (T ==dynamic){
      return streamController.stream;
    }else{
      return streamController.stream.where((event)=>event is T).cast<T>();
    }
  }
  void fire(event){
    streamController.add(event);
  }
  void destroy(){
    _streamController.close();
  }
}
```



### 简例01

```
//event_bus: ^1.1.1
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
var eventBus = EventBus();
void main() => runApp(MaterialApp(home: EventBusTestPage()));
class EventBusTestPage extends StatefulWidget {
  @override
  State createState() => _EventBusTestPageState();
}
class _EventBusTestPageState extends State<EventBusTestPage> {
  StreamSubscription _subscription;
  var data = "";
  @override
  void initState() {
    super.initState();
    //监听登录事件
    _subscription = eventBus
        .on<EventParam>()
        .listen((EventParam eventParam) => show(eventParam.name));
  }
  void show(String val) {
    setState(() => data = val);
  }
  @override
  Widget build(BuildContext context) => Scaffold(
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text("EventBus回传的数据: $data"),
            RaisedButton(
                child: Text("跳转到第二页面"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<Null>(
                      builder: (BuildContext context) => EventBusTestPage2()));
                })
          ]));
  @override
  void dispose() {
    super.dispose();
    eventBus.destroy();
    //_subscription.resume();  //  开
    //_subscription.pause();    //  暂停
    _subscription.cancel(); //  取消
  }
}
class EventBusTestPage2 extends StatefulWidget {
  @override
  State createState() => _EventBusTestPage2State();
}
class _EventBusTestPage2State extends State<EventBusTestPage2> {
  void _onFire() {
    eventBus.fire(EventParam("110", '我是从第二页过来的data'));
  }
  @override
  Widget build(BuildContext context) => Scaffold(
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            RaisedButton(
                child: Text("传data给第一页"),
                onPressed: () {
                  _onFire();
                  Navigator.of(context).pop();
                })
          ]));
}
class EventParam {
  String id,name;

  EventParam(this.id, this.name);
}
```

### 简例02

自定义类EventBus,代替插件event_bus

```
import 'dart:async';
import 'package:flutter/material.dart';
// import 'package:event_bus/event_bus.dart';
var eventBus = EventBus();
void main() => runApp(MaterialApp(home: EventBusTestPage()));
class EventBusTestPage extends StatefulWidget {
  @override
  State createState() => _EventBusTestPageState();
}
class _EventBusTestPageState extends State<EventBusTestPage> {
  StreamSubscription _subscription;
  var data = "";
  @override
  void initState() {
    super.initState();
    //监听登录事件
    _subscription = eventBus
        .on<EventParam>()
        .listen((EventParam eventParam) => show(eventParam.name));
  }
  void show(String val) {
    setState(() => data = val);
  }
  @override
  Widget build(BuildContext context) => Scaffold(
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text("EventBus回传的数据: $data"),
            RaisedButton(
                child: Text("跳转到第二页面"),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<Null>(
                      builder: (BuildContext context) => EventBusTestPage2()));
                })
          ]));
  @override
  void dispose() {
    super.dispose();
    eventBus.destroy();
    //_subscription.resume();  //  开
    //_subscription.pause();    //  暂停
    _subscription.cancel(); //  取消
  }
}
class EventBusTestPage2 extends StatefulWidget {
  @override
  State createState() => _EventBusTestPage2State();
}
class _EventBusTestPage2State extends State<EventBusTestPage2> {
  void _onFire() {
    eventBus.fire(EventParam("110", '我是从第二页过来的data'));
  }
  @override
  Widget build(BuildContext context) => Scaffold(
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            RaisedButton(
                child: Text("传data给第一页"),
                onPressed: () {
                  _onFire();
                  Navigator.of(context).pop();
                })
          ]));
}
class EventParam {
  String id,name;
  EventParam(this.id, this.name);
}
class EventBus{
  StreamController _streamController;
  StreamController get streamController => _streamController;
  EventBus ({bool sync = false}):_streamController= StreamController.broadcast(sync: sync);
  EventBus.customController(StreamController controller):_streamController = controller;
  Stream<T> on<T>(){
    if (T ==dynamic){
      return streamController.stream;
    }else{
      return streamController.stream.where((event)=>event is T).cast<T>();
    }
  }
  void fire(event){
    streamController.add(event);
  }
  void destroy(){
    _streamController.close();
  }
}
```

### 简例03

通过EventBus来更换主题

```
import 'dart:math';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
EventBus eventBus;
var themeColor;
final List<Color> themeColorList = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.cyan,
  Colors.blue,
  Colors.purple
];
void main() => runApp(EventbusPage());
class EventbusPage extends StatefulWidget {
  EventbusPage({Key key}) : super(key: key);
  _EventbusPageState createState() => _EventbusPageState();
}
class _EventbusPageState extends State<EventbusPage> {
  @override
  void initState() {
    super.initState();
    eventBus = EventBus();
    themeColor = themeColorList[0];
    eventBus
        .on<ThemeEvent>()
        .listen((ThemeEvent onData) => setState(() {
              themeColor = themeColorList[onData.themeIndex];
            }));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "全局事件总线",
        theme: ThemeData(
          primarySwatch: themeColor,
        ),
        home: Scaffold(
            appBar: AppBar(title: Text("全局事件总线")),
            body: RaisedButton(
              onPressed: () =>                  eventBus.fire(ThemeEvent(Random().nextInt(7))),
              child: Text("更换主题色"),
            )));
  }
}
class ThemeEvent {
  int themeIndex;
  ThemeEvent(this.themeIndex);
}
```

