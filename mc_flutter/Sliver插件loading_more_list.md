### <u>类LoadingMoreList<T></u>

#### 构造函数

```dart
LoadingMoreList(
	ListConfig<T> listConfig, {
    Key? key, 
    NotificationListenerCallback<ScrollNotification>? onScrollNotification
  })
```

### 类ListConfig<T>

#### 构造函数

```dart
ListConfig({
  required LoadingMoreItemBuilder<T> itemBuilder, 
  required LoadingMoreBase<T> sourceList, 
  bool showGlowLeading = true, 
  bool showGlowTrailing = true, 
  LoadingMoreIndicatorBuilder? indicatorBuilder, 
  SliverGridDelegate? gridDelegate, 
  Axis scrollDirection = Axis.vertical, 
  bool reverse = false, 
  ScrollController? controller, 
  bool? primary, ScrollPhysics? physics, 
  bool shrinkWrap = false, 
  EdgeInsetsGeometry padding = const EdgeInsets.all(0.0), 
  double? itemExtent, int? itemCount, 
  bool addAutomaticKeepAlives = true, 
  bool addRepaintBoundaries = true, 
  bool addSemanticIndexes = true, 
  double? cacheExtent, 
  int? semanticChildCount, 
  bool autoLoadMore = true, ExtendedListDelegate? extendedListDelegate, LastChildLayoutType lastChildLayoutType = LastChildLayoutType.foot, 
  bool autoRefresh = true, 
  int itemCountBuilder(int count)?, 
  DragStartBehavior dragStartBehavior = DragStartBehavior.start, 
  ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual, 
  String? restorationId, Clip clipBehavior = Clip.hardEdge, 
  int getActualIndex(int int)?
})
```

### <u>类LoadingMoreCustomScrollView</u>

#### 构造函数

```dart
LoadingMoreCustomScrollView({
  Key? key, Axis scrollDirection = Axis.vertical, 
  bool reverse = false, 
  ScrollController? controller, 
  bool? primary, 
  ScrollPhysics? physics, 
  bool shrinkWrap = false, 
  double? cacheExtent, 
  List<Widget> slivers = const <Widget>[], int? semanticChildCount, 
  bool showGlowLeading = true, 
  bool showGlowTrailing = true, NotificationListenerCallback<ScrollNotification>? onScrollNotification, 
  DragStartBehavior dragStartBehavior = DragStartBehavior.start, 
  ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual, 
  String? restorationId, 
  Clip clipBehavior = Clip.hardEdge, 
  List<SliverListConfig>? configs, 
  double preloadExtent = 0
})
```

### <u>类WaterfallFlow</u>

构造函数

```dart
WaterfallFlow({Key? key, Axis scrollDirection = Axis.vertical, bool reverse = false, ScrollController? controller, bool? primary, ScrollPhysics? physics, bool shrinkWrap = false, EdgeInsetsGeometry? padding, required SliverWaterfallFlowDelegate gridDelegate, bool addAutomaticKeepAlives = true, bool addRepaintBoundaries = true, bool addSemanticIndexes = true, double? cacheExtent, List<Widget> children = const <Widget>[], int? semanticChildCount, DragStartBehavior dragStartBehavior = DragStartBehavior.start, ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual, String? restorationId, Clip clipBehavior = Clip.hardEdge})
```

命名构造

```dart
WaterfallFlow.builder({Key? key, Axis scrollDirection = Axis.vertical, bool reverse = false, ScrollController? controller, bool? primary, ScrollPhysics? physics, bool shrinkWrap = false, EdgeInsetsGeometry? padding, required SliverWaterfallFlowDelegate gridDelegate, required IndexedWidgetBuilder itemBuilder, int? itemCount, bool addAutomaticKeepAlives = true, bool addRepaintBoundaries = true, bool addSemanticIndexes = true, double? cacheExtent, int? semanticChildCount, DragStartBehavior dragStartBehavior = DragStartBehavior.start, ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual, String? restorationId, Clip clipBehavior = Clip.hardEdge})
```

命名构造

```dart
WaterfallFlow.count({Key? key, Axis scrollDirection = Axis.vertical, bool reverse = false, ScrollController? controller, bool? primary, ScrollPhysics? physics, bool shrinkWrap = false, EdgeInsetsGeometry? padding, required int crossAxisCount, double mainAxisSpacing = 0.0, double crossAxisSpacing = 0.0, bool addAutomaticKeepAlives = true, bool addRepaintBoundaries = true, bool addSemanticIndexes = true, double? cacheExtent, List<Widget> children = const <Widget>[], int? semanticChildCount, DragStartBehavior dragStartBehavior = DragStartBehavior.start, ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual, LastChildLayoutTypeBuilder? lastChildLayoutTypeBuilder, CollectGarbage? collectGarbage, ViewportBuilder? viewportBuilder, bool closeToTrailing = false, String? restorationId, Clip clipBehavior = Clip.hardEdge})
```

