### 类ExtendedSliverAppbar

```dart
ExtendedSliverAppbar({
  Widget? leading, 
  Widget? title, 
  Widget? actions, 
  Widget? background, 
  Color? toolBarColor, OnSliverPinnedPersistentHeaderDelegateBuild? onBuild, 
  double? statusbarHeight, 
  double? toolbarHeight, 
  bool isOpacityFadeWithToolbar = true, 
  bool isOpacityFadeWithTitle = true, 
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.spaceBetween, 
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center
})
```



### 类SliverPinnedPersistentHeader

```
SliverPinnedPersistentHeader({
required SliverPinnedPersistentHeaderDelegate delegate
})
```



### 类SliverPinnedToBoxAdapter

```
SliverPinnedToBoxAdapter({Key? key, Widget? child})
```



### 类SliverToNestedScrollBoxAdapter

```dart
SliverToNestedScrollBoxAdapter({
  Key? key, 
  Widget? child, 
  required double childExtent, 
  required ScrollOffsetChanged onScrollOffsetChanged
})
```



### 类SliverPinnedPersistentHeaderDelegate

```dart
SliverPinnedPersistentHeaderDelegate({
	required Widget minExtentProtoType, 
	required Widget maxExtentProtoType
})
```



### 预定义

```dart
OnSliverPinnedPersistentHeaderDelegateBuild = 
	void Function(BuildContext context, double shrinkOffset, 
                double? minExtent, double maxExtent, bool overlapsContent)
```

