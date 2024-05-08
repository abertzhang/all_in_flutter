import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../bean/person_entity.dart';
import '../bean/school_entity.dart';
import '../common/datetime_converter.dart';
import '../common/person_type_converter.dart';
import '../dao/person_dao.dart';
import '../dao/school_dao.dart';

part 'app_database.g.dart';

@Database(version: 3, entities: [PersonBean, SchoolBean])
@TypeConverters([DateTimeConverter, PersonTypeConverter])
abstract class AppDatabase extends FloorDatabase {
  PersonDao get personDao;
  SchoolDao get schoolDao;
}
