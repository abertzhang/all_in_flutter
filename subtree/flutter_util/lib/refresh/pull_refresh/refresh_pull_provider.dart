import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'bean.dart';

/// 上拉 下拉刷新 抽象类状态管理器 基类

abstract class RefreshPullProvider<T extends List<Bean>> extends ChangeNotifier {
  /// 当前页数
  int pageNum = 1;

  /// 一页显示的数量
  int pageSize = 10;

  /// 能否加载更多
  bool canLoadMore = true;

  /// 下拉控制器
  RefreshController? controller;

  /// 第一次加载
  bool isLoading = true;

  // 列表数据
  T? beans;
  T? moreBeans;

  @mustCallSuper
  RefreshPullProvider() {
    controller = RefreshController();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  // 上拉刷新
  @mustCallSuper
  void onRefresh() async {
    if (ObjectUtil.isEmpty(controller)) return;
    if (ObjectUtil.isNotEmpty(beans)) {
      canLoadMore = beans!.length >= pageSize;
      _refreshSuccess();
    } else {
      _refreshFailed();
    }

    isLoading = false;
    notifyListeners();
  }

  // 加载更多
  @mustCallSuper
  void onLoad() async {
    if (ObjectUtil.isEmpty(controller)) return;
    if (ObjectUtil.isNotEmpty(moreBeans)) {
      canLoadMore = moreBeans!.length >= pageSize;
      beans!.addAll(moreBeans!);
      _refreshSuccess();
    } else {
      _refreshFailed();
    }

    isLoading = false;
    notifyListeners();
  }

  // 刷新成功
  void _refreshSuccess() {
    if (controller!.isRefresh) {
      controller!.refreshCompleted(resetFooterState: canLoadMore);
    } else if (controller!.isLoading) {
      if (canLoadMore) {
        controller!.loadComplete();
      } else {
        controller!.loadNoData();
      }
    }
  }

  // 刷新失败
  void _refreshFailed() {
    if (controller!.isRefresh) {
      controller!.refreshCompleted();
    } else if (controller!.isLoading) {
      pageNum--;
      controller!.loadNoData();
    }
  }
}
