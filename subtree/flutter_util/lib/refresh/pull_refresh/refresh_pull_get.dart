import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'bean.dart';

/// 上拉 下拉刷新 抽象类状态管理器 基类

abstract class RefreshPullGet<T extends Bean> extends GetxController {
  /// 当前页数
  int pageNum = 1;

  /// 一页显示的数量
  int pageSize = 10;

  /// 能否加载更多
  bool canLoadMore = true;

  /// 下拉控制器
  RefreshController controller = RefreshController();

  /// 第一次加载
  final isLoading = true.obs;
  final isError = false.obs;

  // 列表数据
  final beans = <T>[].obs;
  final moreBeans = <T>[].obs;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // 上拉刷新
  void onRefresh() async {
    if (ObjectUtil.isNotEmpty(beans)) {
      canLoadMore = beans.length >= pageSize;
      refreshSuccess();
    } else {
      refreshEmpty();
    }

    isLoading.value = false;
  }

  // 加载更多
  @mustCallSuper
  void onLoad() async {
    if (ObjectUtil.isNotEmpty(moreBeans)) {
      canLoadMore = moreBeans.length >= pageSize;
      beans.addAll(moreBeans);
      refreshSuccess();
    } else {
      refreshEmpty();
    }

    isLoading.value = false;
  }

  // 刷新成功
  void refreshSuccess() {
    if (controller.isRefresh) {
      controller.refreshCompleted(resetFooterState: canLoadMore);
    } else if (controller.isLoading) {
      if (canLoadMore) {
        controller.loadComplete();
      } else {
        controller.loadNoData();
      }
    }
  }

  // 刷新失败
  void refreshEmpty() {
    if (controller.isRefresh) {
      controller.refreshCompleted();
    } else if (controller.isLoading) {
      pageNum--;
      controller.loadNoData();
    }
  }

  // 刷新失败
  void refreshFailed() {
    if (controller.isRefresh) {
      controller.refreshCompleted();
    } else if (controller.isLoading) {
      pageNum--;
      controller.loadFailed();
    }
  }
}
