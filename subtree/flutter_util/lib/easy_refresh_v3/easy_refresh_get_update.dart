/*
 * create by zhangchunhua
 * Email: z_chunhua@126.com
 */

import 'easy_refresh.dart';

abstract class EasyRefreshGetUpdate<T> extends GetxController {
  /// 当前页数
  int pageNum = 1;

  /// 一页显示的数量
  int pageSize = 10;

  /// 能否加载更多
  bool canLoadMore = true;

  ///总页数
  int pageTotal = 1;

  /// 下拉控制器
  EasyRefreshController ctrlRefresh = EasyRefreshController(
    controlFinishRefresh: true,
    controlFinishLoad: true,
  );

  /// 第一次加载
  bool isLoading = true;
  bool isErr = false;

  /// 列表数据
  List<T> beans = <T>[];
  List<T> moreBeans = <T>[];

  @override
  void dispose() {
    ctrlRefresh.dispose();
    super.dispose();
  }

  /// 下拉刷新
  @mustCallSuper
  Future onRefresh() async {
    ctrlRefresh.finishRefresh();
    ctrlRefresh.resetFooter();
    update();
  }

  /// 上拉加载更多
  @mustCallSuper
  Future onLoad() async {
    if (ObjectUtil.isNotEmpty(moreBeans)) {
      beans.addAll(moreBeans);
      moreBeans.clear();
    }
    ctrlRefresh.finishLoad(
      pageNum >= pageTotal ? IndicatorResult.noMore : IndicatorResult.success,
    );
    canLoadMore = pageNum < pageTotal;
    update();
  }
}
