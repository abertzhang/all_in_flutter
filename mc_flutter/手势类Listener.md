### 类Listener

##### 继承关系

```
//继承父类Inheritance
Object 
DiagnosticableTree 
Widget R
enderObjectWidget 
SingleChildRenderObjectWidget 
Listener
```

##### 构造函数

```dart
Listener({
    Key? key, 
    PointerDownEventListener? onPointerDown, PointerMoveEventListener? onPointerMove, PointerUpEventListener? onPointerUp, PointerHoverEventListener? onPointerHover, PointerCancelEventListener? onPointerCancel, PointerSignalEventListener? onPointerSignal, HitTestBehavior behavior: HitTestBehavior.deferToChild, 
    Widget? child
})
```

##### 公有属性

```
behavior → HitTestBehavior
onPointerCancel → PointerCancelEventListener?
onPointerDown → PointerDownEventListener?
onPointerHover → PointerHoverEventListener?
onPointerMove → PointerMoveEventListener?
onPointerSignal → PointerSignalEventListener?
onPointerUp → PointerUpEventListener?
```

##### 私有属性

```
child → Widget?
hashCode → int
key → Key?
runtimeType → Type
```

##### 公有方法

```
createRenderObject(BuildContext context) → RenderPointerListener
debugFillProperties(DiagnosticPropertiesBuilder properties) → void
updateRenderObject(BuildContext context, covariant RenderPointerListener renderObject) → void
```

##### 私有方法

```
createElement() → SingleChildRenderObjectElement
debugDescribeChildren() → List<DiagnosticsNode>
didUnmountRenderObject(covariant RenderObject renderObject) → void
noSuchMethod(Invocation invocation) → dynamic
toDiagnosticsNode({String? name, DiagnosticsTreeStyle? style}) → DiagnosticsNode
toString({DiagnosticLevel minLevel: DiagnosticLevel.info}) → String
toStringDeep({String prefixLineOne: '', String? prefixOtherLines, DiagnosticLevel minLevel: DiagnosticLevel.debug}) → String
toStringShallow({String joiner: ', ', DiagnosticLevel minLevel: DiagnosticLevel.debug}) → String
toStringShort() → String
```

### 枚举类HitTestBehavior

##### 常量

```
deferToChild → const HitTestBehavior//0
opaque → const HitTestBehavior//1
translucent → const HitTestBehavior//2
values → const List<HitTestBehavior>
```

##### 公有属性

```
index → int
```

##### 公有方法

```
toString() → String
```

### 预定义

```
typedef PointerSignalEventListener 
	= void Function(PointerSignalEvent event);
```

```
typedef PointerCancelEventListener 
	= void Function(PointerCancelEvent event);
```

```
typedef PointerHoverEventListener 
	= void Function(PointerHoverEvent event);
```

```
typedef PointerUpEventListener 
	= void Function(PointerUpEvent event);
```

```
typedef PointerMoveEventListener 
	= void Function(PointerMoveEvent event);
```

```
typedef PointerDownEventListener 
	= void Function(PointerDownEvent event);
```

### 简例01

```
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: DemoListener()));
class DemoListener extends StatefulWidget {
  @override
  _DemoListenerState createState() => _DemoListenerState();
}
class _DemoListenerState extends State<DemoListener> {
  PointerEvent _event;
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Listener(
          child: Container(
              alignment: Alignment.center,
              color: Colors.blue,
              height: 720,
              child: Text(_event?.toString() ?? "")),
          onPointerDown: (PointerEvent event) => setState(() => _event = event),
          onPointerMove: (PointerEvent event) => setState(() => _event = event),
          onPointerUp: (PointerEvent event) => setState(() => _event = event)));
}
```

