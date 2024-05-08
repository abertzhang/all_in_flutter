library database_util;

import 'package:floor/floor.dart';

import '../../utils/utils.dart';
import 'dao/person_dao.dart';
import 'dao/school_dao.dart';
import 'database/app_database.dart';

export 'dao/person_dao.dart';
export 'database/app_database.dart';
export 'database/app_database.dart';

class DatabaseUtil {
  DatabaseUtil._();
  static final DatabaseUtil _singleton = DatabaseUtil._();
  factory DatabaseUtil() => _singleton;
  //
  late final AppDatabase db;
  PersonDao get daoPerson => db.personDao;
  SchoolDao get daoSchool => db.schoolDao;
  void initDB() async {
    LogUtil.v('数据库初始化');
    db = await $FloorAppDatabase.databaseBuilder('app_database.db').addMigrations(
      [migration1to2, migration2to3],
    ).build();
    // db = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }

  //迁移策略,数据库版本1->2
  final migration1to2 = Migration(1, 2, (database) async {
    LogUtil.v('数据库表1升级到2的策略:增加字段hobby');
    await database.execute('ALTER TABLE PersonBean ADD COLUMN hobby TEXT');
  });
  //迁移策略,数据库版本2->3
  final migration2to3 = Migration(2, 3, (database) async {
    LogUtil.v('数据库表1升级到2的策略:增加字段createAt');
    await database.execute('ALTER TABLE PersonBean ADD COLUMN createAt INTEGER');
  });
}
