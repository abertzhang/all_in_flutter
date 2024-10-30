### Stream构造函数

```
Stream()
Stream.empty()
Stream.error(Object error, [ StackTrace stackTrace ])
Stream.eventTransformed(Stream source, 
    EventSink mapSink(EventSink<T> sink))
Stream.fromFuture(Future<T> future)
Stream.fromFutures(Iterable<Future<T>> futures)
Stream.fromIterable(Iterable<T> elements)
Stream.periodic(Duration period, 
    [ T computation(int computationCount) ])
Stream.value(T value)
```

### 相关类

```
Stream,StreamController, StreamSubscription, StreamSink
Stream          = StreamController.stream
StreamSink       =StreamController.sink
StreamSubscription = StreamController.stream.listen
```

### 基本stream流

```
import 'dart:async';
void main() {
  Stream<String> myStream = Stream.fromFuture(fetchData());
  myStream.listen(onData);//监听到数据给onData
}
Future<String> fetchData() async{
  await Future.delayed(Duration(seconds:3));
  return 'hello ~';
}
void onData(String data)=>print('$data');
```

```
import 'dart:async';
void main() {
  Stream<String> myStream = Stream.fromFuture(fetchData());
  myStream.listen(onData,onError:onError,onDone:onDone);
}
Future<String> fetchData() async{
  await Future.delayed(Duration(seconds:3));
  //throw '意外的错误';
  return 'hello ~';
}
void onData(String data)=>print('$data');
void onError(error)=>print('error!');
void onDone()=>print('Done!');
```

### 流的StreamSubscription

```
import 'dart:async';
void main() {
  StreamSubscription ss;
  Stream<String> myStream = Stream.fromFuture(fetchData());
  ss = myStream.listen(onData,onError:onError,onDone:onDone);
//   ss.cancel();//   ss.pause();//   ss.resume();
}
Future<String> fetchData() async{
  await Future.delayed(Duration(seconds:3));
  throw '意外的错误';
//   return 'hello ~';
}
void onData(String data)=>print('$data');
void onError(error)=>print('error!');
void onDone()=>print('Done!');
```

### 流的StreamControl

```
import 'dart:async';
void main() async{
  StreamSubscription ss;//
  var controller = StreamController<String>();
  String data = await fetchData();
  ss = controller.stream.listen(onData);
  controller.add(data);
  print(ss.isPaused);
}
Future<String> fetchData() async{
  await Future.delayed(Duration(seconds:3));
  return 'hello ~';
}
void onData(String data)=>print('$data');
```

### 流的Sink

```
import 'dart:async';
void main() async{
  StreamSubscription ss;
  StreamSink sink;
  var controller = StreamController<String>();
  String data = await fetchData();
  ss = controller.stream.listen(onData);
  sink = controller.sink;
  sink.add(data);//   controller.add(data);
  print(ss.isPaused);
}
Future<String> fetchData() async{
  await Future.delayed(Duration(seconds:3));
  return 'hello ~';
}
void onData(String data)=>print('$data');
```

### 流的broadcast

```
import 'dart:async';
void main() async{
  StreamSink sink;
  StreamController<String> controller = StreamController.broadcast();
  String data = await fetchData();
  controller.stream.listen(onData);//one:hello ~
  controller.stream.listen(onDataTwo);//Two:hello ~
  sink = controller.sink;
  sink.add(data);//没sink就用controller.add(data);
}
Future<String> fetchData() async{
  await Future.delayed(Duration(seconds:3));
  return 'hello ~';
}
void onData(String data)=>print('one:$data');
void onDataTwo(String data)=>print('Two:$data');
```

## 简例01

```
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: StreamDemo()));
class StreamDemo extends StatefulWidget {
  @override
  _StreamDemoState createState() => _StreamDemoState();
}
class _StreamDemoState extends State<StreamDemo> {
  Stream<String> stream;
//用于被监听
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    //throw'something happened!';    用于模拟抛出一个错误
    return 'hello';
  }
//监听到数据后回调,错误回调,完成后回调
  void onData(String data) {
    print("$data");
  }
  void onError(error) {
    print("有错误提示:$error");
  }
  void onDone() {
    print("onDone!");
  }
  @override
  void initState() {
    super.initState();
    stream = Stream.fromFuture(fetchData());
    stream.listen(onData, onError: onError, onDone: onDone);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream基本"),
      ),
      body: Center(),
    );
  }
}
```

## 简例02StreamSubscription

```
import 'dart:async';
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: StreamDemo()));
class StreamDemo extends StatefulWidget {
  @override
  _StreamDemoState createState() => _StreamDemoState();
}
class _StreamDemoState extends State<StreamDemo> {
  Stream<String> stream;
  StreamSubscription streamSubscription;
//用于被监听
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    //throw'something happened!';    用于模拟抛出一个错误
    return 'hello';
  }
//监听到数据后回调,错误回调,完成后回调
  void onData(String data) {
    print("$data");
  }
  void onError(error) {
    print("有错误提示:$error");
  }
  void onDone() {
    print("onDone!");
  }
//监听流 暂停,取消,开始
  void _pauseStream() {
    streamSubscription.pause();
  }
  void _resumeStream() {
    streamSubscription.resume();
  }
  void _cancelStream() {
    streamSubscription.cancel();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stream = Stream.fromFuture(fetchData());
    //stream.listen(onData, onError: onError, onDone: onDone);
    streamSubscription =
        stream.listen(onData, onError: onError, onDone: onDone);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream基本"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(child: Text("暂停"),onPressed: _pauseStream),
            RaisedButton(child: Text("恢复"),onPressed: _resumeStream),
            RaisedButton(child: Text("取消"),onPressed: _cancelStream),
          ],
        ),
      ),
    );
  }
}
```

