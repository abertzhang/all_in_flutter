import 'package:floor/floor.dart';

import '../bean/school_entity.dart';

@dao
abstract class SchoolDao {
  @Query('SELECT * FROM SchoolEntity')
  Future<List<SchoolBean>?> findAllSchools();

  @Query('SELECT * FROM SchoolEntity WHERE id = :id')
  Future<SchoolBean?> findSchoolById(int id);

  @Insert()
  Future<void> insertSchool(SchoolBean school);
}
