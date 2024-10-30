### 普通的简例01

当开始计算时开始阻塞main的

```
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
void main() => runApp(MaterialApp(
      home: TestWidget(),
    ));
class TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=>TestWidgetState();
}
class TestWidgetState extends State<TestWidget> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("wu"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              // width: 100,
              // height: 100,
              child: CircularProgressIndicator(),
            ),
            FlatButton(
                onPressed: () async {
                  _count = countEven(10000);
                  setState(() {});
                },
                child: Text("$_count"))
          ],
          // mainAxisSize: MainAxisSize.min,
        ));
  }
  static int countEven(int num) {
    int count = 0;
    while (num > 0) {
      if (num % 2 == 0) {
        count++;
      }
      num--;
    }
    return count;
  }
}
```

### 用async优化

```
//变化
static Future<int> countEven(int num) async
_count = await countEven(1000000000)
```

```
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
void main() => runApp(MaterialApp(
      home: TestWidget(),
    ));
class TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=>TestWidgetState();
}
class TestWidgetState extends State<TestWidget> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("wu"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              // width: 100,
              // height: 100,
              child: CircularProgressIndicator(),
            ),
            FlatButton(
                onPressed: ()  async{//放进Event队列,低于MicroTask
                  _count = await countEven(1000000000);
                  setState(() {});
                },
                child: Text("$_count"))
          ],
          // mainAxisSize: MainAxisSize.min,
        ));
  }
  static Future<int> countEven(int num) async{
    int count = 0;
    while (num > 0) {
      if (num % 2 == 0) {
        count++;
      }
      num--;
    }
    return count;
  }
}
```

### 使用compute优化

卡顿的原因是在同一个线程中导致的，那我们有没有办法将计算移到新的线程中呢，当然是可以的。不过在dart中，这里不是称呼线程，是Isolate，直译叫做隔离，这么古怪的名字，是因为隔离不共享数据，每个隔离中的变量都是不同的，不能相互共享。

  但是由于dart中的Isolate比较重量级，UI线程和Isolate中的数据的传输比较复杂，因此flutter为了简化用户代码，在foundation库中封装了一个轻量级compute操作，我们先看看compute，然后再来看Isolate。

  要使用compute，必须注意的有两点，一是我们的compute中运行的函数，必须是顶级函数或者是static函数，二是compute传参，只能传递一个参数，返回值也只有一个，我们先看看本例中的compute优化吧

```
_count = await compute(countEven, 1000000000);//变化
```

```
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
void main() => runApp(MaterialApp(
      home: TestWidget(),
    ));
class TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=>TestWidgetState();
}
class TestWidgetState extends State<TestWidget> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("wu"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              // width: 100,
              // height: 100,
              child: CircularProgressIndicator(),
            ),
            FlatButton(
                onPressed: ()  async{//放进Event队列,低于MicroTask
                  _count = await compute(countEven, 1000000000);//变化
                  setState(() {});
                },
                child: Text("$_count"))
          ],
          // mainAxisSize: MainAxisSize.min,
        ));
  }
  static Future<int> countEven(int num) async{
    int count = 0;
    while (num > 0) {
      if (num % 2 == 0) {
        count++;
      }
      num--;
    }
    return count;
  }
}
```

### 使用Isolate优化

compute的使用还是有些限制，它没有办法多次返回结果，也没有办法持续性的传值计算，每次调用，相当于新建一个隔离，如果调用过多的话反而会适得其反。在某些业务下，我们可以使用compute，但是在另外一些业务下，我们只能使用dart提供的Isolate了

```
//增加两个函数
static Future<dynamic> isolateCountEven(int num) async {
    final response = ReceivePort();//接受
    //新建isolate,通话端口建立  
    await Isolate.spawn(countEvent2, response.sendPort);
    final sendPort = await response.first;
    final answer = ReceivePort();
    sendPort.send([answer.sendPort, num]);//发送msg数组
    return answer.first;
  } 
static void countEvent2(SendPort port) {
    final rPort = ReceivePort();
    port.send(rPort.sendPort);//main的端口发送新isolate的端口
    rPort.listen((message) {//新isolate开始监听
      final send = message[0] as SendPort;
      final n = message[1] as int;
      send.send(countEven(n));
    });
  }
```

```
import 'dart:isolate';
import 'package:flutter/material.dart';
// import 'package:flutter/foundation.dart';
void main() => runApp(MaterialApp(
  home: TestWidget(),
));

class TestWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=>TestWidgetState();
}
class TestWidgetState extends State<TestWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("wu"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              // width: 100,
              // height: 100,
              child: CircularProgressIndicator(),
            ),
            FlatButton(
                onPressed: ()  async{//放进Event队列,低于MicroTask
                  //_count = await compute(countEven, 1000000000);//变化
                  _count = await isolateCountEven(900000000);
                  setState(() {});
                },
                child: Text("$_count"))
          ],
        ));
  }

static  int countEven(int num) {
    int count = 0;
    while (num > 0) {
      if (num % 2 == 0) {
        count++;
      }
      num--;
    }
    return count;
  }
  static Future<dynamic> isolateCountEven(int num) async {
    final response = ReceivePort();
    await Isolate.spawn(countEvent2, response.sendPort);
    final sendPort = await response.first;
    final answer = ReceivePort();
    sendPort.send([answer.sendPort, num]);
    return answer.first;
  }
  static void countEvent2(SendPort port) {
    final rPort = ReceivePort();
    port.send(rPort.sendPort);
    rPort.listen((message) {
      final send = message[0] as SendPort;
      final n = message[1] as int;
      send.send(countEven(n));
    });
  }
}
```

