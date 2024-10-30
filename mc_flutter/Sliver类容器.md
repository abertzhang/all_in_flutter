### 类SliverList

#### 继承关系

```
//继承父类-Inheritance
Object 
DiagnosticableTree 
Widget 
RenderObjectWidget 
SliverWithKeepAliveWidget 
SliverMultiBoxAdaptorWidget 
SliverList
```

#### 构造函数

```dart
SliverList({
  Key? key, 
  required SliverChildDelegate delegate
})
```

#### 利用SliverChildBuilderDelegate建立SliverList

```dart
SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Material(
                    child: Text("序号$index"),
                  );
                },
                childCount: 30,
              ),
            )
```

### 类SliverChildDelegate

#### 继承关系

```
Implementers
SliverChildBuilderDelegate
SliverChildListDelegate
```

### 类SliverChildListDelegate

#### 构造函数

```dart
SliverChildListDelegate(
  List<Widget> children, 
  {bool addAutomaticKeepAlives = true, 
   bool addRepaintBoundaries = true, 
   bool addSemanticIndexes = true, 
   SemanticIndexCallback semanticIndexCallback = _kDefaultSemanticIndexCallback, 
   int semanticIndexOffset = 0
  })
```

#### 命名构造

```dart
SliverChildListDelegate.fixed(
List<Widget> children, 
  {bool addAutomaticKeepAlives = true, 
   bool addRepaintBoundaries = true, 
   bool addSemanticIndexes = true, 
   SemanticIndexCallback semanticIndexCallback = _kDefaultSemanticIndexCallback, 
   int semanticIndexOffset = 0
  })
```

### 类SliverGrid

#### 构造函数

```dart
SliverGrid({
  Key? key, 
  required SliverChildDelegate delegate, 
  required SliverGridDelegate gridDelegate
})
```

### 类SliverGridDelegate

#### 继承关系

```
//子类继承-Implementers
SliverGridDelegateWithFixedCrossAxisCount
SliverGridDelegateWithMaxCrossAxisExtent
```

### 类SliverGridDelegateWithFixedCrossAxisCount

```dart
SliverGridDelegateWithFixedCrossAxisCount({
  required int crossAxisCount, 
  double mainAxisSpacing = 0.0, 
  double crossAxisSpacing = 0.0, 
  double childAspectRatio = 1.0, 
  double? mainAxisExtent
})
```

### 类SliverGridDelegateWithMaxCrossAxisExtent

```dart
SliverGridDelegateWithMaxCrossAxisExtent({
	required double maxCrossAxisExtent, 
  double mainAxisSpacing = 0.0, 
  double crossAxisSpacing = 0.0, 
  double childAspectRatio = 1.0, 
  double? mainAxisExtent
})
```

### 类SliverChildBuilderDelegate

```dart
SliverChildBuilderDelegate(
IndexedWidgetBuilder builder, //用来生成Sliver Widget
{ ChildIndexGetter findChildIndexCallback, 
int childCount 
bool addAutomaticKeepAlives: true, 
bool addRepaintBoundaries: true, 
bool addSemanticIndexes: true, 
SemanticIndexCallback semanticIndexCallback: _kDefaultSemanticIndexCallback,
 int semanticIndexOffset: 0 
 })
```

## 类SliverFixedExtentList

#### 构造函数

```dart
SliverFixedExtentList({
Key key,    
@required SliverChildDelegate delegate, 
@required double itemExtent 
})
```

#### 在Sliver中使用类似列表的方案

```
SliverFixedExtentList(
              //这是个sliver类型的widget,
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return Material(
                  child: ListTile(title: Text("第$index个")),
                );
              }, childCount: 10),
              itemExtent: 50) //列的高度
```

```
SliverFixedExtentList(
                //这是个sliver类型的widget
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Container(
                    height: 30,
                    color: index % 2 == 0 ? Colors.red : Colors.purpleAccent,
                    alignment: Alignment.center,
                    child: Text("$index"),
                  );
                }, childCount: 10),
                itemExtent: 50)
```

### 类SliverAnimatedGrid

#### 构造函数

```dart
SliverAnimatedGrid({
  Key? key, 
  required AnimatedItemBuilder itemBuilder, 
  required SliverGridDelegate gridDelegate, 
  ChildIndexGetter? findChildIndexCallback, 
  int initialItemCount = 0
})
```

### 类SliverAnimatedList

#### 构造函数

```dart
SliverAnimatedList({
  Key? key, 
  required AnimatedItemBuilder itemBuilder, 
  ChildIndexGetter? findChildIndexCallback, 
  int initialItemCount = 0
})
```