构造函数

```
WaterfallFlow.custom({Key? key, Axis scrollDirection = Axis.vertical, bool reverse = false, ScrollController? controller, bool? primary, ScrollPhysics? physics, bool shrinkWrap = false, EdgeInsetsGeometry? padding, required SliverWaterfallFlowDelegate gridDelegate, required SliverChildDelegate childrenDelegate, double? cacheExtent, int? semanticChildCount, DragStartBehavior dragStartBehavior = DragStartBehavior.start, ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual, String? restorationId, Clip clipBehavior = Clip.hardEdge})
```

构造函数

```dart
WaterfallFlow.extent({Key? key, Axis scrollDirection = Axis.vertical, bool reverse = false, ScrollController? controller, bool? primary, ScrollPhysics? physics, bool shrinkWrap = false, EdgeInsetsGeometry? padding, required double maxCrossAxisExtent, double mainAxisSpacing = 0.0, double crossAxisSpacing = 0.0, bool addAutomaticKeepAlives = true, bool addRepaintBoundaries = true, bool addSemanticIndexes = true, List<Widget> children = const <Widget>[], int? semanticChildCount, DragStartBehavior dragStartBehavior = DragStartBehavior.start, ScrollViewKeyboardDismissBehavior keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual, LastChildLayoutTypeBuilder? lastChildLayoutTypeBuilder, CollectGarbage? collectGarbage, ViewportBuilder? viewportBuilder, bool closeToTrailing = false, String? restorationId, Clip clipBehavior = Clip.hardEdge})
```

### <u>类SliverWaterfallFlow</u>

构造函数

```dart
SliverWaterfallFlow({Key? key, required SliverChildDelegate delegate, required SliverWaterfallFlowDelegate gridDelegate})
```

命名构造

```dart
SliverWaterfallFlow.count({Key? key, required int crossAxisCount, double mainAxisSpacing = 0.0, double crossAxisSpacing = 0.0, List<Widget> children = const <Widget>[], LastChildLayoutTypeBuilder? lastChildLayoutTypeBuilder, CollectGarbage? collectGarbage, ViewportBuilder? viewportBuilder, bool closeToTrailing = false})
```

命名构造

```dart
SliverWaterfallFlow.extent({Key? key, required double maxCrossAxisExtent, double mainAxisSpacing = 0.0, double crossAxisSpacing = 0.0, List<Widget> children = const <Widget>[], LastChildLayoutTypeBuilder? lastChildLayoutTypeBuilder, CollectGarbage? collectGarbage, ViewportBuilder? viewportBuilder, bool closeToTrailing = false})
```

### 类SliverWaterfallFlowDelegate

#### 继承关系

```dart
//继承父类-Inheritance
Object ExtendedListDelegate SliverWaterfallFlowDelegate
//子类继承-Implementers
SliverWaterfallFlowDelegateWithFixedCrossAxisCount
SliverWaterfallFlowDelegateWithMaxCrossAxisExtent
```

#### 构造函数

```dart
SliverWaterfallFlowDelegate({double mainAxisSpacing = 0.0, double crossAxisSpacing = 0.0, LastChildLayoutTypeBuilder? lastChildLayoutTypeBuilder, CollectGarbage? collectGarbage, ViewportBuilder? viewportBuilder, bool closeToTrailing = false})
```



### 类SliverWaterfallFlowDelegateWithFixedCrossAxisCount

#### 继承关系

```dart
//继承父类-Inheritance
Object 
  ExtendedListDelegate 
  SliverWaterfallFlowDelegate 
  SliverWaterfallFlowDelegateWithFixedCrossAxisCount
```

构造函数

```dart
SliverWaterfallFlowDelegateWithFixedCrossAxisCount({
  required int crossAxisCount, 
  double mainAxisSpacing = 0.0, 
  double crossAxisSpacing = 0.0, 
  LastChildLayoutTypeBuilder? lastChildLayoutTypeBuilder, 
  CollectGarbage? collectGarbage, 
  ViewportBuilder? viewportBuilder, 
  bool closeToTrailing = false
})
```

### 类SliverWaterfallFlowDelegateWithMaxCrossAxisExtent

构造函数

```dart
SliverWaterfallFlowDelegateWithMaxCrossAxisExtent({
  required double maxCrossAxisExtent, 
  double mainAxisSpacing = 0.0, 
  double crossAxisSpacing = 0.0, 
  LastChildLayoutTypeBuilder? lastChildLayoutTypeBuilder, 
  CollectGarbage? collectGarbage, 
  ViewportBuilder? viewportBuilder, 
  bool closeToTrailing = false
})
```

