### 类Future

```
dart:core//核心库
dart:async library
abstract class Future<T>
Implementers:DelegatingFuture SynchronousFuture TickerFuture
```

#### 继承关系

```
//子类继承Implementers
DelegatingFutureSynchronousFutureTickerFuture
//扩展Available Extensions
FutureExtensions
```

#### 构造函数

```dart
//事件队列里
Future(FutureOr<T> computation())
  //事件队列
Future.delayed(Duration duration, [FutureOr<T> computation()])
Future.error(Object error, [StackTrace? stackTrace])
  //微任务队列,还有scheduleMicrotask()和_completed.then()
Future.microtask(FutureOr<T> computation())
//直接运行
Future.sync(FutureOr<T> computation())
  //直接运行
Future.value([FutureOr<T>? value])
//_.then()也是直接运行
```

#### 方法

```dart
asStream() → Stream<T>
catchError(Function onError, {bool test(Object error)}) → Future<T>
then<R>(FutureOr<R> onValue(T value), {Function? onError}) → Future<R>
timeout(Duration timeLimit, {FutureOr<T> onTimeout()}) → Future<T>
whenComplete(FutureOr<void> action()) → Future<T>
```

#### 静态方法

```
any<T>(Iterable<Future<T>> futures) → Future<T>
doWhile(FutureOr<bool> action()) → Future
orEach<T>(Iterable<T> elements, FutureOr action(T element)) → Future
wait<T>(Iterable<Future<T>> futures, {bool eagerError: false, void cleanUp(T successValue)}) → Future<List<T>>
```

### 类Completer

对Future功能的分离

#### 构造函数

```
Completer()
Completer.sync()
```

#### 属性

```
future → Future<T>
isCompleted → bool
```

#### 方法

```
complete([FutureOr<T>? value]) → void
completeError(Object error, [StackTrace? stackTrace]) → void
```

#### 使用方式

```
//可以Future的报错,完成等个情况分开
class AsyncOperation {
  final Completer _completer = new Completer();

  Future<T> doOperation() {
    _startOperation();
    return _completer.future; // Send future object back to client.
  }

  // Something calls this when the value is ready.
  void _finishOperation(T result) {
    _completer.complete(result);
  }

  // If something goes wrong, call this.
  void _errorHappened(error) {
    _completer.completeError(error);
  }
}
```

### 类FutureOr<T>

```
// The `Future<T>.then` function takes a callback [f] that returns either
// an `S` or a `Future<S>`.
Future<S> then<S>(FutureOr<S> f(T x), ...);

// `Completer<T>.complete` takes either a `T` or `Future<T>`.
void complete(FutureOr<T> value);
```

### 类FutureGroup<T>

[官方文档](https://api.flutter.dev/flutter/async/FutureGroup-class.html)

### 简例-优先判断-01

```dart
import 'dart:async';
void main() {
  Future x0 = Future(() => null);
  Future x = Future(() => print('1'));
  Future(() => print('2'));
  scheduleMicrotask(() => print('3'));
  x.then((value) {
    print('4');
    Future(() => print('5'));
  }).then((value) => print('6'));
  print('7');
  x0.then((value) {
    print('8');
    scheduleMicrotask(() {
      print('9');
    });
  }).then((value) => print('10'));
}
//
7
3
8
10
9
1
4
6
2
5
```

### 简例-验证顺序-02

```dart
import 'dart:async';
void main() {
  Future.delayed(Duration.zero, () => print('event_2'));
  Future(() => print('event_1'));
  scheduleMicrotask(() => print('micro_1'));
  Future.microtask(() => print('micro_2'));
  Future.value(12).then((value) => print('micro_3'));
  print('main_1');
  Future.sync(() => print('sync_1'));
  getName();
  print('main_2');
}

String getName() {
  print('value内的getName');
  return 'name';
}
//
main_1
sync_1
value内的getName
main_2
micro_1
micro_2
micro_3
event_2
event_1
```
### 简例-验证then是立即执行-01

```dart
import 'dart:async';
void main() {
  Future.delayed(Duration(seconds: 1), () => print('delayed')).then((value) {
    scheduleMicrotask(() => print('mirco'));
    print('then_1');
  }).then((value) => print('then_2'));
}
//
elayed
then_1
then_2
mirco
```

### 简例-Future.wait

```dart
void main() {
  Future.wait([
    Future(() {
      print('任务一');
      return "任务一";
    }),
    Future(() {
      Future.delayed(Duration(seconds: 1));
      print('任务二');
      return "任务二";
    }),
  ]).then((value) {
    //注意此时value 就是一个数组
    print('then:来了：${value[0]} + ${value[1]}');
    print('任务3');
  });
}
//
任务一
任务二
then:来了：任务一 + 任务二
任务3
```

### 文档资料

[官方文档](https://api.flutter.dev/flutter/dart-async/Future-class.html)

[Flutter之事件队列、微任务队列、多线程](https://www.cnblogs.com/zyzmlc/p/14088880.html)

