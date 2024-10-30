### 类Flow

#### 文档资料

[官方文档](https://api.flutter.dev/flutter/widgets/Flow-class.html)

[Flutter 知识集锦 | 基于 Flow 实现滑动显隐层](https://juejin.cn/post/7205959141562023997)

[【Flutter高级玩法- Flow 】我的位置我做主](https://juejin.cn/post/6844904089445203976)

#### 用途用法

可以将children自由布局

children的定位点在左上角,需要一定数学计算后从中心位置换算到左上角

问题-利用变化操作后单击等事件响应问题

### 继承关系

```
//继承父类-Inheritance
Object 
DiagnosticableTree 
Widget 
RenderObjectWidget 
MultiChildRenderObjectWidget 
Flow
```

### 构造函数

```dart
Flow({
  Key? key, 
  required FlowDelegate delegate, 
  List<Widget> children = const <Widget>[], 
  Clip clipBehavior = Clip.hardEdge
})
//
Flow.unwrapped({
  Key? key, 
  required FlowDelegate delegate, 
  List<Widget> children = const <Widget>[], 
  Clip clipBehavior = Clip.hardEdge
})
```

### 类

#### 文档资料

[官方文档](https://api.flutter.dev/flutter/rendering/FlowDelegate-class.html)

#### 构造函数

```dart
FlowDelegate({Listenable? repaint})
```

#### 方法

```dart
	//设置每个child的布局约束条件，会覆盖已有的；
getConstraintsForChild
  //设置Flow的尺寸；
getSize
  //child的绘制控制代码，可以调整尺寸位置，写起来比较的繁琐；
paintChildren
  //是否需要重绘；
shouldRepaint
  //是否需要重新布局
shouldRelayout
```

