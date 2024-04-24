import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'http.dart';

/// response拦截器
class ResponseInterceptors extends Interceptor {
  @override
  onResponse(Response response, handler) async {
    try {
      ///token失效处理
      if (response.statusCode == 200) {
        if (HttpUtil().errTokenCode > 0) {
          int code = 0;
          if (response.data is String) {
            Map<String, dynamic> maps = json.decode(response.data);
            code = maps["code"];
          } else {
            code = response.data['code'];
          }

          if (code == HttpUtil().errTokenCode) {
            // ToastUtils.error('用户登录失效，请重新登录');
            // 延迟退出
            Future.delayed(const Duration(milliseconds: 500), () {
              // 退至登录页面
              // getUtil.Get.offAll(() => LoginPage(), transition: getUtil.Transition.rightToLeftWithFade);
            });

            return;
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        // print(e.toString(), tag: 'ResponseInterceptors');
        print(e.toString());
      }
    }

    return super.onResponse(response, handler);
  }
}
