### 类FutureBuilder<T>

#### 继承关系

```
//继承父类Inheritance
Object 
DiagnosticableTree 
Widget 
StatefulWidget 
FutureBuilder
```

#### 构造函数

```dart
FutureBuilder({
  Key? key, 
  Future<T>? future, 
  T? initialData, 
  required AsyncWidgetBuilder<T> builder
})
```

### 类AsyncSnapshot<T>

[官方文档](https://api.flutter.dev/flutter/widgets/AsyncSnapshot-class.html)

#### 构造函数

```
AsyncSnapshot.nothing()
AsyncSnapshot.waiting()
AsyncSnapshot.withData(ConnectionState state, T data)
AsyncSnapshot.withError(ConnectionState state, Object error, [StackTrace stackTrace = StackTrace.empty])
```

#### 属性

```
connectionState → ConnectionState
data → T?
error → Object?
hasData → bool
hasError → bool
```

#### 方法

```
inState(ConnectionState state) → AsyncSnapshot<T>
```

### 枚举ConnectionState

```dart
none
//maybe with some initial data.
waiting
//indicating that the asynchronous operation has begun, typically with the data being null.
active
// with data being non-null, and possible changing over time.
done
//with data being non-null.
```

### 类StreamBuilder<T>

[官方文档](https://api.flutter.dev/flutter/widgets/StreamBuilder-class.html)

#### 继承关系

```dart
//继承父类Inheritance
Object 
DiagnosticableTree 
Widget 
StatefulWidget 
StreamBuilderBase<T, AsyncSnapshot<T>> 
StreamBuilder
```

#### 构造函数

```dart
StreamBuilder({
  Key? key, 
  T? initialData, 
  Stream<T>? stream, 
  required AsyncWidgetBuilder<T> builder
})
```



### 预定义

```dart
AsyncWidgetBuilder<T> = Widget Function(
BuildContext context,
AsyncSnapshot<T> snapshot
)
```



### 文档资料

[官方文档](https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html)