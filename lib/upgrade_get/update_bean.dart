class UpdateBean {
  int code; //0代表请求成功，非0代表失败
  String msg;
  int updateStatus; //0代表不更新，1代表有版本更新，不需要强制升级，2代表有版本更新，需要强制升级
  int versionCode; // android code码
  int iosCode; // ios code码
  String versionName;
  double apkSize; // android包长度  K单位
  double iosSize; // ios包长度 K单位
  String downloadUrl; // 下载地址
  String modifyContent;
  int is_force_update;
  int buildNum;

  UpdateBean({
    this.code = -1,
    this.msg = "",
    this.updateStatus = 0,
    this.versionCode = 0,
    this.iosCode = 0,
    this.versionName = "",
    this.apkSize = 0,
    this.iosSize = 0,
    this.downloadUrl = "",
    this.modifyContent = "",
    this.buildNum = 0,
    this.is_force_update = 0,
  });

  factory UpdateBean.fromMap(dynamic map) {
    var temp;
    return UpdateBean(
      code: null == (temp = map['Code']) ? -1 : (temp is num ? temp.toInt() : int.tryParse(temp) ?? -1),
      msg: map['Msg']?.toString() ?? "",
      updateStatus: null == (temp = map['UpdateStatus']) ? 0 : (temp is num ? temp.toInt() : int.tryParse(temp) ?? 0),
      versionCode: null == (temp = map['VersionCode']) ? 0 : (temp is num ? temp.toInt() : int.tryParse(temp) ?? 0),
      iosCode: null == (temp = map['IosCode']) ? 0 : (temp is num ? temp.toInt() : int.tryParse(temp) ?? 0),
      apkSize: null == (temp = map['ApkSize']) ? 0 : (temp is num ? temp.toDouble() : double.tryParse(temp) ?? 0),
      iosSize: null == (temp = map['IosSize']) ? 0 : (temp is num ? temp.toDouble() : double.tryParse(temp) ?? 0),
      versionName: map['version_name']?.toString() ?? "",
      downloadUrl: map['download_url']?.toString() ?? "",
      modifyContent: map['version_intro']?.toString() ?? "",
      buildNum: null == (temp = map['num']) ? 0 : (temp is num ? temp.toInt() : int.tryParse(temp) ?? 0),
      is_force_update: 0, //null == (temp = map['is_force_update']) ? 0 : (temp is num ? temp.toInt() : int.tryParse(temp) ?? 0),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'msg': msg,
      'updateStatus': updateStatus,
      'versionCode': versionCode,
      'iosCode': iosCode,
      'versionName': versionName,
      'apkSize': apkSize,
      'iosSize': iosSize,
      'downloadUrl': downloadUrl,
      'modifyContent': modifyContent,
      'buildNum': buildNum,
      'is_force_update': is_force_update,
    };
  }

  @override
  String toString() {
    return 'UpdateBean{code: $code, msg: $msg, updateStatus: $updateStatus, versionCode: $versionCode, iosCode: $iosCode, versionName: $versionName, apkSize: $apkSize, iosSize: $iosSize, downloadUrl: $downloadUrl, modifyContent: $modifyContent, is_force_update: $is_force_update, buildNum: $buildNum}';
  }
}
