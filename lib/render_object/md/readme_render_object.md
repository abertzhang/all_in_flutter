### 类RenderObject

### 继承关系

```dart
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



#### 属性

```dart
alwaysNeedsCompositing → bool
attached → bool
constraints → Constraints
depth → int
isRepaintBoundary → bool
layer ↔ ContainerLayer?
needsCompositing → bool
owner → PipelineOwner?
paintBounds → Rect
parent → RenderObject?
parentData ↔ ParentData?
semanticBounds → Rect
sizedByParent → bool  
```

#### 常用方法

```dart
adoptChild(RenderObject child) → void
```

```dart
applyPaintTransform(covariant RenderObject child, Matrix4 transform) → void
```

```dart
attach(PipelineOwner owner) → void
clearSemantics() → void
detach() → void
dispose() → void
dropChild(RenderObject child) → void
getTransformTo(RenderObject? ancestor) → Matrix4
handleEvent(PointerEvent event, covariant HitTestEntry<HitTestTarget> entry) → void
invokeLayoutCallback<T extends Constraints>(LayoutCallback<T> callback) → void
layout(Constraints constraints, {bool parentUsesSize = false}) → void
markNeedsCompositedLayerUpdate() → void
markNeedsCompositingBitsUpdate() → void
markNeedsLayout() → void
markNeedsLayoutForSizedByParentChange() → void
markNeedsPaint() → void
markNeedsSemanticsUpdate() → void
markParentNeedsLayout() → void
reassemble() → void  
redepthChild(RenderObject child) → void
redepthChildren() → void
replaceRootLayer(OffsetLayer rootLayer) → void
scheduleInitialLayout() → void
scheduleInitialPaint(ContainerLayer rootLayer) → void
scheduleInitialSemantics() → void 
sendSemanticsEvent(SemanticsEvent semanticsEvent) → void  
setupParentData(covariant RenderObject child) → void  
```

```dart
paint(PaintingContext context, Offset offset) → void  
paintsChild(covariant RenderObject child) → bool
performLayout() → void
performResize() → void  
```

```dart
showOnScreen({RenderObject? descendant, Rect? rect, Duration duration = Duration.zero, Curve curve = Curves.ease}) → void
```

```dart
updateCompositedLayer({required covariant OffsetLayer? oldLayer}) → OffsetLayer
visitChildren(RenderObjectVisitor visitor) → void
visitChildrenForSemantics(RenderObjectVisitor visitor) → void  
```

### 类RenderObjectWidget

#### 继承关系

```dart
//Inheritance
Object-> 
DiagnosticableTree-> 
Widget-> 
RenderObjectWidget
//Implementers
ConstrainedLayoutBuilder
LeafRenderObjectWidget
ListWheelViewport
MultiChildRenderObjectWidget
RenderObjectToWidgetAdapter
SingleChildRenderObjectWidget
SliverWithKeepAliveWidget
SlottedMultiChildRenderObjectWidget
Table
TwoDimensionalViewport  
//平行类 
PreferredSizeWidget
ProxyWidget
RenderObjectWidget
RootWidget
StatefulWidget
StatelessWidget
ViewCollection
```

#### 属性

```
hashCode → int
key → Key?
runtimeType → Type
```

#### 方法

```dart
createElement() → RenderObjectElement
createRenderObject(BuildContext context) → RenderObject
didUnmountRenderObject(covariant RenderObject renderObject) → void
toDiagnosticsNode({String? name, DiagnosticsTreeStyle? style}) → DiagnosticsNode
updateRenderObject(BuildContext context, covariant RenderObject renderObject) → void  
```



### 参考文档

[官方文档类RenderObject](https://api.flutter.dev/flutter/rendering/RenderObject-class.html)

[官方文档RenderObjectWidget](https://api.flutter.dev/flutter/widgets/RenderObjectWidget-class.html)

[Flutter的渲染机制之RenderObjectWidget、RenderObjectElement、RenderObject](https://www.jianshu.com/p/f76c9747ab9a)

[Widget、Element、Render是如何形成树结构？](https://juejin.cn/post/6921493845330886670)

[Flutter 简单实现手写瀑布流 第一篇](https://juejin.cn/post/6968786815448776718)

[Flutter中一个能获取行数的Wrap](https://juejin.cn/post/7331301209339707444)
