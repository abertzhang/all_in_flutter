### 类AbstractNode

#### 继承关系

```
//子类,Implementers
Layer
RenderObject
SemanticsNode
```

#### 常用属性

```
attached → bool
depth → int
owner → Object?
parent → AbstractNode?
```

#### 常用方法

```
//将给定节点标记为此节点的子节点
adoptChild(covariant AbstractNode child) → void
//将此节点标记为附加到给定所有者
attach(covariant Object owner) → void
//将此节点标记为已分离
detach() → void
//
dropChild(covariant AbstractNode child) → void
//
redepthChild(AbstractNode child) → void
redepthChildren() → void
```

### 类RenderObject

#### 继承关系

```dart
//Inheritance
Object AbstractNode RenderObject
//Implemented types
HitTestTarget
//Mixed in types
DiagnosticableTreeMixin
//Implementers
RenderAbstractViewport
RenderBox
RenderSliver
RenderView
```
#### 常用方法

```
localToGlobal(Offset point, {RenderObject? ancestor}) → Offset

markNeedsPaint() → void
```

#### 可复写方法

```dart
applyPaintTransform(covariant RenderObject child, Matrix4 transform) → void
performLayout() → void
performResize() → void
setupParentData(covariant RenderObject child) → void
markNeedsLayout() → void
layout(Constraints constraints, {bool parentUsesSize = false}) → void
handleEvent(PointerEvent event, covariant BoxHitTestEntry entry) → void
```

### 类RenderBox

#### 继承关系

````dart
//父类,Inheritance
Object 
AbstractNode 
RenderObject 
RenderBox
//子类,Implementers
PlatformViewRenderBox
RenderCustomMultiChildLayoutBox
RenderEditable
RenderErrorBox
RenderFlex
RenderFlow
RenderImage
RenderListBody
RenderListWheelViewport
RenderParagraph
RenderPerformanceOverlay
RenderProxyBox
RenderRotatedBox
RenderShiftedBox
RenderStack
RenderTable
RenderUiKitView
RenderViewportBase
RenderWrap
TextureBox
````

#### 常用属性

```
```

#### 常用方法

```
localToGlobal(Offset point, {RenderObject? ancestor}) → Offset

markNeedsPaint() → void
```

#### 可复写方法

```dart
applyPaintTransform(covariant RenderObject child, Matrix4 transform) → void
performLayout() → void
performResize() → void
setupParentData(covariant RenderObject child) → void
markNeedsLayout() → void
layout(Constraints constraints, {bool parentUsesSize = false}) → void
handleEvent(PointerEvent event, covariant BoxHitTestEntry entry) → void
```



### 类RenderProxyBox

#### 用法用途

```
//同等级的类
```



#### 继承关系

```dart
//继承父类--Inheritance
Object 
AbstractNode 
RenderObject 
RenderBox 
RenderProxyBox
//子类继承.Implementers
RenderAbsorbPointer
RenderAnimatedOpacity
RenderAnnotatedRegion
RenderAspectRatio
RenderBackdropFilter
RenderBlockSemantics
RenderClipOval
RenderClipPathRenderClipRect
RenderClipRRect
RenderConstrainedBox
RenderCustomPaint
RenderDecoratedBox
RenderExcludeSemantics
RenderFittedBox
RenderFollowerLayer
RenderFractionalTranslation
RenderIgnorePointe
rRenderIndexedSemantics
RenderIntrinsicHeightRenderIntrinsicWidth
RenderLeaderLayer
RenderLimitedBox
RenderMergeSemantics
RenderOffstage
RenderOpacity
RenderPhysicalModel
RenderPhysicalShape
RenderProxyBoxWithHitTestBehavior
RenderRepaintBoundary
RenderSemanticsAnnotations
RenderShaderMask
RenderTransform
```

#### 构造函数

```
RenderProxyBox([RenderBox? child])
```

#### 复写方法

```
void performLayout()
void paint(PaintingContext context, Offset offset) 
```

#### 常用方法

