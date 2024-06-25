### 类Isolate

```
//属于dart的Isolate库
import 'dart:isolate';
https://api.flutter.dev/flutter/dart-isolate/Isolate-class.html
```

#### isolate工作原理

Dart 代码并不在多个线程上运行，取而代之的是它们会在 isolate 内运行。每一个 isolate 会有自己的堆内存，从而确保 isolate 之间互相隔离，无法互相访问状态。由于这样的实现并不会共享内存，所以你也不需要担心互斥锁和其他锁。

在使用 isolate 时，你的 Dart 代码可以在同一时刻进行多个独立的任务，并且使用可用的处理器核心。 Isolate 与线程和进程近似，但是每个 isolate 都拥有独立的内存，以及运行事件循环的独立线程。

在 Dart 中，**Isolate** 是一种类似于线程的概念，可以独立于其他 **Isolate** 运行，并且具有自己的堆栈和内存空间。这使得 Isolate 可以并行执行代码，并且不会受到其他 **Isolate** 的影响。

Isolate 的工作原理是通过使用 **Dart 的隔离机制来实现的**。每个 Isolate 都运行在独立的隔离环境中，并且与其他 Isolate 共享代码的副本。这意味着Isolate之间不能直接共享数据，而必须使用**消息传递机制**来进行通信。

#### isolate生命周期

isolate的生命周期可以分为三个阶段：创建、运行和终止。

**创建阶段**：使用 `Isolate.spawn()` 方法可以创建一个新的 Isolate，并且将一个函数作为参数传递给这个方法。这个函数将作为新的 Isolate 的入口点，也就是 Isolate 启动时第一个执行的函数。创建 Isolate 时还可以指定其他参数，例如 Isolate 的名称、是否共享代码等等。

**运行阶段**：一旦创建了 Isolate，它就会开始执行入口点函数，并且进入事件循环。在事件循环中，Isolate 会不断地从消息队列中获取消息，并且根据消息的类型执行相应的代码。Isolate 可以同时执行多个任务，并且可以通过消息传递机制来协调这些任务的执行顺序。

**终止阶段**：当 Isolate 完成了它的任务，或者由于某些原因需要停止时，可以调用 `Isolate.kill()` 方法来终止 Isolate。此时，Isolate 会立即停止执行，并且 Isolate 对象和所有与它相关的资源都会被释放。

