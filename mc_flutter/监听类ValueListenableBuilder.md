### 类ValueListenableBuilder

##### 构造函数

```
ValueListenableBuilder({
    Key key, 
    @required ValueListenable<T> valueListenable, 
    @required ValueWidgetBuilder<T> builder, 
    Widget child
})
```

##### 内置方法inherited

```
createElement() → StatefulElement

```

##### 常规方法

```
createState() → State<StatefulWidget>
debugDescribeChildren() → List<DiagnosticsNode>
debugFillProperties(DiagnosticPropertiesBuilder properties) → void
toDiagnosticsNode({String name, DiagnosticsTreeStyle style}) → DiagnosticsNode
toString({DiagnosticLevel minLevel: DiagnosticLevel.info}) → String
toStringDeep({String prefixLineOne: '', String prefixOtherLines, DiagnosticLevel minLevel: DiagnosticLevel.debug}) → String
toStringShallow({String joiner: ', ', DiagnosticLevel minLevel: DiagnosticLevel.debug}) → String
toStringShort() → String
A short, textual description of this widget.
```

### 类ValueNotifier<T> 

##### 继承关系

```
Inheritance
Object>ChangeNotifier>ValueNotifier
Implemented types
ValueListenable<T>
```

##### 构造函数

```
ValueNotifier(T _value)
```

##### 公有属性

```
value ↔ T
```

##### 私有属性

```
hashCode → int
hasListeners → bool
runtimeType → Type
```

##### 公有方法

```
toString() → String
```

##### 私有方法

```
addListener(VoidCallback listener) → void
dispose() → void
noSuchMethod(Invocation invocation) → dynamic
notifyListeners() → void
emoveListener(VoidCallback listener) → void
```

### 抽象类InheritedWidget

##### 继承关系

```
Inheritance
Object DiagnosticableTree Widget ProxyWidget InheritedWidget
```

```
Implementers
BottomNavigationBarTheme ButtonBarTheme CupertinoUserInterfaceLevel DataTableTheme DefaultAssetBundle Directionality DropdownButtonHideUnderline FlexibleSpaceBarSettings FocusTraversalOrder HeroControllerScope InheritedModel InheritedNotifier InheritedTheme MediaQuery PrimaryScrollController ScrollConfiguration UnmanagedRestorationScope
```

##### 构造函数

```
InheritedWidget({
	Key key, 
	Widget child
})
```

### 简例01

```
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: MyHome()));
class MyHome extends StatelessWidget {
  final _counter = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('ValueListenableBuilder')),
        body: Center(
            child: ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) {
                  return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[child, Text('$value')]);
                },
                child: Text('这里不会更新${_counter.value}'))),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.plus_one), onPressed: () => _counter.value += 1));
  }
}
```

### 预定义

```dart
ValueWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T value,
  Widget? child
)
```
