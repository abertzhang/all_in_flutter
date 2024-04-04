import 'package:flutter_util/refresh/easy_refresh_v3/easy_refresh.dart';

void main() => runApp(MaterialApp(home: HomePage()));

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final logic = Get.put(HomeLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return GetBuilder<HomeLogic>(builder: (logic) {
      return EasyRefresh(
        header: refreshHeader,
        footer: refreshFooter,
        //加载动画弹簧效果设置,stiffness表示回弹速度刚度,damping表示阻尼可以反弹弹簧效果,越大越慢
        spring: const SpringDescription(mass: 0.1, stiffness: 100, damping: 10),
        // spring: SpringDescription.withDampingRatio(mass: 0.2, stiffness: 0.1, ratio: 0.5),
        //下拉或上推header高度
        frictionFactor: (fraction) => 0.3,
        //
        notRefreshHeader: const NotRefreshHeader(),
        notLoadFooter: const NotLoadFooter(),
        //同时触发刷新和加载的回调函数
        simultaneously: true,
        // canRefreshAfterNoMore: true,
        // canLoadAfterNoMore: true,
        //刷新完成后重置刷新状态
        resetAfterRefresh: true,
        //在开始刷新是立即触发刷新
        refreshOnStart: true,
        refreshOnStartHeader: refreshHeader,
        callRefreshOverOffset: 50,
        callLoadOverOffset: 50,
        fit: StackFit.expand,
        clipBehavior: Clip.antiAlias,
        // scrollBehaviorBuilder: (physics) => const CupertinoScrollBehavior(),
        scrollController: ScrollController(),
        triggerAxis: Axis.vertical,
        // onRefresh: logic.onRefresh,
        // onLoad: logic.onLoad,
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          logic.ctrlRefresh.finishRefresh();
          logic.ctrlRefresh.resetFooter();
          logic.update();
        },
        onLoad: () async {
          if (logic.pageNum < logic.pageTotal) {
            logic.pageNum++;
          }
          await Future.delayed(const Duration(seconds: 10));
          logic.ctrlRefresh.finishLoad(IndicatorResult.noMore, true);
          // logic.ctrlRefresh.finishLoad(
          //   logic.pageNum >= logic.pageTotal ? IndicatorResult.noMore : IndicatorResult.success,
          // );
          // logic.update();
        },
        child: ListView.builder(
          itemCount: logic.beans.length,
          itemBuilder: (ctx, idx) {
            return ListTile(
              leading: Text('数据第$idx条,当前页${logic.pageNum},总页数${logic.pageTotal}'),
              subtitle: Text(logic.beans[idx]),
            );
          },
        ),
      );
    });
  }
}

///logic类
class HomeLogic extends EasyRefreshGetUpdate<String> {
  @override
  void onInit() {
    pageTotal = 2;
    super.onInit();
    beans = ['1', '2'];
  }

  @override
  Future onRefresh() async {
    pageNum = 1;
    beans = ['10', '152'];
    super.onRefresh();
  }

  @override
  Future onLoad() async {
    if (pageNum < pageTotal) {
      pageNum++;
      moreBeans = ['3', '5'];
    } else {
      moreBeans.clear();
    }
    super.onLoad();
  }
}

///

ClassicHeader get refreshHeader => ClassicHeader(
      dragText: '下拉刷新'.tr,
      armedText: '释放刷新'.tr,
      readyText: '加载中...'.tr,
      processingText: '加载中...'.tr,
      processedText: '加载完成'.tr,
      noMoreText: '没有更多'.tr,
      failedText: '加载失败'.tr,
      messageText: '最后更新于 %T'.tr,
      showMessage: false,
    );

ClassicFooter get refreshFooter => ClassicFooter(
      dragText: '上拉加载'.tr,
      armedText: '释放刷新'.tr,
      readyText: '加载中...'.tr,
      processingText: '加载中...'.tr,
      processedText: '加载完成'.tr,
      noMoreText: '已经到底啦~'.tr,
      failedText: '加载失败',
      messageText: '最后更新于 %T'.tr,
      showMessage: false, // 隐藏更新时间
    );
