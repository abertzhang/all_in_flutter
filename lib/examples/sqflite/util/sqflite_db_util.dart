import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../../utils/utils.dart';
import '../bean/favorite.dart';
import '../bean/shoe.dart';
import '../bean/user.dart';

class SqfliteDBUtil {
  //单例
  SqfliteDBUtil._();
  static final SqfliteDBUtil _singleton = SqfliteDBUtil._();
  factory SqfliteDBUtil() => _singleton;
  //数据库--变量
  late Database _db;
  //数据库表名称
  String get tableUser => 'user';
  String get tableShoe => 'shoe';
  String get tableFavorite => 'favorite';
  Database get database => _db;
  //数据库初始化
  Future<void> initDatabase() async {
    String path = await getDatabasesPath();
    String nameDB = 'shoe_manager.db';
    _db = await openDatabase(
      join(path, nameDB),
      version: 1,
      onConfigure: _onConfigure,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
    LogUtil.v('打开数据库表${ObjectUtil.isEmpty(_db) ? "失败" : "成功"}');
  }

  //配置--回调
  Future<void> _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  //新建--表--version-1
  void _onCreate(Database db, int version) async {
    // await db.execute('''
    //   CREATE TABLE $tableUser(
    //   id INTEGER PRIMARY KEY AUTOINCREMENT,
    //   account TEXT,
    //   pwd TEXT,
    //   name TEXT,
    //   headImage TEXT
    //   )
    //       ''');
    Batch batch = db.batch();
    //用户表
    batch.execute('''
      CREATE TABLE IF NOT EXISTS $tableUser(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      account TEXT,
      pwd TEXT,
      name TEXT,
      headImage TEXT
      )
          ''');
    //鞋子表
    batch.execute('''
      CREATE TABLE IF NOT EXISTS $tableShoe(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT,
      price REAL,
      category TEXT,
      brand TEXT,
      description TEXT,
      imageUrl TEXT
      )    
    ''');
    //收藏表
    // FOREIGN KEY(userId) REFERENCES $tableUser(id),
    // FOREIGN KEY(shoeId) REFERENCES $tableShoe(id))
    batch.execute('''
      CREATE TABLE IF NOT EXISTS $tableFavorite(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      date TEXT,
      userId INTEGER,
      shoeId INTEGER
      )
    ''');
    batch.commit();
  }

  //升级迁移
  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    LogUtil.v('数据库迁移中...');
    Batch batch = db.batch();
    batch.commit();
  }

  //------------------------------------表user-----------------------------------
  //增--一条user记录
  Future<int> insertUser(User user) async {
    int result = await _db.insert(tableUser, user.toMap());
    return result;
  }

  //删--删除user所有记录
  Future<void> delAllUser() async {
    // await _db.delete(tableUser);//等效
    await _db.rawDelete('DELETE FROM $tableUser');
  }

  //删--删除某条记录,返回int为id
  Future<int> delUserById(int id) async {
    int result = await _db.delete(tableUser, where: 'id=?', whereArgs: [id]);
    return result;
  }

  //改--修改某条user
  Future<int> updateUser(User user) async {
    return await _db.update(tableUser, user.toMap());
  }

  //查--表user所有记录
  Future<List<User>> queryAllUser() async {
    List tempMaps = [];
    List<User> results = [];
    tempMaps = await _db.rawQuery('select * from $tableUser order by id desc');
    for (int i = 0; i < tempMaps.length; i++) {
      results.add(User.fromMap(tempMaps[i]));
    }
    return results;
  }

  //查--记录数量
  Future<int> queryUserTotal() async {
    int result = Sqflite.firstIntValue(await _db.rawQuery('SELECT COUNT(*) FROM $tableUser')) ?? 0;
    return result;
  }

  //------------------------------------表shoe-----------------------------------
  //增--某条shoe记录
  Future<int> insertShoe(Shoe shoe) async {
    int result = await _db.insert(tableShoe, shoe.toMap());
    return result;
  }

  //查--所有记录
  Future<List<Shoe>> queryAllShoe() async {
    List tempMaps = [];
    List<Shoe> results = [];
    tempMaps = await _db.rawQuery('select * from $tableShoe order by id desc');
    for (int i = 0; i < tempMaps.length; i++) {
      results.add(Shoe.fromMap(tempMaps[i]));
    }
    return results;
  }

  //查--记录总数量
  Future<int> queryShoeTotal() async {
    int result = Sqflite.firstIntValue(await _db.rawQuery('SELECT COUNT(*) FROM $tableShoe')) ?? 0;
    return result;
  }

  //------------------------------------表favorite-----------------------------------
  //增--某条shoe记录
  Future<int> insertFavorite(Favorite favorite) async {
    int result = await _db.insert(tableFavorite, favorite.toMap());
    return result;
  }

  //查--所有记录
  Future<List<Favorite>> queryAllFavorite() async {
    List tempMaps = [];
    List<Favorite> results = [];
    tempMaps = await _db.rawQuery('select * from $tableFavorite order by id desc');
    for (int i = 0; i < tempMaps.length; i++) {
      results.add(Favorite.fromMap(tempMaps[i]));
    }
    return results;
  }

  //-----------------------------------------------------------------------------
  //关闭数据库避免内存泄漏
  void dispose() {
    _db.close();
  }
}
