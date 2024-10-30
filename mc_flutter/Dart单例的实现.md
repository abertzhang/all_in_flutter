Flutter基础Dart单例的实现

<img src="http://qiniu-article.myflutter.cn/img/cover_car_01.jpg" style="zoom: 67%;" />

### 引言

在日常开发搭建基础框架时，常常用到全局使用的数据类或者工具类，比如日期工具类，地图工具类等。在项目一般使用几种单例类来分享心得，有类实例方式、工厂方式以及类静态方式。

### 实例方式

使用[DartPad.cn](https://dartpad.cn/?)网站来练习dart简单代码片段还是很方便，下面的例子均在此网站执行并验证结果。

```dart
class Student {
  //使用方式,可先实例化一个
  //实例是单例
  Student._();
  static Student? _singleton;
  static Student init() => _singleton ??= Student._();
  //
  String? name;
  int? age;
}
void main() {
  Student a = Student.init();
  a.name="zhang";
  a.age=15;
  print(a.name);//zhang
  Student b = Student.init();
  b.name="李";
  print(a.name);//李
  print(b.name);//李
  print(b.age);//15
}
```

工厂方式

```dart

class MapUtil {
  //使用方式MapUtil(),需要先初始化,可异步
  //单例,全局使用
  MapUtil._(); //也可初始化,不能异步
  static MapUtil? _singleton;
  factory MapUtil() => _singleton ??= MapUtil._();
  void dispose() => _singleton = null;
  String? name;
  //初始化
  void init() async{
    name ='Dart';
  }
}
void main() {
  MapUtil().init();
  print(MapUtil().name);//Dart
  MapUtil().dispose();
  print(MapUtil().name);//null
}
```

```dart
//标准单例
class CommonUtil {
  //使用方式--CommonUtil.instance
  //单例
  static CommonUtil? _singleton;
  static CommonUtil get instance => _singleton ??= CommonUtil._();
   void dispose() => _singleton = null;
  CommonUtil._(); 
  String? name;
  void init()async{
    name ='Flutter';
  }
}
void main() {
CommonUtil.instance.init();
print(CommonUtil.instance.name);//Flutter
CommonUtil.instance.dispose();
print(CommonUtil.instance.name);//null
}
```

静态方式

```dart
//类静态方式
class DataApi {
  static String? commany;
static Future<String> getName()async=> "Flutter";
  static void dispose(){
    commany=null;
  }
}
void main() async{
  DataApi.commany='Google';
  print(await DataApi.getName());//Flutter
  print(DataApi.commany);//Google
}
```

### 结语

这次分享代码都是最简化的，看到代码基本也能快速理解含义，也容易记住写法，三种实现单例的方式在Flutter开发实践中经常使用，需要哪种方式可以根据实际情况选择。后期也会分门别类多分享在项目中心得，分享也是一种学习。