### 简例03StreamController

```
import 'dart:async';
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: StreamDemo()));
class StreamDemo extends StatefulWidget {
  @override
  _StreamDemoState createState() => _StreamDemoState();
}
class _StreamDemoState extends State<StreamDemo> {
//  Stream<String> stream;
  StreamSubscription streamSubscription;
  StreamController<String> streamController;
//用于被监听
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    //throw'something happened!';    用于模拟抛出一个错误
    return 'hello';
  }
//监听到数据后回调,错误回调,完成后回调
  void onData(String data) {
    print("$data");
  }
  void onError(error) {
    print("有错误提示:$error");
  }
  void onDone() {
    print("onDone!");
  }
//监听流 暂停,取消,开始
  void _pauseStream() {
    streamSubscription.pause();
  }
  void _resumeStream() {
    streamSubscription.resume();
  }
  void _cancelStream() {
    streamSubscription.cancel();
  }
  void _addDataToStream() async {
    String data = await fetchData();
    streamController.add(data);
  }
  @override
  void initState() {
    super.initState();
//    stream = Stream.fromFuture(fetchData());
    streamController = StreamController<String>();
//    stream.listen(onData, onError: onError, onDone: onDone);
//    streamSubscription =
//        stream.listen(onData, onError: onError, onDone: onDone);
    streamSubscription = streamController.stream
        .listen(onData, onError: onError, onDone: onDone);
  }
  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream基本"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(child: Text("发送数据"),onPressed: _addDataToStream,),
            RaisedButton(child: Text("暂停"), onPressed: _pauseStream),
            RaisedButton(child: Text("恢复"), onPressed: _resumeStream),
            RaisedButton(child: Text("取消"), onPressed: _cancelStream),
          ],
        ),
      ),
    );
  }
}
```

### 简例04StreamSink

```
import 'dart:async';
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: StreamDemo()));
class StreamDemo extends StatefulWidget {
  @override
  _StreamDemoState createState() => _StreamDemoState();
}
class _StreamDemoState extends State<StreamDemo> {
//  Stream<String> stream;
  StreamSubscription streamSubscription;
  StreamController<String> streamController;
  StreamSink sink;
//用于被监听
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    //throw'something happened!';    用于模拟抛出一个错误
    return 'hello';
  }
  void onData(String data) => print("$data");
  void onError(error) => print("有错误提示:$error");
  void onDone() => print("onDone!");
  void _pauseStream() => streamSubscription.pause();
  void _resumeStream() => streamSubscription.resume();
  void _cancelStream() => streamSubscription.cancel();

  void _addDataToStream() async {
    String data = await fetchData();
//  streamController.add(data);
    sink.add(data);
  }
  @override
  void initState() {
    super.initState();
    streamController = StreamController<String>();
    streamSubscription = streamController.stream
        .listen(onData, onError: onError, onDone: onDone);
    sink = streamController.sink;
  }
  @override
  void dispose() {
    streamSubscription.cancel();
    streamController.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text("Stream基本")),
      body: Center(
          child: Column(children: <Widget>[
        RaisedButton(child: Text("发送数据"), onPressed: _addDataToStream),
        RaisedButton(child: Text("暂停"), onPressed: _pauseStream),
        RaisedButton(child: Text("恢复"), onPressed: _resumeStream),
        RaisedButton(child: Text("取消"), onPressed: _cancelStream)
      ])));
}
```

### 简例05broadcast

```
import 'dart:async';
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: StreamDemo()));
class StreamDemo extends StatefulWidget {
  @override
  _StreamDemoState createState() => _StreamDemoState();
}
class _StreamDemoState extends State<StreamDemo> {
  String dataListen;
//  Stream<String> stream;
  StreamSubscription streamSubscription;
  StreamController<String> streamController;
  StreamSink sink;
//用于被监听
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    //throw'something happened!';    用于模拟抛出一个错误
    return 'hello';
  }
//监听到数据后回调,错误回调,完成后回调
  void onData(String data) {
    print("第一个监听器:$data");
    setState(() {
      dataListen = data;
    });
  }
  void onDataTwo(String data) {
    print("第二个监听器:$data");
  }
  void onError(error) {
    print("有错误提示:$error");
  }
  void onDone() {
    print("onDone!");
  }
//监听流 暂停,取消,开始
  void _pauseStream() {
    streamSubscription.pause();
  }
  void _resumeStream() {
    streamSubscription.resume();
  }
  void _cancelStream() {
    streamSubscription.cancel();
  }
  void _addDataToStream() async {
    String data = await fetchData();
//  streamController.add(data);
    sink.add(data);
  }
  @override
  void initState() {
    super.initState();
//    stream = Stream.fromFuture(fetchData());
    streamController = StreamController<String>.broadcast();
//    stream.listen(onData, onError: onError, onDone: onDone);
//    streamSubscription =
//        stream.listen(onData, onError: onError, onDone: onDone);
    streamSubscription = streamController.stream
        .listen(onData, onError: onError, onDone: onDone);
    streamController.stream   //也可以不用StreamSubscription,用自己内部
        .listen(onDataTwo, onError: onError, onDone: onDone);
    sink = streamController.sink;
  }
  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream基本"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("发送数据"),
              onPressed: _addDataToStream,
            ),
            RaisedButton(child: Text("暂停"), onPressed: _pauseStream),
            RaisedButton(child: Text("恢复"), onPressed: _resumeStream),
            RaisedButton(child: Text("取消"), onPressed: _cancelStream),
            Text("$dataListen"),
          ],
        ),
      ),
    );
  }
}
```

