import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_oss_aliyun/flutter_oss_aliyun.dart';

import 'ali_bucket_bean.dart';
import 'ali_oss_api.dart';

typedef UrlList = Function(List<String>);

class HMYOssStsUtil {
  factory HMYOssStsUtil() => _singleton;
  HMYOssStsUtil._();
  static final HMYOssStsUtil _singleton = HMYOssStsUtil._();
  static HMYOssStsUtil get to => _singleton;
  static final _api = AliOssApi();

  AliBucketBean bucketBean = AliBucketBean();
  late final String _bucketName = 'hmy-dev';
  late final String _ossEndpoint = 'oss-cn-hangzhou.aliyuncs.com';
  static const serviceKey = 'hmy-crm';
  static String? fileFold; //服务器文件夹
  static String? business; //业务编码

  ///初始化
  Future init({String businessKey = 'customer-id-card'}) async {
    if (business != businessKey || business == null) {
      business = businessKey;
      fileFold = await _api.getBucketFold(serviceKey: serviceKey, businessKey: businessKey);
    }
    LogUtil.v('文件夹:$fileFold');
    bucketBean = await getStsBucket() ?? AliBucketBean();
    Client.init(ossEndpoint: _ossEndpoint, bucketName: _bucketName, authGetter: _authGetter);
  }

  ///获取STS桶信息
  Future<AliBucketBean?> getStsBucket() async {
    return _api.getBucketCredentials();
  }

  ///获取授权
  FutureOr<Auth> _authGetter() async {
    return Auth(
      accessKey: bucketBean.accessKeyId ?? "",
      accessSecret: bucketBean.accessKeySecret ?? "",
      expire: bucketBean.expire ?? "",
      secureToken: bucketBean.securityToken ?? "",
    );
  }

  ///单个图片上传--Uint8List格式
  Future uploadImageUint8({
    required Uint8List fileData,
    required String fileKey,
    required ValueChanged<String?> callBack,
  }) async {
    await init(businessKey: 'customer-id-card');
    await Client().putObject(fileData, 'hmy-crm/CustomerIdCard/$fileKey').then((response) {
      final url = (response.realUri.toString());
      callBack.call(url);
    }).catchError((err) {
      // HMYEasyLoading.showToast(err.toString());
    });
  }

  ///多图上传--Uint8List格式
  Future uploadImagesByUint8({
    required List<Uint8List> fileDataList,
    required String fileKey,
    required UrlList callBack,
  }) async {
    List<AssetEntity> entityList = [];
    var option = PutRequestOption(
      onSendProgress: (count, total) {
        LogUtil.v("发送: count = $count, and total = $total");
      },
      onReceiveProgress: (count, total) {
        LogUtil.v("接受: count = $count, and total = $total");
      },
      aclModel: AclMode.private,
    );
    for (int i = 0; i < fileDataList.length; i++) {
      var entity = AssetEntity(filename: '${fileKey}_$i.png', bytes: fileDataList[i], option: option);
      entityList.add(entity);
    }
    await init(businessKey: 'customer-id-card');
    await Client().putObjects(entityList).then((responseList) {
      List<String> urlList = [];
      for (final resp in responseList) {
        final url = (resp.realUri.toString());
        urlList.add(url ?? '');
      }
      callBack.call(urlList);
    }).catchError((err) {
      // HMYEasyLoading.showToast(err.toString());
    });
  }

  ///压缩文件
  Future<File> compressFile(File file) async {
    LogUtil.v(tag: '文件大小', file.lengthSync());
    int quality = 100;
    if (file.lengthSync() > 4 * 1024 * 1024) {
      quality = 10;
    } else if (file.lengthSync() > 2 * 1024 * 1024) {
      quality = 20;
    } else if (file.lengthSync() > 1 * 1024 * 1024) {
      quality = 30;
    } else if (file.lengthSync() > 0.5 * 1024 * 1024) {
      quality = 40;
    } else if (file.lengthSync() > 0.25 * 1024 * 1024) {
      quality = 50;
    }
    String fileSuffix = file.path.split("/").last;
    var format = CompressFormat.png;
    switch (fileSuffix) {
      case "jpeg":
      case "jpg":
        format = CompressFormat.jpeg;
        break;
      case "png":
        break;
      default:
        fileSuffix = "";
    }
    // if (ObjectUtil.isNotEmpty(fileSuffix)) {
    //   file = (await FlutterImageCompress.compressAndGetFile(
    //     file.absolute.path,
    //     '${(await getTemporaryDirectory()).path}/$fileSuffix',
    //     quality: quality,
    //     format: format,
    //   )) ??
    //       file;
    // }
    LogUtil.v(tag: '文件大小', file.lengthSync());
    return file;
  }
}