```
adoptChild(covariant RenderObject child) → void
applyPaintTransform(covariant RenderObject child, Matrix4 transform) → void
assembleSemanticsNode(SemanticsNode node, SemanticsConfiguration config, Iterable<SemanticsNode> children) → void
attach(covariant PipelineOwner owner) → void
clearSemantics() → void
computeDistanceToActualBaseline(TextBaseline baseline) → double?
computeDryLayout(BoxConstraints constraints) → Size
computeMaxIntrinsicHeight(double width) → double
computeMaxIntrinsicWidth(double height) → double
computeMinIntrinsicHeight(double width) → double
computeMinIntrinsicWidth(double height) → double
computeSizeForNoChild(BoxConstraints constraints) → Size
```

### 类Widget

#### 继承关系

```
//父类,Inheritance
Object 
DiagnosticableTree 
Widget
//子类,Implementers
PreferredSizeWidget
ProxyWidget
RenderObjectWidget
StatefulWidget
StatelessWidget
```

### 类PreferredSizeWidget

#### 继承关系

````
//父类,Implemented types
Widget
//子类,Implementers
AppBar
CupertinoTabBar
ObstructingPreferredSizeWidget
PreferredSize
Tab
TabBar
````

#### 构造函数

```
PreferredSizeWidget()
```

#### 常用方法

```
createElement() → Element
```

### 类ProxyWidget

#### 继承关系

```dart
//父类,Inheritance
Object 
DiagnosticableTree 
Widget 
ProxyWidget
//子类,Implementers
InheritedWidget
NotificationListener
ParentDataWidget
```

#### 构造函数

```dart
ProxyWidget({Key? key, required Widget child})
```

#### 常用方法

```
createElement() → Element
```

### 类RenderObjectWidget

#### 继承关系

```dart
//子类,Implementers
ConstrainedLayoutBuilder//
LeafRenderObjectWidget
ListWheelViewport
RenderObjectToWidgetAdapter  
MultiChildRenderObjectWidget//多个child
SingleChildRenderObjectWidget//单个child
SliverWithKeepAliveWidgetTable
```

### 类SingleChildRenderObjectWidget

#### 继承关系

```dart
//父类,Inheritance
Object 
DiagnosticableTree 
Widget 
RenderObjectWidget 
SingleChildRenderObjectWidget
//子类,Implementers
AbsorbPointer
Align
AnnotatedRegion
AspectRatio
BackdropFilter
Baseline
BlockSemantics
ClipOval
ClipPath
ClipRect
ClipRRect
ColoredBoxColorFilteredCompositedTransformFollowerCompositedTransformTargetConstrainedBoxConstraintsTransformBoxCustomPaintCustomSingleChildLayoutDecoratedBoxExcludeSemanticsFadeTransitionFittedBoxFractionallySizedBoxFractionalTranslationIgnorePointerImageFilteredIndexedSemanticsIntrinsicHeightIntrinsicWidthLimitedBoxListenerMergeSemanticsMetaDataMouseRegionOffstageOpacityOverflowBoxPaddingPhysicalModelPhysicalShapeRepaintBoundaryRotatedBoxSemanticsShaderMaskSizeChangedLayoutNotifierSizedBoxSizedOverflowBoxSliverFadeTransitionSliverIgnorePointerSliverOffstageSliverOpacitySliverOverlapAbsorberSliverOverlapInjectorSliverPaddingSliverToBoxAdapterSnapshotWidgetTapRegionTapRegionSurfaceTransform
```

#### 构造函数

```
SingleChildRenderObjectWidget({Key? key, Widget? child})
```

#### 常用方法

```dart
createElement() → SingleChildRenderObjectElement
createRenderObject(BuildContext context) → RenderObject
updateRenderObject(BuildContext context, covariant RenderObject renderObject) → void
```

### 类StatefulWidget

#### 常用方法

```
createElement() → StatefulElement
createState() → State<StatefulWidget>
toDiagnosticsNode({String? name, DiagnosticsTreeStyle? style}) → DiagnosticsNode
```

### 类StatelessWidget

