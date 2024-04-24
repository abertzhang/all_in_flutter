import 'package:flustars_flutter3/flustars_flutter3.dart';

import '../http/http_util.dart';
import 'ali_bucket_bean.dart';

class AliOssApi {
  ///获取存储文件夹名
  Future<String?> getBucketFold({
    required String serviceKey,
    required String businessKey,
  }) async {
    Map<String, dynamic> params = {'serviceKey': serviceKey, 'businessKey': businessKey};
    return HttpUtil().get('/infrastructure/api/oss/store-dir', params: params).then((resp) {
      if (resp['code'] == '0' && resp['data'] != null) {
        return resp['data']['storeDir'] as String;
      }
      return null;
    }).catchError((onError) {
      // HMYEasyLoading.showInfo(onError.toString());
      return null;
    });
  }

  ///获取bucket信息---sts桶
  Future<AliBucketBean?> getBucketCredentials() async {
    return HttpUtil().get('/infrastructure/api/oss/credentials').then((resp) {
      if (resp['code'] == '0' && resp['data'] != null) {
        return JsonUtil.getObject(resp['data'], (map) => AliBucketBean.fromMap(map));
      }
      return null;
    }).catchError((onError) {
      // HMYEasyLoading.showInfo(onError.toString());
      return null;
    });
  }

  ///获取签名
  Future<AliBucketBean?> getBucketSignature({required String dir}) async {
    Map<String, dynamic> params = {'dir': dir};
    return HttpUtil().get('/infrastructure/api/oss/signature', params: params).then((resp) {
      if (resp['code'] == '0' && resp['data'] != null) {
        LogUtil.v('签名Map:${resp['data']}');
        return JsonUtil.getObject(resp['data'], (map) => AliBucketBean.fromMap(map));
      }
      return null;
    }).catchError((onError) {
      // HMYEasyLoading.showInfo(onError.toString());
      return null;
    });
  }
}
