/*
 * create by zhangchunhua
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_util/refresh/pull_refresh/refresh.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

Widget pullRefreshListWidget(
  BuildContext context, {
  required RefreshController controller,
  required IndexedWidgetBuilder itemBuilder,
  required int itemCount,
  bool enablePullUp = true,
  bool enablePullDown = true,
  bool shrinkWrap = true,
  bool isStartWhiteTheme = false,
  List<Widget>? children,
  VoidCallback? onRefresh,
  VoidCallback? onLoading,
  EdgeInsetsGeometry? padding,
  Widget? header,
  Widget? footer,
  Widget? placeholder,
  ScrollPhysics? physics,
}) {
  return AnimationLimiter(
    child: SmartRefresher(
      header: header ??
          ClassicHeader(
            releaseText: '松开刷新',
            refreshingText: '正在刷新...',
            completeText: '刷新成功',
            failedText: '刷新失败',
            idleText: '下拉刷新',
            completeDuration: const Duration(milliseconds: 300),
            refreshingIcon: refresherLoadingWidget(isStartWhiteTheme: isStartWhiteTheme),
            textStyle: TextStyle(color: isStartWhiteTheme ? Colors.white : Colors.grey),
            idleIcon: Icon(Icons.arrow_downward, color: isStartWhiteTheme ? Colors.white : Colors.grey),
            failedIcon: Icon(Icons.error, color: isStartWhiteTheme ? Colors.white : Colors.grey),
            completeIcon: Icon(Icons.done, color: isStartWhiteTheme ? Colors.white : Colors.grey),
            releaseIcon: Icon(Icons.refresh, color: isStartWhiteTheme ? Colors.white : Colors.grey),
          ),
      footer: footer ??
          ClassicFooter(
            loadingText: '正在加载...',
            noDataText: '暂无更多',
            idleText: '加载更多',
            failedText: '加载失败',
            canLoadingText: '松开加载更多',
            loadingIcon: refresherLoadingWidget(isStartWhiteTheme: isStartWhiteTheme),
            textStyle: TextStyle(color: isStartWhiteTheme ? Colors.white : Colors.grey),
            idleIcon: Icon(Icons.arrow_downward, color: isStartWhiteTheme ? Colors.white : Colors.grey),
            failedIcon: Icon(Icons.error, color: isStartWhiteTheme ? Colors.white : Colors.grey),
          ),
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      controller: controller,
      onRefresh: onRefresh,
      onLoading: onLoading,
      child: ListView.builder(
        shrinkWrap: shrinkWrap,
        padding: padding,
        itemBuilder: itemCount != 0 ? itemBuilder : (context, index) => placeholder ?? listEmptyItemWidget(context, onRefresh),
        itemCount: itemCount == 0 ? 1 : itemCount,
        physics: physics,
      ),
    ),
  );
}

Widget listEmptyItemWidget(BuildContext context, VoidCallback? onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: IntrinsicHeight(
        child: Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          // Image.asset(
          //   "assets/images/img_empty.png",
          //   fit: BoxFit.fill,
          //   width: 150,
          // ),
          const SizedBox(height: 10),
          SizedBox(
            width: 1.sw,
            child: const Center(
              child: Text('暂无内容', style: TextStyle(color: Color(0xffCCCCCC), fontSize: 15)),
            ),
          ),
        ],
      ),
    )),
  );
}

Widget refresherLoadingWidget({required bool isStartWhiteTheme}) {
  return SizedBox(
    width: 25,
    height: 25,
    child: SpinKitFadingCircle(
      color: isStartWhiteTheme ? Colors.white : const Color(0xff696969),
      size: 25.0,
    ),
  );
}

Widget pullRefreshGridWidget(
  BuildContext context, {
  required RefreshController controller,
  required int itemCount,
  required int columnCount,
  required IndexedWidgetBuilder itemBuilder,
  double itemAspectRatio = 1.0,
  double crossAxisSpacing = 2.0,
  double mainAxisSpacing = 2.0,
  bool enablePullUp = false,
  bool enablePullDown = true,
  bool shrinkWrap = true,
  bool isStartWhiteTheme = false,
  List<Widget>? children,
  VoidCallback? onRefresh,
  VoidCallback? onLoading,
  EdgeInsetsGeometry? padding,
  Widget? header,
  Widget? footer,
  Widget? placeholder,
  ScrollPhysics? physics,
}) {
  return AnimationLimiter(
    child: SmartRefresher(
      header: header ??
          ClassicHeader(
            releaseText: '松开刷新',
            refreshingText: '正在刷新...',
            completeText: '刷新成功',
            failedText: '刷新失败',
            idleText: '下拉刷新',
            completeDuration: const Duration(milliseconds: 300),
            refreshingIcon: refresherLoadingWidget(isStartWhiteTheme: isStartWhiteTheme),
            textStyle: TextStyle(color: isStartWhiteTheme ? Colors.white : Colors.grey),
            idleIcon: Icon(Icons.arrow_downward, color: isStartWhiteTheme ? Colors.white : Colors.grey),
            failedIcon: Icon(Icons.error, color: isStartWhiteTheme ? Colors.white : Colors.grey),
            completeIcon: Icon(Icons.done, color: isStartWhiteTheme ? Colors.white : Colors.grey),
            releaseIcon: Icon(Icons.refresh, color: isStartWhiteTheme ? Colors.white : Colors.grey),
          ),
      footer: footer ??
          ClassicFooter(
            loadingText: '正在加载...',
            noDataText: '没有更多数据',
            idleText: '加载更多',
            failedText: '加载失败',
            canLoadingText: '松开加载更多',
            loadingIcon: refresherLoadingWidget(isStartWhiteTheme: isStartWhiteTheme),
            textStyle: TextStyle(color: isStartWhiteTheme ? Colors.white : Colors.grey),
            idleIcon: Icon(Icons.arrow_downward, color: isStartWhiteTheme ? Colors.white : Colors.grey),
            failedIcon: Icon(Icons.error, color: isStartWhiteTheme ? Colors.white : Colors.grey),
          ),
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      controller: controller,
      onRefresh: onRefresh,
      onLoading: onLoading,
      child: GridView.count(
        crossAxisSpacing: crossAxisSpacing,
        childAspectRatio: itemAspectRatio,
        crossAxisCount: columnCount,
        mainAxisSpacing: mainAxisSpacing,
        children: List.generate(itemCount, (idx) {
          return AnimationConfiguration.staggeredGrid(
            position: idx,
            columnCount: columnCount,
            duration: const Duration(milliseconds: 450),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: itemBuilder(context, idx),
              ),
            ),
          );
        }),
      ),
    ),
  );
}

Widget pullRefreshWaterfall(
  BuildContext context, {
  required RefreshController controller,
  required IndexedWidgetBuilder itemBuilder,
  required int itemCount,
  bool enablePullUp = true,
  bool enablePullDown = true,
  bool shrinkWrap = true,
  bool isStartWhiteTheme = false,
  List<Widget>? children,
  VoidCallback? onRefresh,
  VoidCallback? onLoading,
  EdgeInsetsGeometry? padding,
  Widget? header,
  Widget? footer,
  Widget? placeholder,
  ScrollPhysics? physics,
  int crossAxisCount = 2,
  ScrollController? ctrlWaterfall,
}) {
  return AnimationLimiter(
    child: SmartRefresher(
      header: header ??
          ClassicHeader(
            releaseText: '松开刷新',
            refreshingText: '正在刷新...',
            completeText: '刷新成功',
            failedText: '刷新失败',
            idleText: '下拉刷新',
            completeDuration: const Duration(milliseconds: 300),
            refreshingIcon: refresherLoadingWidget(isStartWhiteTheme: isStartWhiteTheme),
            textStyle: TextStyle(color: isStartWhiteTheme ? Colors.white : Colors.grey),
            idleIcon: Icon(Icons.arrow_downward, color: isStartWhiteTheme ? Colors.white : Colors.grey),
            failedIcon: Icon(Icons.error, color: isStartWhiteTheme ? Colors.white : Colors.grey),
            completeIcon: Icon(Icons.done, color: isStartWhiteTheme ? Colors.white : Colors.grey),
            releaseIcon: Icon(Icons.refresh, color: isStartWhiteTheme ? Colors.white : Colors.grey),
          ),
      footer: footer ??
          ClassicFooter(
            loadingText: '正在加载...',
            noDataText: '', //'没有更多数据',
            idleText: '加载更多',
            failedText: '加载失败',
            canLoadingText: '松开加载更多',
            loadingIcon: refresherLoadingWidget(isStartWhiteTheme: isStartWhiteTheme),
            textStyle: TextStyle(color: isStartWhiteTheme ? Colors.white : Colors.grey),
            idleIcon: Icon(Icons.arrow_downward, color: isStartWhiteTheme ? Colors.white : Colors.grey),
            failedIcon: Icon(Icons.error, color: isStartWhiteTheme ? Colors.white : Colors.grey),
          ),
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp,
      controller: controller,
      onRefresh: onRefresh,
      onLoading: onLoading,
      child: WaterfallFlow.builder(
        controller: ctrlWaterfall,
        shrinkWrap: shrinkWrap,
        padding: padding,
        addRepaintBoundaries: false,
        itemBuilder: itemCount != 0 ? itemBuilder : (context, index) => placeholder ?? listEmptyItemWidget(context, onRefresh),
        itemCount: itemCount == 0 ? 1 : itemCount,
        physics: physics,
        gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount),
      ),
    ),
  );
}