### 类SliverPrototypeExtentList

继承关系

```dart
Inheritance
Object 
DiagnosticableTree 
Widget 
RenderObjectWidget 
SliverWithKeepAliveWidget 
SliverMultiBoxAdaptorWidget 
SliverPrototypeExtentList
```

#### 用途用法

根据入参prototypeItem大小决定item的大小

#### 构造函数

```dart
SliverPrototypeExtentList({
  Key? key, 
  required SliverChildDelegate delegate, 
  required Widget prototypeItem
})
```

### 类SliverReorderableList

构造函数

```dart
SliverReorderableList({
  Key? key, 
  required IndexedWidgetBuilder itemBuilder, 
  ChildIndexGetter? findChildIndexCallback, 
  required int itemCount, 
  required ReorderCallback onReorder, 
  void onReorderStart(int)?, 
  void onReorderEnd(int)?, 
  double? itemExtent, 
  Widget? prototypeItem, 
  ReorderItemProxyDecorator? proxyDecorator
})
```

### 类SliverReorderableListState

#### 参考其他类

ReorderableDragStartListener and ReorderableDelayedDragStartListener

 SliverReorderableList.of 能获取到SliverReorderableListState

#### 简例

```dart
// (e.g. in a stateful widget)
GlobalKey<SliverReorderableListState> listKey = GlobalKey<SliverReorderableListState>();

// ...

@override
Widget build(BuildContext context) {
  return SliverReorderableList(
    key: listKey,
    itemBuilder: (BuildContext context, int index) => const SizedBox(height: 10.0),
    itemCount: 5,
    onReorder: (int oldIndex, int newIndex) {
       // ...
    },
  );
}

// ...

void _stop() {
  listKey.currentState!.cancelReorder();
}
```

### 类CustomScrollView

#### 继承关系

```dart
//继承父类-Inheritance
Object 
DiagnosticableTree 
Widget 
StatelessWidget 
ScrollView 
CustomScrollView
```

#### 构造函数

```dart
CustomScrollView({
  Key? key, 
  Axis scrollDirection = Axis.vertical, 
  bool reverse = false, 
  ScrollController? controller, 
  bool? primary, 
  ScrollPhysics? physics, 
  ScrollBehavior? scrollBehavior, 
  bool shrinkWrap = false, 
  Key? center, 
  double anchor = 0.0, 
  double? cacheExtent, 
  List<Widget> slivers = const <Widget>[], 
  int? semanticChildCount, 
  DragStartBehavior dragStartBehavior = DragStartBehavior.start, 
  //滑动时关闭键盘,manual为不关闭
  ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual, 
  String? restorationId, 
  Clip clipBehavior = Clip.hardEdge
})
```

### 类NestedScrollView

#### 构造函数

```dart
NestedScrollView({
  Key? key, 
  ScrollController? controller, 
  Axis scrollDirection = Axis.vertical, 
  bool reverse = false, ScrollPhysics? physics, 
  required NestedScrollViewHeaderSliversBuilder headerSliverBuilder, 
  required Widget body, 
  DragStartBehavior dragStartBehavior = DragStartBehavior.start, 
  bool floatHeaderSlivers = false, 
  Clip clipBehavior = Clip.hardEdge, 
  String? restorationId, 
  ScrollBehavior? scrollBehavior
})
```



### 参考文档

[官方文档SliverList](https://api.flutter.dev/flutter/widgets/SliverList-class.html)

[官方CustomScrollView](https://api.flutter.dev/flutter/widgets/CustomScrollView-class.html)

官方文档SliverChildDelegate

[官方文档SliverChildListDelegate](https://api.flutter.dev/flutter/widgets/SliverChildListDelegate-class.html)

[Flutter - 按部就班 Sliver](http://www.javashuo.com/article/p-ckjnkfgn-cg.html)

[Flutter Sliver系列组件入门](https://blog.csdn.net/jdsjlzx/article/details/122560950)

[官方文档NestedScrollView](https://api.flutter.dev/flutter/widgets/NestedScrollView-class.html)

[Flutter 扩展NestedScrollView （一）Pinned头引起的bug解决](https://juejin.cn/post/6844903713887240206)

[Flutter 重识 NestedScrollView](https://juejin.cn/post/6997202342655311879#heading-26)

[Flutter Sliver 锁住你的美](https://juejin.cn/post/6861798947208953863)

[干货 | Flutter 控件 CustomScrollView 原理解析及应用实践](https://www.infoq.cn/article/Uz3HblaD0EGuBEZrGShk)
