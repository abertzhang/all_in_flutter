分类

Flutter-数据库

标题

Flutter本地数据库SQLite的ORM工具floor使用

<img src="http://qiniu-article.myflutter.cn/img/cover_car_02.jpg" style="zoom:67%;" />

### 引言

Flutter本地持久化存储数据库SQLite，使用不够便捷，特别升级迁移时。插件floor是一个数据库orm工具，让我们可以轻松愉快的使用数据库，基本满足日常使用，让我们一起看看如何使用以及会有哪些坑。

### 插件floor

- Likes--583
- Pub points--120
- Popularity--98%
- Platform--android，iOS，macos
- last version--1.3.0
- 数据采集日期202210

### 准备

pubspec.yaml添加以下依赖，floor_generator和build_runner是协助生成数据库代码，命令是flutter packages pub run build_runner build，生成后如果有改动则用flutter packages pub run build_runner watch，让生成的代码保持最新。

```dart
dependencies:
  floor: ^1.3.0  # SQLite工具

dev_dependencies:
  floor_generator: ^1.3.0
  build_runner: ^2.1.2
```
在项目中本地数据库SQLite相关文件一般不会调整太大，在实战中习惯单独建立一个文件夹管理，自定义数据库工具类来管理这个数据库，可以建立数据库管理目录，建立DBUtil类来管理数据库，目录结构如下图：

![](http://qiniu-article.myflutter.cn/database/floor_01.png)

### 类绑定表

SQLite支持的字段类型有，如果有时间DateTime或枚举类等需要转换成数据库可使用的类型，示例中用枚举来转成数据库可用的整型，在库表里存的是整型int，解析后实体类是枚举类，同样如果是时间DateTime类型，可以用millisecondsSinceEpoch（整型表示时间）来互相转换。

```dart
@entity
class PhoneBean {
  @primaryKey
  int? id;
  String? brand; //品牌
  String? model; //型号
  double? price; //单价
  SystemType os; //操作系统

  PhoneBean({
    this.id,
    this.brand,
    this.model,
    this.price,
    this.os = SystemType.android,
  });
}
```

```dart
enum SystemType {
  android('安卓'),
  windows('微软'),
  ios('苹果');
  final String name;//需要dart 2.18.1以上
  const SystemType(this.name);
}
```



### DAO类

Data Access Object是指数据访问对象，直白一点就是负责代码中类与数据库表之间的增删改查操作，这里定义了最基本的一些方法，floor已经将常用的操作处理好，直接可以用，非常方便，如果需要特定的操作可以手写SQL。这里返回可以是Future也可以是Stream类型的，支持批量操作，如果需要插入多个phones数据到表里，insertPhones(List<PhoneBean> phones)，详见下图底部的多行注释内容。

```dart
import 'package:floor/floor.dart';
@dao
abstract class PhoneDao {
  //增
  @Insert()
  Future<void> insertPhone(PhoneBean phone);
  //删
  @delete
  Future<void> deletePhone(PhoneBean phone);
  //改
  @update
  Future<void> updatePhone(PhoneBean phone);
  //查
  @Query('SELECT * FROM PhoneBean')
  Future<List<PhoneBean>?> findAllPhones();
  /*
  Future<void> insertPhones(List<PhoneBean> phones);
  */
}
```

### 数据库抽象类

在这个类里原本需要我们告诉floor插件，表对应的实体类是：entities: [PhoneBean]，数据库当前版本version: 2，这个是每次修改表结构需要升级一下版本，不至于数据库不认识之前的表或找不到对应的表Column，还有就是需要转换的类@TypeConverters([SystemTypeConverter])，floor提供TypeConverter<T, K>，转换类SystemTypeConverter继承他就可以。

```dart
//文件名 app_database.dart,生成代码文件app_database.g.dart
@Database(version: 2, entities: [PhoneBean])
@TypeConverters([SystemTypeConverter])
abstract class AppDatabase extends FloorDatabase {
  PhoneDao get daoPhone;
}
```

```dart
//枚举互转整型
class SystemTypeConverter extends TypeConverter<SystemType, int> {
  @override
  SystemType decode(int databaseValue) {
    return SystemType.values[databaseValue];
  }

  @override
  int encode(SystemType value) {
    return value.index;
  }
}
```



### 生成代码

在终端执行

```dart
flutter packages pub run build_runner build
```

生成代码后文件位置如图

![](http://qiniu-article.myflutter.cn/database/floor_02.jpeg)

将生成的文件改为dart后缀，根据数据库抽象类的文件改成：app_database.g.dart，放在db文件夹里，并在app_database.dart文件里导入库

```dart
import 'dart:async';//新生成的文件需要

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;//新生成的文件需要

import '/view/db_util/common/system_type_converter.dart';
import '/view/db_util/dao/phone_dao.dart';
import '../bean/phone_bean.dart';

part 'app_database.g.dart';
//在app_database.g.dart文件里，使其变成app_database.dart文件的一部分
part of 'app_database.dart';
```



### 数据库工具类

在项目中将数据库相关的封装成工具类，是单例形式，可以在某些模块中使用完后销毁，需要用时再初始化即可，主要是调用Dao类的方法。

```dart
//
class DBUtil {
  //单例
  static  DBUtil? _singleton ;
  factory DBUtil() => _singleton??=DBUtil._();
  void dispose()=>_singleton=null;
  //定义数据库变量
  late final AppDatabase _db;
  PhoneDao get daoPhone => _db.daoPhone;
  initDB() async {
    _db = await $FloorAppDatabase.databaseBuilder('app_database.db').addMigrations(
      [migration1to2],
    ).build();
  }

  //迁移策略,数据库版本1->2
  final migration1to2 = Migration(1, 2, (database) async {
    await database.execute('ALTER TABLE PhoneBean ADD COLUMN os INTEGER');
  });
}
```

### 数据库工具使用

数据库工具类DBUtil是单例，由于数据库生成或打开需要异步操作，将初始化内容单独放在initDB方法里，在使用数据库工具类之前先进行初始化await DBUtil().initDB()；之后就可以直接调用Dao类来操作表和实体类。

```dart
//需要先初始化
await DBUtil().initDB();
//获取所有表数据,具体看DAO类里定义的方法
phoneList = await DBUtil().daoPhone.findAllPhones() ?? [];
```

### 数据库迁移

在使用floor后迁移变得简单明了，修改后一般是删除自动生成的代码文件app_database.g.dart，再次在终端执行flutter packages pub run build_runner build就完成。

```dart
//在app_database.dart文件里的版本号从1改为2
@Database(version: 2, entities: [PhoneBean])
//db_util.dart的类DBUtil初始化修改一下,再加个迁移策略即可
initDB() async {
  _db = await $FloorAppDatabase.databaseBuilder('app_database.db').addMigrations(
    [migration1to2],
  ).build();
}
//迁移策略,数据库版本1->2
final migration1to2 = Migration(1, 2, (database) async {
  await database.execute('ALTER TABLE PhoneBean ADD COLUMN os INTEGER');
});
```

