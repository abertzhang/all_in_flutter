import 'package:flutter_util/http/http.dart';

import '../model/update_bean.dart';

class UpdateApi {
  // 获取最新app版本号
  static Future<UpdateBean?> getUpdateInfo() {
    return HttpUtil().get('/android/update.json', baseUrl: "http://yl.fhxynet.com").then((response) {
      if (response != null) {
        return JsonUtil.getObject(response, (v) => UpdateBean.fromMap(v));
      }

      return null;
    }).catchError((onError) {
      return null;
    });
  }
}
