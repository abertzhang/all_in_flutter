import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../bean/person_entity.dart';
import '../bean/person_type.dart';
import '../database_util.dart';

class DatabaseLogic extends GetxController {
  //加载标志
  bool isLoading = true;
  List<PersonBean> personList = [];
  TextEditingController ctrlText = TextEditingController();
  final daoPerson = DatabaseUtil().daoPerson;

  @override
  void onReady() async {
    await getPersonList();
    isLoading = false;
    update();
  }

  Future<void> getPersonList() async {
    personList = await DatabaseUtil().daoPerson.findAllPersons() ?? [];
  }

  //增加数据库记录
  Future<void> addPersonToDB() async {
    final name = ctrlText.text;
    ctrlText.clear();
    if (name.trim().isEmpty) return;
    final person = PersonBean(name: name, hobby: 'coding', type: PersonType.women);
    await daoPerson.insertPerson(person);
    await getPersonList();
    update();
  }

  //删除某条记录
  Future<void> removePerson(PersonBean person) async {
    await daoPerson.deletePerson(person);
    await getPersonList();
    update();
  }

  //改某条记录
  Future<void> updatePerson(PersonBean person) async {
    person.name = '${person.name}修改';
    await daoPerson.updatePerson(person);
    update();
  }

  //删--删除全部
  Future<void> delAllPerson() async {
    await daoPerson.deleteAllPerson();
    await getPersonList();
    update();
  }

  @override
  void onClose() {
    ctrlText.dispose();
  }
}
