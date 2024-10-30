### 类SliverPadding

####  构造函数

```dart
SliverPadding({
  Key key, 
  @required EdgeInsetsGeometry padding, 
  Widget sliver 
})
```

### SliverAnimatedOpacity

```dart
SliverAnimatedOpacity({
  Key? key, 
  Widget? sliver, 
  required double opacity, 
  Curve curve = Curves.linear, 
  required Duration duration, 
  VoidCallback? onEnd, 
  bool alwaysIncludeSemantics = false
})
```

### SliverFadeTransition

#### 继承关系

```
Inheritance
Object DiagnosticableTree Widget RenderObjectWidget SingleChildRenderObjectWidget SliverFadeTransition
```

#### 构造函数

```dart
SliverFadeTransition({
  Key? key, 
  required Animation<double> opacity, 
  bool alwaysIncludeSemantics = false, 
  Widget? sliver
})
```

### SliverFillRemaining

构造函数

```dart
SliverFillRemaining({
	Key? key, 
  Widget? child, 
  bool hasScrollBody = true, 
  bool fillOverscroll = false
})
```

### SliverFillViewport

```dart
SliverFillViewport({
  Key? key, 
  required SliverChildDelegate delegate, 
  double viewportFraction = 1.0, 
  bool padEnds = true
})
```

### 类SliverIgnorePointer

```dart
SliverIgnorePointer({
  Key? key, 
  bool ignoring = true, 
  bool? ignoringSemantics, 
  Widget? sliver
})
```

### SliverLayoutBuilder

#### 继承关系

```dart
//继承父类-Inheritance
Object 
  DiagnosticableTree 
  Widget 
  RenderObjectWidget 
  ConstrainedLayoutBuilder<SliverConstraints> 
  SliverLayoutBuilder
```

#### 构造函数

```dart
SliverLayoutBuilder({
Key? key, 
required Widget builder(BuildContext, SliverConstraints)
})
```

### 类SliverMultiBoxAdaptorWidget

继承关系

```
Inheritance
Object DiagnosticableTree Widget RenderObjectWidget SliverWithKeepAliveWidget SliverMultiBoxAdaptorWidget
```

构造函数

```dart
SliverMultiBoxAdaptorWidget({
  Key? key, 
  required SliverChildDelegate delegate
})
```

### 类SliverOffstage

继承关系

```
Inheritance
Object DiagnosticableTree Widget RenderObjectWidget SingleChildRenderObjectWidget SliverOffstage
```

构造函数

```dart
SliverOffstage({
  Key? key, 
  bool offstage = true, 
  Widget? sliver
})
```

### 类SliverOpacity

构造函数

```dart
SliverOpacity({
  Key? key, 
  required double opacity, 
  bool alwaysIncludeSemantics = false, 
  Widget? sliver
})
```

### 类SliverSafeArea

```dart
SliverSafeArea({
  Key? key, 
  bool left = true, 
  bool top = true, 
  bool right = true, 
  bool bottom = true, 
  EdgeInsets minimum = EdgeInsets.zero, 
  required Widget sliver
})
```

### 类SliverToBoxAdapter

#### 构造函数

```dart
SliverToBoxAdapter({Key? key, Widget? child})
```

### 类SliverVisibility

#### 构造函数

```dart
SliverVisibility({
  Key? key, 
  required Widget sliver, 
  Widget replacementSliver = const SliverToBoxAdapter(), 
  bool visible = true, 
  bool maintainState = false, 
  bool maintainAnimation = false, 
  bool maintainSize = false, 
  bool maintainSemantics = false, 
  bool maintainInteractivity = false
})
```

