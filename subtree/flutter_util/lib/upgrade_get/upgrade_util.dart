/*
 * create by chunhua.zhang
 */

import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../utils/utils.dart';
import 'update_api.dart';
import 'update_bean.dart';
import 'upgrade_dialog.dart';

class UpgradeUtil {
  UpgradeUtil._internal();

  static final UpgradeUtil _instance = UpgradeUtil._internal();

  factory UpgradeUtil() {
    return _instance;
  }

  UpdateBean? bean;

  int buildCode = 0;

  // 获取在线版本信息，并进行比较
  Future<bool> fetchUpdate({required bool ignore, bool needPrompt = false}) async {
    if (needPrompt) {
      // Get.dialog(LoadingDialog());
    }

    bean = await UpdateApi.getUpdateInfo();
    if (ObjectUtil.isEmpty(bean)) {
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
      if (needPrompt) ToastUtil.toast('无法获取线上版本信息！');
      return false;
    }
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
    bool update = await _getBuildCode(bean!, ignore);
    if (update) {
      await Get.dialog(UpgradeDialog(), barrierDismissible: false);
      return update;
    } else {
      if (needPrompt) ToastUtil.toast('当前已是最新版本！');
      return false;
    }
  }

  // 比较在线版本
  Future<bool> _getBuildCode(UpdateBean bean, bool ignore) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // 当前版本若高于或等于网上版本，则不进行比较
    int buildCode = int.parse(packageInfo.buildNumber);
    int webCode = bean.buildNum;
    if (buildCode >= webCode) return false;
    // 忽略版本，暂时取消这个忽略版本的功能，
    if (ignore && webCode == SpUtil.getInt('key_ignore_code')) return false;
    return true;
  }
}
