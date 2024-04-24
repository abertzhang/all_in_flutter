import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_util/upgrade_get/upgrade_get.dart';
import 'package:get/get.dart';

class UpgradeDialog extends Dialog {
  final _controller = Get.put(UpgradeLogic());

  UpgradeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Material(
          type: MaterialType.transparency,
          child: Center(
            child: SizedBox(
              width: 0.8.sw,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/bg_update_top.png', fit: BoxFit.contain),
                  Obx(
                    () {
                      if (_controller.download.isTrue) {
                        return _buildProgressView();
                      }
                      return _buildContentView();
                    },
                  )
                  // _buildContentView()
                ],
              ),
            ),
          ),
        ),
        onWillPop: () {
          if (_controller.bean?.is_force_update == 1) {
            return Future.value(false);
          }
          Get.back();
          return Future.value(true);
        });
  }

  _buildContentView() {
    return Column(
      children: [
        Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            // constraints: const BoxConstraints(
            //   minHeight: 80,
            // ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '是否升级到${_controller.bean?.versionName ?? '0.0.0'}新版本？',
                  style: const TextStyle(fontSize: 15, color: Color(0xFF333333), fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                // Text(
                //   '新版本大小：${DirUtil.renderSizeMinK(_controller.appSize)}',
                //   style: const TextStyle(fontSize: 14, color: Color(0xFF333333), height: 2.0, letterSpacing: 0.4),
                // ),
                Text(
                  _controller.bean?.modifyContent ?? "",
                  style: const TextStyle(fontSize: 14, color: Color(0xFF333333), height: 1.5, letterSpacing: 0.4),
                ),
              ],
            )),
        Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          // decoration: const BoxDecoration(
          //   color: Colors.white,
          //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
          // ),
          child: _buildButton(),
        ),
      ],
    );
  }

  // 进度条样式
  _buildProgressView() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LineGradientProgress(
            width: 1.sw,
            height: 50,
            bgColor: const Color(0xFFE8E8E8),
            colors: const [Color(0xFF7CB4F7), Color(0xFF1E88FF)],
            progress: _controller.progress.value,
            fontColor: Colors.white,
            fontSize: 12,
            content: '%',
            inside: true,
            animation: false,
          ),
          const SizedBox(height: 10),
          const Text(
            '版本正在努力更新中，请稍后',
            style: TextStyle(color: Color(0xFF666666), fontSize: 13),
          ),
        ],
      ),
    );
  }

  // 底部按钮
  _buildButton() {
    // 强制升级
    if (_controller.bean?.is_force_update == 1) {
      return Row(
        children: [
          InkWell(
            onTap: () => exit(0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              margin: EdgeInsets.only(left: 16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Color(0xFF757575), width: 0.5),
              ),
              child: Text('取消升级', style: TextStyle(color: const Color(0xFF999999), fontSize: 15.sp)),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () => _controller.downLoadApp(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              margin: EdgeInsets.only(right: 16.w),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                  // border: Border.all(color: Color(0xFF757575), width: 0.5),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF00FBFF), Color(0xFF00D4D7)],
                  )),
              child: Text('我要升级', style: TextStyle(color: const Color(0xFF333333), fontSize: 15.sp)),
            ),
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => _controller.ignorePop(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            margin: EdgeInsets.only(left: 16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Color(0xFF757575), width: 0.5),
            ),
            child: Text('暂不升级', style: TextStyle(color: const Color(0xFF999999), fontSize: 15.sp)),
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () => _controller.downLoadApp(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            margin: EdgeInsets.only(right: 16.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF00FBFF), Color(0xFF00D4D7)],
                )),
            child: Text('我要升级', style: TextStyle(color: const Color(0xFF333333), fontSize: 15.sp)),
          ),
        ),
      ],
    );
  }
}
