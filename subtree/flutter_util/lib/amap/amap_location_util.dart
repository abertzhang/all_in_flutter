import 'dart:async';
import 'dart:io';

import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:amap_flutter_location/amap_location_option.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:permission_handler/permission_handler.dart';

import 'location_bean.dart';

class AMapLocationUtil {
  //静态实例
  static final AMapLocationUtil _singleton = AMapLocationUtil._();
  //访问点
  factory AMapLocationUtil() => _singleton;
  //初始化一次
  AMapLocationUtil._();

  //与旧版本一直的定位类Location,需要返回的定位信息
  final AMapFlutterLocation _plugin = AMapFlutterLocation();
  var needPermissionList = [Permission.location, Permission.storage, Permission.phone];
  Location? _location;
  Location? get location => _location;
  late StreamSubscription<Map<String, Object>>? _locationListener;
  late Stream locationStream;
  int count = 0;

  Future<void> init({required String androidKey, required String iosKey}) async {
    //隐私声明
    AMapFlutterLocation.updatePrivacyShow(true, true);
    AMapFlutterLocation.updatePrivacyAgree(true);
    //设置高德key
    AMapFlutterLocation.setApiKey(androidKey, iosKey);
    //
    await _checkPermissions();
    //iOS 获取native精度类型
    if (Platform.isIOS) {
      _requestAccuracyAuthorization();
    }

    locationStream = _plugin.onLocationChanged().asBroadcastStream();
    addListen();
    getManyLocationInfo();
  }

  void addListen() {
    _locationListener = locationStream.listen((result) async {
      _location = JsonUtil.getObject(result, (v) => Location.fromMap(result));
      if (_location?.address == null && count < 3) {
        await Future.delayed(const Duration(milliseconds: 800));
        count++;
        getOnceLocationInfo();
      }
    }) as StreamSubscription<Map<String, Object>>?;
  }

  //获取iOS native的accuracyAuthorization类型
  void _requestAccuracyAuthorization() async {
    AMapAccuracyAuthorization currentAccuracyAuthorization = await _plugin.getSystemAccuracyAuthorization();
    if (currentAccuracyAuthorization == AMapAccuracyAuthorization.AMapAccuracyAuthorizationFullAccuracy) {
      LogUtil.e("精确定位类型");
    } else if (currentAccuracyAuthorization == AMapAccuracyAuthorization.AMapAccuracyAuthorizationReducedAccuracy) {
      LogUtil.e("模糊定位类型");
    } else {
      LogUtil.e("未知定位类型");
    }
  }

  //连续定位
  void getManyLocationInfo() async {
    if (!await Permission.location.isGranted || !await Permission.location.serviceStatus.isEnabled) return;
    _setLocationOption();
    _plugin.startLocation();
  }

  //单次
  void getOnceLocationInfo() async {
    if (!await Permission.location.isGranted || !await Permission.location.serviceStatus.isEnabled) return;
    _plugin.stopLocation();
    _setLocationOption(isOnce: true, interval: 800);
    _plugin.startLocation();
    getManyLocationInfo();
  }

  //设置定位参数
  void _setLocationOption({bool isOnce = false, int interval = 30000}) {
    _plugin.setLocationOption(AMapLocationOption(onceLocation: isOnce, locationInterval: interval));
  }

  // 申请权限
  Future<void> _checkPermissions() async {
    Map<Permission, PermissionStatus> statuses = await needPermissionList.request(); //扩展函数
    statuses.forEach((key, value) {
      LogUtil.e('$key permissionStatus is $value');
    });
  }

  //销毁
  void dispose() {
    _locationListener?.cancel();
    _plugin.destroy();
  }
}
