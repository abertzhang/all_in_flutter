### 类WidgetsBindingObserver

#### 源码定义

```dart
abstract mixin class WidgetsBindingObserver {
  /// [SystemChannels.navigation].
  Future<bool> didPopRoute() => Future<bool>.value(false);
  Future<bool> didPushRoute(String route) => Future<bool>.value(false);
  Future<bool> didPushRouteInformation(RouteInformation routeInformation) {
    final Uri uri = routeInformation.uri;
    return didPushRoute(
      Uri.decodeComponent(
        Uri(
          path: uri.path.isEmpty ? '/' : uri.path,
          queryParameters: uri.queryParametersAll.isEmpty ? null : uri.queryParametersAll,
          fragment: uri.fragment.isEmpty ? null : uri.fragment,
        ).toString(),
      ),
    );
  }
  void didChangeMetrics() { }
  void didChangeTextScaleFactor() { }
  void didChangePlatformBrightness() { }
  void didChangeLocales(List<Locale>? locales) { }
  void didChangeAppLifecycleState(AppLifecycleState state) { }
  Future<AppExitResponse> didRequestAppExit() async {
    return AppExitResponse.exit;
  }
  void didHaveMemoryPressure() { }
	void didChangeAccessibilityFeatures() { }  
}
```



#### 常用方法

```dart
void didChangeMetrics() {}
```

### 类StatelessWidget

#### 常用方法

```dart
 @override
  void initState() {
    super.initState();
  }
/*
didChangeDependencies 则用来专门处理 State 对象依赖关系变化，会在 initState() 调用结束后，被 Flutter 调用。
哪些情况下 State 对象的依赖关系会发生变化呢？比如使用 InheritedWidget 作数据共享的时候，InheritedWidget 的发生了变化，子widget的didChangeDependencies()回调都会被调用。典型的场景是，系统语言 Locale 或应用主题改变时，系统会通知 State 执行 didChangeDependencies 回调方法。
*/
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
/*
当 Widget 的配置发生变化时，比如，父 Widget 触发重建（即父 Widget 的状态发生变化时），热重载时，系统会调用这个函数。
*/
  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }
  
  @override
  void reassemble() {
    super.reassemble();
  }
  /*
  deactivate()：当State对象从树中被移除时，会调用此回调。在一些场景下，Flutter framework会将State对象重新插到树中，如包含此State对象的子树在树的一个位置移动到另一个位置时（可以通过GlobalKey来实现）。如果移除后没有重新插入到树中则紧接着会调用dispose()方法
  */
  @override
  void deactivate() {
    super.deactivate();
  }
/*
当State对象从树中被永久移除时调用；通常在此回调中释放资源。
*/
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {}
```



### 参考文档

[Flutter 中的组件绘制完成监听、组件生命周期和APP生命周期](https://juejin.cn/post/6869761883030142983?from=search-suggest)
