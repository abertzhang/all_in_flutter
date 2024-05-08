只能将代码复制到使用的项目里,因为需要构建执行命令

#数据库工具floor需要依赖
dependencies:
  flutter:
    sdk: flutter
  floor: ^1.3.0

dev_dependencies:
  flutter_test:
  sdk: flutter
  floor_generator: ^1.3.0
  build_runner: ^2.1.2

#执行语句,在终端
flutter packages pub run build_runner build
flutter packages pub run build_runner watch

#数据库升级迁移
1-修改bean
2-修改数据库配置
//version:1-->version:2
@Database(version: 2, entities: [PersonBean, SchoolBean])
@TypeConverters([DateTimeConverter, PersonTypeConverter])
abstract class AppDatabase extends FloorDatabase {
PersonDao get personDao;
SchoolDao get schoolDao;
}

3-修改数据库初始化
//启动数据库里添加addMigrations([migration1to2])
//添加迁移策略migration1to2
class DatabaseUtil {
DatabaseUtil._();
static final DatabaseUtil _singleton = DatabaseUtil._();
factory DatabaseUtil() => _singleton;
//
late final AppDatabase db;
PersonDao get daoPerson => db.personDao;
SchoolDao get daoSchool => db.schoolDao;
void initDB() async {
// db = await $FloorAppDatabase.databaseBuilder('app_database.db').addMigrations([migration1to2]).build();
db = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
}

//迁移策略
final migration1to2 = Migration(1, 2, (database) async {
LogUtil.v('数据库表1升级到2的策略:增加字段,药品名name');
await database.execute('ALTER TABLE Person ADD COLUMN hobby TEXT');
});
}

4-自动生成数据库
//在终端执行项目目录下,先删除app_database.g.dart文件
flutter packages pub run build_runner build