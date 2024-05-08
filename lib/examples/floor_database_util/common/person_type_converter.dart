import 'package:floor/floor.dart';

import '../bean/person_type.dart';

class PersonTypeConverter extends TypeConverter<PersonType, int> {
  @override
  PersonType decode(int databaseValue) {
    return PersonType.values[databaseValue];
  }

  @override
  int encode(PersonType value) {
    return value.index;
  }
}
