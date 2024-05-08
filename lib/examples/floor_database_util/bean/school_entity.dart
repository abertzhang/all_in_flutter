import 'package:floor/floor.dart';

@entity
class SchoolBean {
  @primaryKey
  final int id;
  final String name;
  final int total;
  final String content;

  SchoolBean(this.id, this.name, this.total, this.content);
}
