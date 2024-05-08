// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PersonDao? _personDaoInstance;

  SchoolDao? _schoolDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 3,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PersonBean` (`id` INTEGER, `name` TEXT NOT NULL, `type` INTEGER NOT NULL, `hobby` TEXT, `createAt` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `SchoolBean` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `total` INTEGER NOT NULL, `content` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PersonDao get personDao {
    return _personDaoInstance ??= _$PersonDao(database, changeListener);
  }

  @override
  SchoolDao get schoolDao {
    return _schoolDaoInstance ??= _$SchoolDao(database, changeListener);
  }
}

class _$PersonDao extends PersonDao {
  _$PersonDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _personBeanInsertionAdapter = InsertionAdapter(
            database,
            'PersonBean',
            (PersonBean item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'type': _personTypeConverter.encode(item.type),
                  'hobby': item.hobby,
                  'createAt': _dateTimeConverter.encode(item.createAt)
                },
            changeListener),
        _personBeanUpdateAdapter = UpdateAdapter(
            database,
            'PersonBean',
            ['id'],
            (PersonBean item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'type': _personTypeConverter.encode(item.type),
                  'hobby': item.hobby,
                  'createAt': _dateTimeConverter.encode(item.createAt)
                },
            changeListener),
        _personBeanDeletionAdapter = DeletionAdapter(
            database,
            'PersonBean',
            ['id'],
            (PersonBean item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'type': _personTypeConverter.encode(item.type),
                  'hobby': item.hobby,
                  'createAt': _dateTimeConverter.encode(item.createAt)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PersonBean> _personBeanInsertionAdapter;

  final UpdateAdapter<PersonBean> _personBeanUpdateAdapter;

  final DeletionAdapter<PersonBean> _personBeanDeletionAdapter;

  @override
  Future<void> deleteAllPerson() async {
    await _queryAdapter.queryNoReturn('DELETE FROM PersonBean');
  }

  @override
  Future<List<PersonBean>?> findAllPersons() async {
    return _queryAdapter.queryList('SELECT * FROM PersonBean',
        mapper: (Map<String, Object?> row) => PersonBean(
            id: row['id'] as int?,
            name: row['name'] as String,
            type: _personTypeConverter.decode(row['type'] as int),
            hobby: row['hobby'] as String?));
  }

  @override
  Stream<List<PersonBean>> findAllPersonsAsStream() {
    return _queryAdapter.queryListStream('SELECT * FROM PersonBean',
        mapper: (Map<String, Object?> row) => PersonBean(
            id: row['id'] as int?,
            name: row['name'] as String,
            type: _personTypeConverter.decode(row['type'] as int),
            hobby: row['hobby'] as String?),
        queryableName: 'PersonBean',
        isView: false);
  }

  @override
  Future<PersonBean?> findPersonById(int id) async {
    return _queryAdapter.query('SELECT * FROM PersonBean WHERE id = ?1',
        mapper: (Map<String, Object?> row) => PersonBean(
            id: row['id'] as int?,
            name: row['name'] as String,
            type: _personTypeConverter.decode(row['type'] as int),
            hobby: row['hobby'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> insertPerson(PersonBean person) async {
    await _personBeanInsertionAdapter.insert(person, OnConflictStrategy.abort);
  }

  @override
  Future<int> insertPersonId(PersonBean person) {
    return _personBeanInsertionAdapter.insertAndReturnId(
        person, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertPersonList(List<PersonBean> persons) async {
    await _personBeanInsertionAdapter.insertList(
        persons, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatePerson(PersonBean person) async {
    await _personBeanUpdateAdapter.update(person, OnConflictStrategy.abort);
  }

  @override
  Future<void> updatePersonList(List<PersonBean> persons) async {
    await _personBeanUpdateAdapter.updateList(
        persons, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletePerson(PersonBean person) async {
    await _personBeanDeletionAdapter.delete(person);
  }

  @override
  Future<void> deletePersons(List<PersonBean> persons) async {
    await _personBeanDeletionAdapter.deleteList(persons);
  }
}

class _$SchoolDao extends SchoolDao {
  _$SchoolDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _schoolBeanInsertionAdapter = InsertionAdapter(
            database,
            'SchoolBean',
            (SchoolBean item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'total': item.total,
                  'content': item.content
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SchoolBean> _schoolBeanInsertionAdapter;

  @override
  Future<List<SchoolBean>?> findAllSchools() async {
    return _queryAdapter.queryList('SELECT * FROM SchoolEntity',
        mapper: (Map<String, Object?> row) => SchoolBean(
            row['id'] as int,
            row['name'] as String,
            row['total'] as int,
            row['content'] as String));
  }

  @override
  Future<SchoolBean?> findSchoolById(int id) async {
    return _queryAdapter.query('SELECT * FROM SchoolEntity WHERE id = ?1',
        mapper: (Map<String, Object?> row) => SchoolBean(
            row['id'] as int,
            row['name'] as String,
            row['total'] as int,
            row['content'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertSchool(SchoolBean school) async {
    await _schoolBeanInsertionAdapter.insert(school, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
final _personTypeConverter = PersonTypeConverter();
