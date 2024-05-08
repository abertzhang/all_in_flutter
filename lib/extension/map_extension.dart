/*
用法:

插件:
  # 工具--最新3.0.0
  flustars_flutter3: ^3.0.0
导包:
export 'package:flustars_flutter3/flustars_flutter3.dart';
*/

extension MapExtension on Map<String, dynamic> {
  Map<String, dynamic> clearNull() {
    Map<String, dynamic> tmp = {};
    forEach((key, value) {
      if (value != null) tmp.addAll({key: value});
    });
    return tmp;
  }
}
