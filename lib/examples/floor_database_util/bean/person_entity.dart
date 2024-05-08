import 'package:floor/floor.dart';

import 'person_type.dart';

@entity
class PersonBean {
  @primaryKey
  int? id;
  String name;
  PersonType type;
  String? hobby;
  DateTime createAt;
  PersonBean({
    this.id,
    this.name = '',
    this.type = PersonType.man,
    this.hobby = '',
  }) : createAt = DateTime(2022, 10, 10, 11, 11, 11);
}
