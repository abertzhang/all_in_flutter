import 'package:floor/floor.dart';

import '../bean/person_entity.dart';

@dao
abstract class PersonDao {
  //增
  @Insert()
  Future<void> insertPerson(PersonBean person);

  @Insert()
  Future<int> insertPersonId(PersonBean person);

  @insert
  Future<void> insertPersonList(List<PersonBean> persons);

  //删
  @delete
  Future<void> deletePerson(PersonBean person);

  @delete
  Future<void> deletePersons(List<PersonBean> persons);

  // @Delete('DELETE FROM PersonBean'),
  // Delete没有自定义删除SQL语句,Query可以用自定义的SQL语句
  @Query('DELETE FROM PersonBean')
  Future<void> deleteAllPerson();

  //改
  @update
  Future<void> updatePerson(PersonBean person);

  @update
  Future<void> updatePersonList(List<PersonBean> persons);

  //查
  @Query('SELECT * FROM PersonBean')
  Future<List<PersonBean>?> findAllPersons();

  @Query('SELECT * FROM PersonBean')
  Stream<List<PersonBean>> findAllPersonsAsStream();

  @Query('SELECT * FROM PersonBean WHERE id = :id')
  Future<PersonBean?> findPersonById(int id);

  //其他查询例子
  //@Query('SELECT * FROM Mark WHERE isLocal = 0 AND opt = :opt ORDER BY dayAt desc')
  //Future<List<Mark>> findMarksByOpt(String opt);
}
