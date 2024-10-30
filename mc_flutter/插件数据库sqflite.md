### sqflite依赖导包

```
sqflite: ^1.2.0
```

### 库函数

```
databaseExists(String path) → Future<bool>
deleteDatabase(String path) → Future<void>
getDatabasesPath() → Future<String>
onDatabaseVersionChangeError(
	Database db, 
	int oldVersion, 
	int newVersion
) → Future<void>
openDatabase(
    String path, 
    {int version, 
    OnDatabaseConfigureFn onConfigure, 
    OnDatabaseCreateFn onCreate, 
    OnDatabaseVersionChangeFn onUpgrade, 
    OnDatabaseVersionChangeFn onDowngrade, 
    OnDatabaseOpenFn onOpen, 
    bool readOnly: false, 
    bool singleInstance: true
}) → Future<Database>
openReadOnlyDatabase(String path) → Future<Database>
```

### 类Database的函数

```dart
close() → Future<void>
delete(
	String table, 
	{String where, 
	List whereArgs
	}) → Future<int>
execute(String sql, [List arguments]) → Future<void>
getVersion() → Future<int>
insert(
    String table, 
    Map<String, dynamic> values, 
    {String nullColumnHack, 
    ConflictAlgorithm conflictAlgorithm
}) → Future<int>
query(String table, {bool distinct, List<String> columns, String where, List whereArgs, String groupBy, String having, String orderBy, int limit, int offset}) → Future<List<Map<String, dynamic>>>
rawDelete(String sql, [List arguments]) → Future<int>
rawInsert(String sql, [List arguments]) → Future<int>
rawQuery(String sql, [List arguments]) → Future<List<Map<String, dynamic>>>
rawUpdate(String sql, [List arguments]) → Future<int>
setVersion(int version) → Future<void>
transaction<T>(Future<T> action(Transaction txn), {bool exclusive}) → Future<T>
update(
    String table, 
    Map<String, dynamic> values, 
    {String where, 
    List whereArgs, 
    ConflictAlgorithm conflictAlgorithm
}) → Future<int>
```

### 命令代码

```
batch() → Batch
//举例
batch = db.batch();
batch.insert('Test', {'name': 'item'});
batch.update('Test', {'name': 'new_item'}, 
    where: 'name = ?', whereArgs: ['item']);
batch.delete('Test', where: 'name = ?', whereArgs: ['item']);
results = await batch.commit();

// Insert some records in a transaction
await database.transaction((txn) async {
  int id1 = await txn.rawInsert(
      'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
  print('inserted1: $id1');
  int id2 = await txn.rawInsert(
      'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
      ['another name', 12345678, 3.1416]);
  print('inserted2: $id2');
});
```

```
// 获取本地SQLite数据库
var databasesPath = await getDatabasesPath();
String path = join(databasesPath, "demo.db"); 
// 删除数据库
await deleteDatabase(path); 
// 打开数据库
Database database = await openDatabase(path, version: 1,
    onCreate: (Database db, int version) async {
  // 当打开数据库的时候创建一张表
  await db.execute(
      "CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, value INTEGER, num REAL)");
}); 
// 开启事务，增加两条记录
await database.transaction((txn) async {
  int id1 = await txn.rawInsert(
      'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
  print("inserted1: $id1");
  int id2 = await txn.rawInsert(
      'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
      ["another name", 12345678, 3.1416]);
  print("inserted2: $id2");
}); 
// 更新一条记录
int count = await database.rawUpdate(
    'UPDATE Test SET name = ?, VALUE = ? WHERE name = ?',
    ["updated name", "9876", "some name"]);
print("updated: $count"); 
// 获取Test表的数据
List<Map> list = await database.rawQuery('SELECT * FROM Test');
List<Map> expectedList = [
  {"name": "updated name", "id": 1, "value": 9876, "num": 456.789},
  {"name": "another name", "id": 2, "value": 12345678, "num": 3.1416}
];
print(list);
print(expectedList);
assert(const DeepCollectionEquality().equals(list, expectedList)); 
// 获取记录的数量
count = Sqflite
    .firstIntValue(await database.rawQuery("SELECT COUNT(*) FROM Test"));
assert(count == 2); 
// 删除一条记录
count = await database
    .rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
assert(count == 1); 
// 关闭数据库
await database.close();
```



### 代码示例

