// import 'package:fluwx/fluwx.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluwx/fluwx.dart';

class WechatUtil {
  //单例
  factory WechatUtil() => _singleton;
  WechatUtil._();
  static final WechatUtil _singleton = WechatUtil._();
  bool isInstalled = false;
  late final Fluwx _wechat;
  //初始化
  Future init({required String wechatAppId, required String universalLink}) async {
    _wechat = Fluwx();
    _wechat.registerApi(appId: wechatAppId, universalLink: universalLink);
    isInstalled = await _wechat.isWeChatInstalled;
  }

  //分享文件
  Future shareFile({required String fileUrl, String? fileName}) async {
    if (!isInstalled) {
      debugPrint('未安装微信,无法分享');
      return;
    }
    if (!fileUrl.contains('http')) {
      debugPrint('文件格式错误,无法分享');
      return;
    }
    //未传文件名,则从url中获取
    String title = fileName ?? fileUrl.split('/').last;
    // WeChatShareFileModel fileModel = WeChatShareFileModel(
    //   WeChatFile.network(fileUrl),
    //   title: title,
    // );
    // _wechat.share(fileModel);
  }

  //分享文本
  Future shareText({required String text, String? description}) async {
    WeChatShareTextModel textModel = WeChatShareTextModel(
      text,
      description: description,
    );
    _wechat.share(textModel);
  }
}
