//实例方式
class Student {
  //使用方式,可先实例化一个
  Student._();
  static Student? _singleton;
  static Student init() => _singleton ??= Student._();
  //成员
  String? name;
  int? age;
}

//工厂方式
class MapUtil {
  //需要先初始化,可异步
  //使用方式MapUtil().name
  MapUtil._(); //也可初始化,不能异步
  static MapUtil? _singleton;
  factory MapUtil() => _singleton ??= MapUtil._();
  void dispose() => _singleton = null;
  String? name;
  //初始化
  void init() async {
    name = 'Dart';
  }
}

//标准单例
class CommonUtil {
  //使用方式--CommonUtil.instance.name
  static CommonUtil? _singleton;
  static CommonUtil get instance => _singleton ??= CommonUtil._();
  void dispose() => _singleton = null;
  CommonUtil._();
  String? name;
  void init() async {
    name = 'Flutter';
  }
}

//静态方式
class ScanUtil {
  //使用方式--ScanUtil.scan()
  static void scan() {}
  static int count = 0;
}