![basics-isolate.png](http://qiniu-article.myflutter.cn/img/173e69dd85854943a2ba37dc208a1dd8~tplv-k3u1fbpfcp-zoom-in-crop-mark:1512:0:0:0.awebp)

#### 构造函数

```dart
Isolate(
SendPort controlPort, 
{Capability? pauseCapability, 
Capability? terminateCapability
})
```

#### 属性

```
controlPort → SendPort
debugName → String?
errors → Stream
pauseCapability → Capability?
terminateCapability → Capability?

```

#### 方法

```
addErrorListener(SendPort port) → void
addOnExitListener(SendPort responsePort, {Object? response}) → void
kill({int priority: beforeNextEvent}) → void
pause([Capability? resumeCapability]) → Capability
ping(SendPort responsePort, {Object? response, int priority: immediate}) → void
removeErrorListener(SendPort port) → void
removeOnExitListener(SendPort responsePort) → void
resume(Capability resumeCapability) → void
setErrorsFatal(bool errorsAreFatal) → void
```

#### 静态属性

```dart
current → Isolate
packageConfig → Future<Uri?>
packageRoot → Future<Uri?>//版本3.0之后被取消
```

#### 静态方法

```dart
exit([SendPort? finalMessagePort, Object? message]) → Never
resolvePackageUri(Uri packageUri) → Future<Uri?>
run<R>(FutureOr<R> computation(), {String? debugName}) → Future<R>
```

#### 静态方法spawn

```dart
//创建新的Isolate
spawn<T>(
	void entryPoint(T message), 
  T message, 
  {bool paused = false, 
   bool errorsAreFatal = true, 
   SendPort? onExit, 
   SendPort? onError, 
   String? debugName
  }) → Future<Isolate>
```

#### 静态方法spawnUri

```dart
spawnUri(
  Uri uri, 
  List<String> args, 
  dynamic message, 
  {bool paused = false, 
   SendPort? onExit, 
   SendPort? onError, 
   bool errorsAreFatal = true,
   bool? checked, 
   Map<String, String>? environment, 
   Uri? packageRoot, Uri? packageConfig, 
   bool automaticPackageResolution = false, 
   String? debugName
  }) → Future<Isolate>
```



#### 常量

```
beforeNextEvent → const int  1
immediate → const int  0
```

#### Isolate使用场景

- 如果一段代码不会被中断，那么就直接使用正常的同步执行就行。
- 如果代码段可以独立运行而不会影响应用程序的流畅性，建议使用 **Future**。
- 如果繁重的处理可能要花一些时间才能完成，而且会影响应用程序的流畅性，建议使用 **Isolate**。

- 对于耗时不超过 `16ms` 的操作推荐使用 **Future**。屏幕一帧的刷新间隔就是 `16ms`
- 对于耗时超过 `16ms` 以上的操作推荐使用 **Isolate**。

### Isolate组

在 **Dart 2.15** 也就是 **Flutter 2.8** 版本之后，当一个 Isolate 调用了 `Isolate.spawn()`，两个 Isolate 将拥有同样的执行代码，并归入同一个 **Isolate 组** 中。Isolate 组会带来性能优化，例如新的 Isolate 会运行由 Isolate 组持有的代码，即共享代码调用。同时，`Isolate.exit()` 仅在对应的 Isolate 属于同一组时有效。其原理是同一个 Isolate 组中的 Isolate **共享同一个堆**，避免了对象的重复拷贝。这意味着生成一个新 Isolate 的速度提高了 100 倍，消耗的内存减少了 10-100 倍。注意不要和前面的概念混淆，Isolate 仍然无法彼此共享内存，仍然需要消息传递。

某些场景下，你可能需要使用 [`Isolate.spawnUri()`](https://api.dart.cn/stable/dart-isolate/Isolate/spawnUri.html)，使用执行的 URI 生成新的 isolate，并且包含代码的副本。然而，`spawnUri()` 会比 `spawn()` 慢很多，并且新生成的 isolate 会位于新的 isolate 组。另外，当 isolate 在不同的组中，它们之间的消息传递会变得更慢。



### 类ReceivePort

#### 继承关系

```
//Implemented types
Stream
//Available Extensions
StreamExtensions
```

#### 构造函数

```dart
//factory模式
ReceivePort([String debugName = ''])
ReceivePort.fromRawReceivePort(RawReceivePort rawPort)
```

#### 属性

```dart
first → Future
isBroadcast → bool
isEmpty → Future<bool>
last → Future
length → Future<int>
sendPort → SendPort
single → Future
```

#### 方法

```dart
any(bool test(dynamic element)) → Future<bool>
asBroadcastStream({void onListen(StreamSubscription subscription)?, void onCancel(StreamSubscription subscription)?}) → Stream
asyncExpand<E>(Stream<E>? convert(dynamic event)) → Stream<E>
asyncMap<E>(FutureOr<E> convert(dynamic event)) → Stream<E>
cast<R>() → Stream<R>
close() → void
contains(Object? needle) → Future<bool>
distinct([bool equals(dynamic previous, dynamic next)?]) → Stream
drain<E>([E? futureValue]) → Future<E>
elementAt(int index) → Future
every(bool test(dynamic element)) → Future<bool>
expand<S>(Iterable<S> convert(dynamic element)) → Stream<S>
firstWhere(bool test(dynamic element), {dynamic orElse()?}) → Future
fold<S>(S initialValue, S combine(S previous, dynamic element)) → Future<S>
forEach(void action(dynamic element)) → Future
handleError(Function onError, {bool test(dynamic error)?}) → Stream
join([String separator = ""]) → Future<String>
lastWhere(bool test(dynamic element), {dynamic orElse()?}) → Future
listen(void onData(dynamic message)?, {Function? onError, void onDone()?, bool? cancelOnError}) → StreamSubscription
map<S>(S convert(dynamic event)) → Stream<S>
pipe(StreamConsumer streamConsumer) → Future
reduce(dynamic combine(dynamic previous, dynamic element)) → Future
singleWhere(bool test(dynamic element), {dynamic orElse()?}) → Future
skip(int count) → Stream
skipWhile(bool test(dynamic element)) → Stream
take(int count) → Stream
takeWhile(bool test(dynamic element)) → Stream
timeout(Duration timeLimit, {void onTimeout(EventSink sink)?}) → Stream
toList() → Future<List>
toSet() → Future<Set>
transform<S>(StreamTransformer<dynamic, S> streamTransformer) → Stream<S>
where(bool test(dynamic event)) → Stream  
```




### 类RawReceivePort

[官方文档](https://api.flutter.dev/flutter/dart-isolate/RawReceivePort-class.html)

#### 构造函数

```
//factory模式
RawReceivePort([Function? handler, String debugName = ''])
```

#### 属性

```
handler ← Function?
sendPort → SendPort
```

#### 方法

```
close() → void
```



### 类Capability

继承关系

```
//子类继承Implementers
SendPort
```

构造函数

```
Capability()
```

### 类SendPort

继承关系

```
//继承父类Implemented types
Capability
//扩展Available Extensions
NativePort
```

构造函数

```
SendPort()
```

### 顶层方法compute

[官方文档](https://api.flutter.dev/flutter/foundation/compute-constant.html)

`compute()` 实际是对 `isolates.compute` 的实例化

```
const ComputeImpl compute = isolates.compute;
```

因为 `compute()` 需要引入 **flutter/foundation.dart**，所以只能在 Flutter 中运行。

在 Flutter 中推荐使用 `compute()` 来实现，因为兼容 Web 平台。

其内部实现：在平台侧通过 `Isolate.run()`，在 Web 侧通过 `await null;` 抽取单帧来执行函数。

```dart
import 'package:flutter/foundation.dart';
//使用方式  
try {
    await compute((link) async {
      await Future.delayed(const Duration(seconds: 2));
      throw Exception('下载失败');
    }, '下载链接');
  } catch (e) {
    print('error: $e');
  }
  print('结束');
```



### 简例-Isolate-01

```dart
import 'dart:async';
import 'dart:isolate';
main() async {
  var receivePort = ReceivePort();
  await Isolate.spawn(echo, receivePort.sendPort);
  var sendPort = await receivePort.first;
  var msg = await sendReceive(sendPort, "foo");
  print('received $msg');
  msg = await sendReceive(sendPort, "bar");
  print('received $msg');
}
echo(SendPort sendPort) async {
  var port = ReceivePort();
  sendPort.send(port.sendPort);
  await for (var msg in port) {
    var data = msg[0];
    SendPort replyTo = msg[1];
    replyTo.send(data);
    if (data == "bar") port.close();
  }
}
Future sendReceive(SendPort port, msg) {
  ReceivePort response = ReceivePort();
  port.send([msg, response.sendPort]);
  return response.first;
}

```
### 简例-Isolate-02

```
import 'dart:async';
import 'dart:isolate';

int i = 0;
IntObject intObject = IntObject();
void main() async {
  //Isolate的消息接收端口
  final receive = ReceivePort();
  //为消息接收端口添加监听
  receive.listen((data) {
    print("Main:Receive=$data,i=$i,intObject=${intObject.get()}");
  });
  // 创建一个Isolate实例，1.指定入口函数 2.指定消息通信发送端口
  Isolate isolate = await Isolate.spawn(isolateEntryFunction, receive.sendPort);
  print(DateTime.now().toString() + "start...");
}

// isolate入口函数，该函数必须是静态的或顶级函数，不能是匿名内部函数。
void isolateEntryFunction(SendPort sendPort) {
  int counter = 0;
  Timer.periodic(const Duration(seconds: 3), (_) {
    counter++;
    //在单独的Isolate实例中修改i的值
    i++;
    intObject.increase();
    String sendMsg = "Notification data: $counter";
    print(DateTime.now().toString() +
        " Isolate: counter = $counter, i = $i, intObject = ${intObject.get()}");
    sendPort.send(sendMsg);
  });
}

class IntObject {
  int _i = 0;
  void increase() => _i++;
  int get() => _i;
}
```

### 简例-Isolate-03

```dart
import 'dart:isolate';
main(List<String> args) async {
  //接收和监听功能
  final mainReceivePort = ReceivePort();
  mainReceivePort.listen((onData) {
    print("mainReceive:$onData");
  });
  await Isolate.spawn(entryFunction, mainReceivePort.sendPort);
}
//在新isolate上运行,可以共享全局类的变量
void entryFunction(SendPort sendPort) {
  String sendMsg = "from new isolate!";
  sendPort.send(sendMsg);
}
```

### 文档资料

[库isolate官方文档](https://api.flutter.dev/flutter/dart-isolate/dart-isolate-library.html)

[类Isolate官方文档](https://api.flutter.dev/flutter/dart-isolate/Isolate-class.html)

[【Flutter基础】Dart中的并发Isolate](https://juejin.cn/post/7211539869805805623)

[Dart并发编程: isolate](https://juejin.cn/post/7098558405622628365)

[Flutter 小技巧之 3.7 性能优化 background isolate](https://juejin.cn/post/7195825738472620087)

[Flutter 异步编程：Future、Isolate 和事件循环](https://juejin.cn/post/6844903796334673933)

[官方-Dart中的并发](https://dart.cn/guides/language/concurrency#how-isolates-work)

[深入了解Flutter的isolate(4) --- 使用Compute写isolates](https://juejin.cn/post/6844903760167190536)

[Flutter 面试八股之深入理解 Dart 异步实现机制](https://juejin.cn/post/7383281753145475099?searchId=202406241507126C950C74EBD6F52D36BE)

[Flutter开发-- Isolate](https://juejin.cn/post/7356852535318528050?searchId=20240624152605CC0D07E30C6ABF2BB793)

[Dart: Isolate通信新范式](https://juejin.cn/post/7350541180616409140?searchId=20240624152605CC0D07E30C6ABF2BB793)
