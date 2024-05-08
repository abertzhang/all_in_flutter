import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:r_upgrade/r_upgrade.dart';

import '../../../utils/utils.dart';
import '../model/update_bean.dart';
import '../upgrade_util.dart';

class UpgradeProvider extends ChangeNotifier {
  bool ignoreVersion = false;

  // 下载标识
  bool download = false;
  double progress = 0;

  UpdateBean? bean;
  double appSize = 0;
  int code = 0;

  BuildContext? _context;

  UpgradeProvider() {
    bean = UpgradeUtil.instance!.bean;

    if (Platform.isIOS) {
      appSize = bean?.iosSize ?? 0;
      code = bean?.iosCode ?? 0;
    } else {
      appSize = bean?.apkSize ?? 0;
      code = bean?.versionCode ?? 0;

      RUpgrade.stream.listen((DownloadInfo info) {
        progress = info.percent! / 100;
        notifyListeners();

        if (info.status == DownloadStatus.STATUS_SUCCESSFUL) {
          if (_context != null) {
            Navigator.of(_context!).pop();
          }
        }
      });
    }
  }

  // 忽略此版本
  void ignorePop(BuildContext context) async {
    if (code != 0) {
      SpUtil.putInt('key_ignore_code', code);
    }

    Navigator.of(context).pop();
  }

  // 升级功能
  void downLoadApp(BuildContext context) async {
    _context = context;

    if (Platform.isIOS) {
      // IOS 直接跳转到APP Store
      bool ret = await RUpgrade.upgradeFromAppStore(
            '15746970419',
          ) ??
          false;

      if (ret) {
        Navigator.of(context).pop();
      }
    } else if (Platform.isAndroid && !StringUtil.isEmpty(bean?.downloadUrl)) {
      await RUpgrade.upgrade(
        bean?.downloadUrl ?? '',
        fileName: 'wh_elder_service.apk',
        isAutoRequestInstall: true,
        notificationStyle: NotificationStyle.speechAndPlanTime,
      );

      download = true;
      progress = 0;
      notifyListeners();
    }
  }
}
