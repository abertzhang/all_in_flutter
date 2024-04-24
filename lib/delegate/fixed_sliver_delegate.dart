/*
 * create by zhangchunhua
 */

//自定义SliverHeaderDelegate,用于固定资讯标题栏
import 'dart:math';

import 'package:flutter/material.dart';

class FixedSliverDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;
  FixedSliverDelegate({required this.minHeight, required this.maxHeight, required this.child});
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: maxHeight,
      child: child,
      // margin: EdgeInsets.symmetric(horizontal: 10),
      // decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(6))),
    );
  }

  @override
  bool shouldRebuild(FixedSliverDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }

  @override
  double get maxExtent => max(maxHeight, minHeight);
  @override
  double get minExtent => min(maxHeight, minHeight);
}

//自定义SliverPersistentHeaderDelegate
class FixedTabSliverDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final Color? color;

  FixedTabSliverDelegate(this.tabBar, {this.color}) : assert(tabBar != null);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(child: tabBar, color: color);
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(FixedTabSliverDelegate oldDelegate) {
    return false;
  }
}
