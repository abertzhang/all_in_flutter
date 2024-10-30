### 类ExtendedListView

#### 构造函数

```dart
ExtendedListView({
  Key? key, 
  Axis scrollDirection = Axis.vertical, 
  bool reverse = false, 
  ScrollController? controller, 
  bool? primary, ScrollPhysics? physics, 
  bool shrinkWrap = false, EdgeInsetsGeometry? padding, 
  double? itemExtent, 
  bool addAutomaticKeepAlives = true, 
  bool addRepaintBoundaries = true, 
  bool addSemanticIndexes = true, 
  double? cacheExtent,
  List<Widget> children = const <Widget>[], 
  int? semanticChildCount, 
  DragStartBehavior dragStartBehavior = DragStartBehavior.start, 
  ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual, 
  String? restorationId, Clip clipBehavior = Clip.hardEdge, required ExtendedListDelegate extendedListDelegate
})
```

#### 命名构造builder

```dart
ExtendedListView.builder({
	Key? key, 
  Axis scrollDirection = Axis.vertical, 
  bool reverse = false, ScrollController? controller, 
  bool? primary, ScrollPhysics? physics, 
  bool shrinkWrap = false, EdgeInsetsGeometry? padding, 
  double? itemExtent, required IndexedWidgetBuilder itemBuilder, 
  int? itemCount, 
  bool addAutomaticKeepAlives = true, 
  bool addRepaintBoundaries = true, 
  bool addSemanticIndexes = true, 
  double? cacheExtent, 
  int? semanticChildCount, DragStartBehavior dragStartBehavior = DragStartBehavior.start, required ExtendedListDelegate extendedListDelegate, ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual, 
  String? restorationId, Clip clipBehavior = Clip.hardEdge
})
```

#### 命名构造custom

```dart
ExtendedListView.custom({Key? key, Axis scrollDirection = Axis.vertical, bool reverse = false, ScrollController? controller, bool? primary, ScrollPhysics? physics, bool shrinkWrap = false, EdgeInsetsGeometry? padding, double? itemExtent, required SliverChildDelegate childrenDelegate, double? cacheExtent, int? semanticChildCount, required ExtendedListDelegate extendedListDelegate, DragStartBehavior dragStartBehavior = DragStartBehavior.start, ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual, String? restorationId, Clip clipBehavior = Clip.hardEdge})
```

#### 命名构造separated

```dart
ExtendedListView.separated({
  Key? key, Axis scrollDirection = Axis.vertical, 
  bool reverse = false, ScrollController? controller, 
  bool? primary, ScrollPhysics? physics, 
  bool shrinkWrap = false, 
  EdgeInsetsGeometry? padding, 
  required IndexedWidgetBuilder itemBuilder, 
  required IndexedWidgetBuilder separatorBuilder, 
  required int itemCount, bool addAutomaticKeepAlives = true, 
  bool addRepaintBoundaries = true, 
  bool addSemanticIndexes = true, 
  double? cacheExtent, 
  DragStartBehavior dragStartBehavior = DragStartBehavior.start, S
    crollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual, 
  required ExtendedListDelegate extendedListDelegate, 
  String? restorationId, Clip clipBehavior = Clip.hardEdge
})
```



### 参考文档

[官方文档entended_list](https://pub.flutter-io.cn/packages/extended_list)