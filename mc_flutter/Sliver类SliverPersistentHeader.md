### 类SliverPersistentHeader

继承关系

```dart
//继承父类-Inheritance
Object 
DiagnosticableTree 
Widget 
StatelessWidget 
SliverPersistentHeader
```

构造函数

```dart
SliverPersistentHeader({
  Key? key, 
  required SliverPersistentHeaderDelegate delegate, 
  bool pinned = false, 
  bool floating = false
})
```

### 抽象类类SliverPersistentHeaderDelegate

#### 固定在顶部

```dart
import 'dart:math';

import 'package:flutter/material.dart';

class PinnedSliverDelegate extends SliverPersistentHeaderDelegate {
  PinnedSliverDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight; //最小高度
  final double maxHeight; //最大高度
  final Widget child; //子Widget布局

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override //是否需要重建
  bool shouldRebuild(PinnedSliverDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}
```

#### 固定TabBar

```dart
//自定义SliverPersistentHeaderDelegate
import 'package:flutter/material.dart';

class TabBarSliverDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  TabBarSliverDelegate(this.tabBar, {this.color, this.margin});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: color,
      margin: margin ?? EdgeInsets.symmetric(horizontal: 10),
      child: tabBar,
    );
  }
  @override
  double get maxExtent => tabBar.preferredSize.height;
  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  bool shouldRebuild(TabBarSliverDelegate oldDelegate) {
    return false;
  }
}
```

#### 标题从无到有

```dart
class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double collapsedHeight;
  final double expandedHeight;
  final double paddingTop;
  final String coverImgUrl;
  final String title;
 
  SliverCustomHeaderDelegate({
    this.collapsedHeight,
    this.expandedHeight,
    this.paddingTop,
    this.coverImgUrl,
    this.title,
  });
 
  @override
  double get minExtent => this.collapsedHeight + this.paddingTop;
 
  @override
  double get maxExtent => this.expandedHeight;
 
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
 
  Color makeStickyHeaderBgColor(shrinkOffset) {
    final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255).clamp(0, 255).toInt();
    return Color.fromARGB(alpha, 255, 255, 255);
  }
 
  Color makeStickyHeaderTextColor(shrinkOffset, isIcon) {
    if(shrinkOffset <= 50) {
      return isIcon ? Colors.white : Colors.transparent;
    } else {
      final int alpha = (shrinkOffset / (this.maxExtent - this.minExtent) * 255).clamp(0, 255).toInt();
      return Color.fromARGB(alpha, 0, 0, 0);
    }
  }
 
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: this.maxExtent,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // 背景图
          Container(child: Image.network(this.coverImgUrl, fit: BoxFit.cover)),
          // 收起头部
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              color: this.makeStickyHeaderBgColor(shrinkOffset),    // 背景颜色
              child: SafeArea(
                bottom: false,
                child: Container(
                  height: this.collapsedHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: this.makeStickyHeaderTextColor(shrinkOffset, true),    // 返回图标颜色
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      Text(
                        this.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: this.makeStickyHeaderTextColor(shrinkOffset, false),   // 标题颜色
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: this.makeStickyHeaderTextColor(shrinkOffset, true),    // 分享图标颜色
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
```

#### 效果图

![img](http://qiniu-article.myflutter.cn/img/11db5f158c1b67617719e5dad8bd8220.gif)


### 参考文档

[Flutter Sliver系列组件入门](https://blog.csdn.net/jdsjlzx/article/details/122560950)