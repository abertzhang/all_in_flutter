### 类SliverAppBar

#### 用途用法

可以pinned固定title

在bottom参数放TabBar

配合flexibleSpace里放类FlexibleSpaceBar,底部标题上滑后变主标题

vivo在使用FlexibleSpaceBar只有一半宽度显示内容

#### 构造函数

```dart
SliverAppBar({
  Key? key, 
  Widget? leading, 
  bool automaticallyImplyLeading = true, 
  Widget? title, List<Widget>? actions, 
  Widget? flexibleSpace, PreferredSizeWidget? bottom, 
  double? elevation, double? scrolledUnderElevation, 
  Color? shadowColor, Color? surfaceTintColor, 
  bool forceElevated = false, 
  Color? backgroundColor, 
  Color? foregroundColor, 
  //用systemOverlayStyle代替
  Brightness? brightness, 
  IconThemeData? iconTheme, 
  IconThemeData? actionsIconTheme, 
  //之后用toolbarTextStyle代替
  TextTheme? textTheme, 
  bool primary = true, 
  bool? centerTitle, bool excludeHeaderSemantics = false, 
  double? titleSpacing, double? collapsedHeight, 
  double? expandedHeight, bool floating = false, 
  bool pinned = false, bool snap = false, bool stretch = false, 
  double stretchTriggerOffset = 100.0, 
  AsyncCallback? onStretchTrigger, 
  ShapeBorder? shape, 
  double toolbarHeight = kToolbarHeight,
  double? leadingWidth, 
  bool? backwardsCompatibility, 
  TextStyle? toolbarTextStyle, 
  TextStyle? titleTextStyle, 
  SystemUiOverlayStyle? systemOverlayStyle
})
```

#### 命名构造large

```dart
SliverAppBar.large({
Key? key, 
  //左侧图标或文字
  Widget? leading, 
  //没有leading时为箭头图标
  bool automaticallyImplyLeading = true, 
  //标题
  Widget? title, 
  //标题是否居中
  bool? centerTitle,   
  //标题右侧的Widget,可以多个
  List<Widget>? actions, 
  //扩展内容
  Widget? flexibleSpace, 
  //收缩后高度
  double? collapsedHeight,
  //扩展高度
  double? expandedHeight,   
  //
  PreferredSizeWidget? bottom, 
  double? elevation, 
  double? scrolledUnderElevation, 
  Color? shadowColor, 
  Color? surfaceTintColor, 
  bool forceElevated = false, 
  Color? backgroundColor, 
  Color? foregroundColor, 
  IconThemeData? iconTheme,
  IconThemeData? actionsIconTheme, 
  //是否显示在状态栏的下面,false就会占领状态栏的高度
  bool primary = true, 
  bool excludeHeaderSemantics = false, 
  //之前版本NavigationToolbar.kMiddleSpacing,
  double? titleSpacing,
  //和pinned为false时的浮动效果
  bool floating = false, 
  //标题是否固定
  bool pinned = true,
  //配合floating使用,是否有吸顶效果
  bool snap = false, 
  bool stretch = false, 
  double stretchTriggerOffset = 100.0, 
  AsyncCallback? onStretchTrigger, 
  ShapeBorder? shape, 
  double toolbarHeight = _LargeScrollUnderFlexibleConfig.collapsedHeight, 
  TextStyle? toolbarTextStyle, 
  TextStyle? titleTextStyle, 
  SystemUiOverlayStyle? systemOverlayStyle
})
```

#### 命名构造medium

```dart
SliverAppBar.medium({
  Key? key, 
  Widget? leading, 
  bool automaticallyImplyLeading = true, 
  Widget? title, 
  List<Widget>? actions, 
  Widget? flexibleSpace, 
  PreferredSizeWidget? bottom, 
  double? elevation, 
  double? scrolledUnderElevation, 
  Color? shadowColor, 
  Color? surfaceTintColor, 
  bool forceElevated = false, 
  Color? backgroundColor, 
  Color? foregroundColor, 
  IconThemeData? iconTheme, 
  IconThemeData? actionsIconTheme, 
  bool primary = true, 
  bool? centerTitle, 
  bool excludeHeaderSemantics = false, 
  double? titleSpacing, 
  double? collapsedHeight, 
  double? expandedHeight, 
  bool floating = false, 
  bool pinned = true, 
  bool snap = false, 
  bool stretch = false, 
  double stretchTriggerOffset = 100.0, 
  AsyncCallback? onStretchTrigger, 
  ShapeBorder? shape, 
  double toolbarHeight = _MediumScrollUnderFlexibleConfig.collapsedHeight, 
  double? leadingWidth, 
  TextStyle? toolbarTextStyle, 
  TextStyle? titleTextStyle, 
  SystemUiOverlayStyle? systemOverlayStyle
})
```

### 类FlexibleSpaceBar

#### 继承关系

```dart
//继承父类-Inheritance
Object 
DiagnosticableTree 
Widget 
StatefulWidget 
FlexibleSpaceBar
```

#### 构造函数

```dart
FlexibleSpaceBar({
  Key? key, 
  Widget? title, 
  Widget? background, 
  bool? centerTitle, 
  EdgeInsetsGeometry? titlePadding,
  CollapseMode collapseMode = CollapseMode.parallax, 
  List<StretchMode> stretchModes = const <StretchMode>[StretchMode.zoomBackground], 
  double expandedTitleScale = 1.5
})
```

### 枚举CollapseMode

```dart
//The background widget will scroll in a parallax fashion.
//视差效果
parallax → const CollapseMode

pin → const CollapseMode
//The background widget pin in place until it reaches the min extent.

//none → const CollapseMode
The background widget will act as normal with no collapsing effect.
  values → const List<CollapseMode>
```

### 枚举StretchMode

```dart
zoomBackground → const StretchMode
//The background widget will expand to fill the extra space.

blurBackground → const StretchMode
//The background will blur using a ImageFilter.blur effect.

fadeTitle → const StretchMode
//The title will fade away as the user over-scrolls.
```



### 参考文档

[官方文档FlexibleSpaceBar](https://api.flutter.dev/flutter/material/FlexibleSpaceBar-class.html)

[官方文档SliverAppBar](https://api.flutter.dev/flutter/material/SliverAppBar-class.html)

[Flutter Sliver一辈子之敌](http://www.javashuo.com/article/p-tcjynfwo-bn.html)