### 枚举LastChildLayoutType

```
none → const LastChildLayoutType

fullCrossAxisExtent → const LastChildLayoutType

foot → const LastChildLayoutType
```

### 类LoadingMoreBase<T>

#### 常用成员

```dart
first ↔ T
//read / writeinherited

hasError → bool
//read-only
hashCode → int
//read-onlyinherited
  
hasMore → bool
//read-only
  
indicatorStatus ↔ IndicatorStatus
//read / write
  
isEmpty → bool
//read-onlyinherited
  
isLoading ↔ bool
//read / write
  
isNotEmpty → bool
//read-onlyinherited
  
iterator → Iterator<T>
//read-onlyinherited
  
last ↔ T
//read / writeinherited
  
length ↔ int
//read / writeoverride
  
rebuild → Stream<LoadingMoreBase<T>>
//read-onlyinherited
  
reversed → Iterable<T>
//read-onlyinherited

runtimeType → Type
//read-onlyinherited
  
single → T
```

#### 常用方法

```dart
add(T element) → void
  
addAll(Iterable<T> iterable) → void
  
any(bool test(T element)) → bool

asMap() → Map<int, T>

cast<R>() → List<R>

clear() → void

contains(Object? element) → bool

dispose() → void

elementAt(int index) → T

errorRefresh() → Future<bool>

every(bool test(T element)) → bool

expand<T>(Iterable<T> f(T element)) → Iterable<T>

fillRange(int start, int end, [T? fill]) → void

firstWhere(bool test(T element), {T orElse()?}) → T

fold<T>(T initialValue, T combine(T previousValue, T element)) → T

followedBy(Iterable<T> other) → Iterable<T>

forEach(void action(T element)) → void

getRange(int start, int end) → Iterable<T>

indexOf(Object? element, [int start = 0]) → int

indexWhere(bool test(T element), [int start = 0]) → int

insert(int index, T element) → void

insertAll(int index, Iterable<T> iterable) → void

join([String separator = ""]) → String

lastIndexOf(Object? element, [int? start]) → int

lastIndexWhere(bool test(T element), [int? start]) → int

lastWhere(bool test(T element), {T orElse()?}) → T

loadData([bool isloadMoreAction = false]) → Future<bool>
  
loadMore() → Future<bool>
  
map<T>(T f(T element)) → Iterable<T>

noSuchMethod(Invocation invocation) → dynamic

onStateChanged(LoadingMoreBase<T> source) → void
  
reduce(T combine(T previousValue, T element)) → T

refresh([bool notifyStateChanged = false]) → Future<bool>

remove(Object? element) → bool

removeAt(int index) → T

removeLast() → T

removeRange(int start, int end) → void

removeWhere(bool test(T element)) → void

replaceRange(int start, int end, Iterable<T> newContents) → void

retainWhere(bool test(T element)) → void

setAll(int index, Iterable<T> iterable) → void

setRange(int start, int end, Iterable<T> iterable, [int skipCount = 0]) → void

setState() → void

shuffle([Random? random]) → void

singleWhere(bool test(T element), {T orElse()?}) → T

skip(int count) → Iterable<T>

skipWhile(bool test(T element)) → Iterable<T>

sort([int compare(T a, T b)?]) → void

sublist(int start, [int? end]) → List<T>

take(int count) → Iterable<T>

takeWhile(bool test(T element)) → Iterable<T>

toList({bool growable = true}) → List<T>

toSet() → Set<T>

toString() → String

where(bool test(T element)) → Iterable<T>

whereType<T>() → Iterable<T>

```

### 枚举类IndicatorStatus

```
none → const IndicatorStatus
loadingMoreBusying → const IndicatorStatus
fullScreenBusying → const IndicatorStatus
error → const IndicatorStatus
fullScreenError → const IndicatorStatus
noMoreLoad → const IndicatorStatus
empty → const IndicatorStatus
values → const List<IndicatorStatus>
```

### 类EmptyWidget

```
EmptyWidget(String msg, {Widget? emptyWidget})
```

### 预定义

```
CollectGarbage = void Function(List<int> garbages)

LastChildLayoutTypeBuilder = LastChildLayoutType Function(int index)

LoadingMoreIndicatorBuilder = Widget? Function(BuildContext context, IndicatorStatus status)

LoadingMoreItemBuilder<T> = Widget Function(BuildContext context, T item, int index)

PaintExtentOf = double Function(RenderBox? child)

ViewportBuilder = void Function(int firstIndex, int lastIndex)
```

### 参考文档

[官方文档loading_more_list](https://pub.flutter-io.cn/documentation/loading_more_list/latest/loading_more_list/loading_more_list-library.html)