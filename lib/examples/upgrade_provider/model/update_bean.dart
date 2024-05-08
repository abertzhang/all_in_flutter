class UpdateBean {
  int? code; //0代表请求成功，非0代表失败
  String? msg;
  int? updateStatus; //0代表不更新，1代表有版本更新，不需要强制升级，2代表有版本更新，需要强制升级
  int? versionCode; // android code码
  int? iosCode; // ios code码
  String? versionName;
  double? apkSize; // android包长度  K单位
  double? iosSize; // ios包长度 K单位
  String? downloadUrl; // 下载地址
  String? modifyContent;

  UpdateBean({
    this.code,
    this.msg,
    this.updateStatus,
    this.versionCode,
    this.iosCode,
    this.versionName,
    this.apkSize,
    this.iosSize,
    this.downloadUrl,
    this.modifyContent,
  });

  factory UpdateBean.fromMap(dynamic map) {
    if (null == map) return UpdateBean();
    var temp;
    return UpdateBean(
      code: null == (temp = map['Code']) ? -1 : (temp is num ? temp.toInt() : int.tryParse(temp)),
      msg: map['Msg']?.toString() ?? "",
      updateStatus: null == (temp = map['UpdateStatus']) ? 0 : (temp is num ? temp.toInt() : int.tryParse(temp)),
      versionCode: null == (temp = map['VersionCode']) ? 0 : (temp is num ? temp.toInt() : int.tryParse(temp)),
      iosCode: null == (temp = map['IosCode']) ? 0 : (temp is num ? temp.toInt() : int.tryParse(temp)),
      apkSize: null == (temp = map['ApkSize']) ? 0 : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      iosSize: null == (temp = map['IosSize']) ? 0 : (temp is num ? temp.toDouble() : double.tryParse(temp)),
      versionName: map['VersionName']?.toString() ?? "",
      downloadUrl: map['DownloadUrl']?.toString() ?? "",
      modifyContent: map['ModifyContent']?.toString() ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Code': code,
      'Msg': msg,
      'UpdateStatus': updateStatus,
      'VersionCode': versionCode,
      'IosCode': iosCode,
      'ApkSize': apkSize,
      'IosSize': iosSize,
      'VersionName': versionName,
      'DownloadUrl': downloadUrl,
      'ModifyContent': modifyContent,
    };
  }
}
