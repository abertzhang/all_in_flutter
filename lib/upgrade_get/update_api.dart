import 'package:flutter_util/upgrade_get/upgrade_get.dart';

class UpdateApi {
  // 获取最新app版本号
  static Future getUpdateInfo() {
    return HttpUtil().get('/api/common/official/start', baseUrl: '').then((response) {
      if (response['code'] == 200) {
        if (response['data'] != null) {
          return JsonUtil.getObjectList(response['data'], (v) => UpdateBean.fromMap(v))![Platform.isAndroid ? 0 : 1];
        }
        return null;
      }
      ToastUtil.toast(response['msg'].toString());
      return null;
    }).catchError((onError) {
      ToastUtil.error(onError.message);
      return null;
    });
  }
}
