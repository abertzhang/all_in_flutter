// 版本升级工具
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../utils/utils.dart';
import 'api/update_api.dart';
import 'model/update_bean.dart';
import 'widget/upgrade_dialog.dart';

class UpgradeUtil {
  static UpgradeUtil? _singleton;

  static UpgradeUtil? get instance => _getInstance();

  UpdateBean? bean;

  int buildCode = 0;

  // 静态、同步、私有访问点
  static UpgradeUtil? _getInstance() {
    if (_singleton == null) {
      _singleton = new UpgradeUtil._internal();
    }
    return _singleton;
  }

  UpgradeUtil._internal() {
    // 初始化
  }

  // 获取在线版本信息，并进行比较
  Future<bool> fetchUpdate(BuildContext context, bool ignore) async {
    bean = await UpdateApi.getUpdateInfo();
    PackageInfo info = await PackageInfo.fromPlatform();

    buildCode = NumUtil.getIntByValueStr(info.buildNumber) ?? 0;

    if (bean != null) {
      int code = Platform.isIOS ? bean!.iosCode! : bean!.versionCode!;

      if (buildCode < code && bean!.updateStatus != 0) {
        // 忽略版本
        if (ignore && code == SpUtil.getInt('key_ignore_code')) {
          return true;
        }

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return UpgradeDialog();
          },
        );

        return true;
      }
    }

    return false;
  }
}