#### 常用方法

```
build(BuildContext context) → Widget
createElement() → StatelessElement
toDiagnosticsNode({String? name, DiagnosticsTreeStyle? style}) → DiagnosticsNode
```

### 类State<T extends StatefulWidget> 

#### 常用属性

```
context → BuildContext
mounted → bool
widget → T
```

#### 常用方法

```dart
//通过删除后重新插入到树中时调用
activate() → void
build(BuildContext context) → Widget
//从树中删除此对象时调用
deactivate() → void
//依赖项更改时调用
didChangeDependencies() → void
//配置更改时调用
didUpdateWidget(covariant T oldWidget) → void
dispose() → void
initState() → void
//每当在调试期间重新组装应用程序时调用，例如在热重新加载期间
reassemble() → void
setState(VoidCallback fn) → void
toDiagnosticsNode({String? name, DiagnosticsTreeStyle? style}) → DiagnosticsNode
```

### 简例01-继承RenderObject

```dart
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('继承RenderBox')),
        body: const DemoPage(),
      ),
    ),
  );
}

class DemoPage extends StatelessWidget {
  const DemoPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.greenAccent,
      child: MyRenderBoxWidget(
        child: FlutterLogo(size: 200),
      ),
    );
  }
}

class MyRenderBoxWidget extends SingleChildRenderObjectWidget {
  const MyRenderBoxWidget({super.key, required Widget child}) : super(child: child);
  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderMyRenderBox();
  }
}

class RenderMyRenderBox extends RenderBox with RenderObjectWithChildMixin {
  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    // child?.layout(BoxConstraints.tight(const Size(50, 50)));
    size = const Size(300, 600);
    // size = (child as RenderBox).size;
    // super.layout(constraints);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child!, offset);
    context.canvas.drawCircle(offset, 2, Paint());
    context.pushOpacity(offset, 127, (context, offset) {
      context.paintChild(child!, offset + Offset(130, 130));
    });
    // super.paint(context, offset);
  }
}

```

### 简例02-继承ProxyRenderBox

```dart
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('继承RenderBox')),
        body: const Demo(),
      ),
    ),
  );
}

class Demo extends StatelessWidget {
  const Demo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.greenAccent,
      child: MyProxyRenderBoxWidget(
        child: FlutterLogo(size: 200),
      ),
    );
  }
}

class MyProxyRenderBoxWidget extends SingleChildRenderObjectWidget {
  const MyProxyRenderBoxWidget({
    super.key,
    required Widget child,
  }) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderMyRenderBox();
  }
}

class RenderMyRenderBox extends RenderProxyBox {
  @override
  void performLayout() {
    child?.layout(constraints, parentUsesSize: true);
    // child?.layout(BoxConstraints.tight(const Size(50, 50)));
    size = const Size(300, 600);
    // size = (child as RenderBox).size;
    // super.layout(constraints);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    context.paintChild(child!, offset);
    context.canvas.drawCircle(offset, 2, Paint());
    context.pushOpacity(offset, 127, (context, offset) {
      context.paintChild(child!, offset + Offset(130, 130));
    });
    // super.paint(context, offset);
  }
}

```



#### 文档资料

[Flutter 自定义控件之RenderObject](https://blog.csdn.net/yingshukun/article/details/107814111)

[自己动手写一个RenderObject](https://www.bilibili.com/video/BV14y4y177Uv/?spm_id_from=333.337.search-card.all.click&vd_source=b9aff273129955972ba5e761af57d33d)

[RenderProxyBox官方文档](https://api.flutter.dev/flutter/rendering/RenderProxyBox-class.html)

[使用 RenderObject 进行自定义渲染](https://juejin.cn/post/7238153003282694181)

[Flutter自定义widget 纯手撸一个循环滚动的组件(包含手势和动画)](https://juejin.cn/post/7129030461770170375)

[RenderBox官方文档](https://api.flutter.dev/flutter/rendering/RenderBox-class.html)

[RenderObject官方文档](https://api.flutter.dev/flutter/rendering/RenderObject-class.html)