```
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: SqfliteDemo()));
class SqfliteDemo extends StatefulWidget {
  @override
  _SqfliteDemoState createState() => _SqfliteDemoState();
}
class _SqfliteDemoState extends State<SqfliteDemo> {
  WrongTableHelper wrongTableHelper = WrongTableHelper();
  WrongTable record = WrongTable();
  int countUser = 0;
  List<WrongTable> recordList = List<WrongTable>();
//练习用
  void getData() async {
    wrongTableHelper.insertRecord(record).then((value) => print);
    countUser = await wrongTableHelper.countRecord();
    recordList = await wrongTableHelper.selectAllRecord();
    wrongTableHelper.deleteRecordById(4).then((value) => print);
  }
  @override
  void initState() {
    super.initState();
    record.course = "英语";
    getData();
    setState(() {});
  }
  @override
  void dispose() {
    wrongTableHelper.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sqflite数据库"),
      ),
      body: Column(
        children: <Widget>[
          Text("记录条数:$countUser"),
        ],
      ),
    );
  }
}
class WrongTable {
  int id;
  String course;
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map = {
      "id": id,
      "course": course,
    };
    return map;
  }
  static WrongTable fromMap(Map<String, dynamic> record) {
    WrongTable wrongTable = WrongTable();
    wrongTable.id = record['id'];
    wrongTable.course = record['course'];
    return wrongTable;
  }
  static List<WrongTable> fromMaps(List<Map<String, dynamic>> maps) {
    List<WrongTable> wrongTables = List(maps.length);
    for (int i = 0; i < maps.length; i++) {
      wrongTables[i] = WrongTable.fromMap(maps[i]);
    }
    return wrongTables;
  }
}
class WrongTableHelper {
  WrongTableHelper.internal();
  static final WrongTableHelper _instance = WrongTableHelper.internal();
  factory WrongTableHelper() => _instance;
  static Database _database;
  final String nameTable = "wrongTable";
  final String nameDatabase = 'collectsqflite.db';
  final String idColumn = "id";
  final String courseColumn = "course";
  Future<Database> get database async {
    if (_database != null) {
      print('get database');
      return _database;
    }
    _database = await initDatabase();
    return _database;
  }
  initDatabase() async {
    String pathDatabase = await getDatabasesPath();
    String path = join(pathDatabase, 'collectsqflite.db');
    var tempDatabase =
        await openDatabase(path, version: 1, onCreate: _onCreate);
    return tempDatabase;
  }
  void _onCreate(Database database, int version) async {
    await database.execute('''
    create table $nameTable(
      $idColumn integer primary key,
      $courseColumn text
    )
    ''');
  }
//获取所有表中的记录
  Future<List<WrongTable>> selectAllRecord() async {
    var dbClient = await database;
    List tempMaps = List();
    List<WrongTable> results = List();
    tempMaps = await dbClient
        .rawQuery('select * from $nameTable order by $idColumn desc');
    for (int i = 0; i < tempMaps.length; i++) {
      results.add(WrongTable.fromMap(tempMaps[i]));
    }
    return results;
  }
//保存一条记录
  Future<int> insertRecord(WrongTable record) async {
    var dbClient = await database;
    //int result = await dbClient.insert('$tableName', user.toMap());
    int result = await dbClient.insert('$nameTable', record.toMap());
    // print(result);
    return result;
  }
//查询记录数量
  Future<int> countRecord() async {
    var dbClient = await database;
    int result = Sqflite.firstIntValue(
        await dbClient.rawQuery('SELECT COUNT(*) FROM $nameTable'));
    return result;
  }
//删除表
  Future<void> deleteAllRecord() async {
    var dbClient = await database;
    //await dbClient.delete(nameTable);
    return await dbClient.rawDelete('DELETE FROM $nameTable');
  }
//删除某条id的记录
  Future<int> deleteRecordById(int id) async {
    var dbClient = await database;
    int result =
        await dbClient.delete(nameTable, where: '$idColumn=?', whereArgs: [id]);
    return result;
  }
  //修改某条记录
  Future<int> modifyRecord(WrongTable item) async {
    var dbClient = await database;
    int result = await dbClient.update(nameTable, item.toMap(),
        where: '$idColumn=?', whereArgs: [item.id]);
    return result;
  }
//关闭数据库
  Future close() async {
    var dbClient = await database;
    dbClient.close();
  }
}
```

- 其他