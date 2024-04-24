import 'package:flutter_util/upgrade_get/upgrade_get.dart';
import 'package:get/get.dart';

class UpgradeLogic extends GetxController {
  bool ignoreVersion = false;

  // 下载标识
  final download = false.obs;
  final progress = 0.0.obs;

  UpdateBean? bean;
  double appSize = 0;
  int code = 0;

  @override
  void onInit() {
    super.onInit();
    bean = UpgradeUtil().bean;

    if (Platform.isIOS) {
      appSize = bean?.iosSize ?? 0;
      code = bean?.iosCode ?? 0;
    } else {
      appSize = bean?.apkSize ?? 0;
      code = bean?.versionCode ?? 0;

      RUpgrade.stream.listen((DownloadInfo info) {
        progress.value = info.percent! / 100;

        // if (bean?.is_force_update == 0 && info.status == DownloadStatus.STATUS_SUCCESSFUL) {
        if (info.status == DownloadStatus.STATUS_SUCCESSFUL) {
          Get.back();
        }
      });
    }
  }

  // 忽略此版本
  void ignorePop() async {
    if (code != 0) {
      SpUtil.putInt('key_ignore_code', code);
    }
    Get.back();
  }

  // 升级功能
  void downLoadApp() async {
    LogUtil.v(tag: "bean?.downloadUrl", bean?.downloadUrl);
    if (Platform.isIOS) {
      // IOS 直接跳转到APP Store
      bool ret = await RUpgrade.upgradeFromAppStore('64461923271212') ?? false;
      if (ret) Get.back();
    } else if (Platform.isAndroid) {
      RUpgrade.upgradeFromUrl(bean!.downloadUrl);
      return;
      if (ObjectUtil.isEmpty(bean?.downloadUrl)) return ToastUtil.toast("没有下载链接");
      bool auth = false; //await RequestPermission.checkStoragePermission();
      if (auth) {
        RUpgrade.upgrade(
          bean!.downloadUrl,
          fileName: 'nine_world.apk',
          useDownloadManager: false,
          // installType: RUpgradeInstallType.none,
          notificationStyle: NotificationStyle.speechAndPlanTime,
        );
        download.value = true;
        progress.value = 0;
      }
    }
  }
}
