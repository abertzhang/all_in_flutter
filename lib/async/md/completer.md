### 类Completer

#### 源码

```dart
abstract interface class Completer<T> {
  factory Completer() => new _AsyncCompleter<T>();
  factory Completer.sync() => new _SyncCompleter<T>();
  Future<T> get future;
  void complete([FutureOr<T>? value]);
  void completeError(Object error, [StackTrace? stackTrace]);
  bool get isCompleted;
}
```

### 参考文档

[Flutter 之 Completer 源码解读以及应用](https://juejin.cn/post/7282994349444628517?searchId=2024062220285749EE28341F32903BA7D4)