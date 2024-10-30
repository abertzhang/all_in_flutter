### 类SystemChrome

#### 静态属性

```
latestStyle → SystemUiOverlayStyle?
```

#### 静态方法

```
restoreSystemUIOverlays() → Future<void>
```

```dart
setApplicationSwitcherDescription(
  ApplicationSwitcherDescription description
) → Future<void>
```

```dart
setEnabledSystemUIMode(
	SystemUiMode mode, {List<SystemUiOverlay>? overlays
}) → Future<void>
```

```dart
setPreferredOrientations(
  List<DeviceOrientation> orientations
) → Future<void>
```

```dart
setSystemUIChangeCallback(
  SystemUiChangeCallback? callback
) → Future<void>
```

```dart
setSystemUIOverlayStyle(
  SystemUiOverlayStyle style
) → void
```

### 类SystemUiOverlayStyle

#### 构造函数

```dart
SystemUiOverlayStyle({
  Color? systemNavigationBarColor, 
  Color? systemNavigationBarDividerColor, 
  Brightness? systemNavigationBarIconBrightness, 
  bool? systemNavigationBarContrastEnforced, 
  Color? statusBarColor, 
  Brightness? statusBarBrightness, 
  Brightness? statusBarIconBrightness, 
  bool? systemStatusBarContrastEnforced
})
```

#### 常用方法

```dart
copyWith({
  Color? systemNavigationBarColor, 
  Color? systemNavigationBarDividerColor, 
  bool? systemNavigationBarContrastEnforced, 
  Color? statusBarColor, 
  Brightness? statusBarBrightness, 
  Brightness? statusBarIconBrightness, 
  bool? systemStatusBarContrastEnforced, 
  Brightness? systemNavigationBarIconBrightness
}) → SystemUiOverlayStyle
```

#### 常量

```dart
/*
SystemUiOverlayStyle(systemNavigationBarColor: Color(0xFF000000), systemNavigationBarIconBrightness: Brightness.light, statusBarIconBrightness: Brightness.dark, statusBarBrightness: Brightness.light)
*/
dark → const SystemUiOverlayStyle
/*
SystemUiOverlayStyle(systemNavigationBarColor: Color(0xFF000000), systemNavigationBarIconBrightness: Brightness.light, statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.dark)
*/
light → const SystemUiOverlayStyle  
```

### 类ApplicationSwitcherDescription

#### 构造函数

```dart
ApplicationSwitcherDescription({
  String? label, int? primaryColor
})
```

### 枚举类SystemUiMode

```dart
/*Android16以上Fullscreen display with status and navigation bars presentable by tapping anywhere on the display.
*/
leanBack, 
//
immersive, 
immersiveSticky, 
edgeToEdge, 
manual
```

### 枚DeviceOrientation

```
portraitUp, 
landscapeLeft, 
portraitDown, 
landscapeRight
```

### 枚举类Brightness

```
dark, 
light
```



### 预定义

```dart
typedef SystemUiChangeCallback = Future<void> Function(bool systemOverlaysAreVisible);

```

### 类AnnotatedRegion<T>

#### 用途用法

```
可以设置状态栏颜色
```



#### 继承关系

```dart
//继承父类,Inheritance
Object 
  DiagnosticableTree 
  Widget 
  RenderObjectWidget 
  SingleChildRenderObjectWidget 
  AnnotatedRegion
```

#### 构造函数

```dart
AnnotatedRegion({
  Key? key, 
  required Widget child, 
  required T value, 
  bool sized = true
})
```

### 类AnnotatedRegionLayer<T>

#### 继承关系

```dart
//继承父类,Inheritance
Object 
AbstractNode
Layer 
ContainerLayer 
AnnotatedRegionLayer
```

#### 构造函数

```dart
AnnotatedRegionLayer(
	T value, {
	Size? size, 
  Offset? offset, 
  bool opaque = false
})
```

### 类Layer

#### 继承关系

```dart
Inheritance
Object AbstractNode Layer
//
Mixed in types
DiagnosticableTreeMixin 
//
Implementers
ContainerLayer
PerformanceOverlayLayer
PictureLayerPlatformViewLayer
TextureLayer  
```

#### 常用方法

```
addCompositionCallback(CompositionCallback callback) → VoidCallback
addToScene(SceneBuilder builder) → void
adoptChild(covariant Layer child) → void
attach(covariant Object owner) → void
debugDescribeChildren() → List<DiagnosticsNode>
debugFillProperties(DiagnosticPropertiesBuilder properties) → void
debugMarkClean() → void
describeClipBounds() → Rect?
detach() → void
dispose() → void
dropChild(covariant Layer child) → void
find<S extends Object>(Offset localPosition) → S?
findAllAnnotations<S extends Object>(Offset localPosition) → AnnotationResult<S>
findAnnotations<S extends Object>(AnnotationResult<S> result, Offset localPosition, {required bool onlyFirst}) → bool
markNeedsAddToScene() → void
redepthChild(AbstractNode child) → void
redepthChildren() → void
remove() → void
supportsRasterization() → bool
updateSubtreeNeedsAddToScene() → void
```

### 简例01

```dart
/*
之所以判断当前系统是Android还是ios，
是因为当我们直接使用SystemUiOverlayStyle.dark时，
在Android端全面屏的显示下，底部会有黑边
*/
return AnnotatedRegion<SystemUiOverlayStyle>(
        value:Platform.isAndroid?SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white)
            :SystemUiOverlayStyle.dark,
        child:Container());
```

### 简例02

```dart
//第一种
AppBar( 
      brightness: Brightness.light, 
      xxxx
)
//
AnnotatedRegion<SystemUiOverlayStyle>(
  value: SystemUiOverlayStyle.dark,
  child:Container(),
);
//第三种有白色和黑色主题
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

```



### 参考资料

[类AnnotatedRegionLayer官方资料](https://api.flutter.dev/flutter/rendering/AnnotatedRegionLayer-class.html)

[Flutter深入分析状态栏图标适配](https://juejin.cn/post/6917154110525407239?searchId=2023080513550844AD1C6EB9F93E8CE2A5)

[Flutter完整开发实战详解(二十一、 Flutter 画面渲染的全面解析)](https://juejin.cn/post/6844904104452440072?searchId=2023080513550844AD1C6EB9F93E8CE2A5)

[Flutter Framework 渲染流程分析（四）：Layer](https://juejin.cn/post/7261252130442739749?searchId=2023080513550844AD1C6EB9F93E8CE2A5)

[Flutter 组件集录 | 师于源码 - 与 TapRegion 的相遇](https://juejin.cn/post/7199413150972772411?searchId=2023080513550844AD1C6EB9F93E8CE2A5)

[Flutter 3.0 之 PlatformView ：告别 VirtualDisplay ，拥抱 TextureLayer](https://juejin.cn/post/7098275267818291236?searchId=2023080513550844AD1C6EB9F93E8CE2A5)