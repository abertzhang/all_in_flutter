### 类Overlay

#### 继承关系

```dart
Inheritance
Object 
DiagnosticableTree 
Widget 
StatefulWidget 
Overlay
```

#### 构造函数

```dart
Overlay({
	Key? key, 
  List<OverlayEntry> initialEntries = const <OverlayEntry>[], 
  Clip clipBehavior = Clip.hardEdge
})
```

#### 静态方法

```dart
maybeOf(
  BuildContext context,{
    bool rootOverlay = false
  }) → OverlayState?
```

```dart
of(
BuildContext context, {
bool rootOverlay = false, 
Widget? debugRequiredFor
}) → OverlayState
```



### 类OverlayEntry

#### 构造函数

```dart
OverlayEntry({
  required WidgetBuilder builder, 
  //Overly 仅仅显示 不被上层遮挡（opaque = false）的
  bool opaque = false, 
  //Overly 仅仅会刷新 存在内存中（maintainState = true）的
  //这个字段，是给[Navigator]和[Route]使用的，确保路由即使在后台也能维持状态
  bool maintainState = false
})
```

#### 常用方法

```dart
addListener(VoidCallback listener) → void
dispose() → void
//调用这个方法，会导致entry在下一次管道刷新期间进行rebuild操作
markNeedsBuild() → void
remove() → void
removeListener(VoidCallback listener) → void  
```

### 类OverlayState

#### 继承关系

```dart
//继承Inheritance
Object 
State<Overlay> 
OverlayState
//混入Mixed in types
TickerProviderStateMixin<Overlay>
```

#### 构造函数

```dart
OverlayState()
```

#### 常用方法

```dart
activate() → void
build(BuildContext context) → Widget
createTicker(TickerCallback onTick) → Ticker
deactivate() → void
didChangeDependencies() → void
didUpdateWidget(covariant Overlay oldWidget) → void
dispose() → void
initState() → void
reassemble() → void
setState(VoidCallback fn) → void  
insert(OverlayEntry entry, {OverlayEntry? below, OverlayEntry? above}) → void
insertAll(Iterable<OverlayEntry> entries, {OverlayEntry? below, OverlayEntry? above}) → void
rearrange(Iterable<OverlayEntry> newEntries, {OverlayEntry? below, OverlayEntry? above}) → void  
```

### 获取组件位置

```dart
 RenderBox renderBox =
      globalKey.currentContext.findRenderObject() as RenderBox;
  Offset position = renderBox.localToGlobal(Offset.zero);
```

```
```



### 参考资料

[Flutter 必知必会系列 —— Navigator 的开始 Overlay](https://juejin.cn/post/7068164893672734750?searchId=20230719211532FA3872DD764A648D5480)
