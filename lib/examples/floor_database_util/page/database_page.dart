import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../widgets/appbar_gradient.dart';
import '../../../widgets/loading_dialog.dart';
import '../bean/person_entity.dart';
import 'database_logic.dart';

class DatabasePage extends StatefulWidget {
  const DatabasePage({Key? key}) : super(key: key);

  @override
  State<DatabasePage> createState() => _DatabasePageState();
}

class _DatabasePageState extends State<DatabasePage> {
  final logic = Get.put(DatabaseLogic());
  List<PersonBean> persons = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: AppBarGradient(
          gradientBegin: Colors.blue,
          gradientEnd: Colors.lightBlueAccent,
          title: const Text('数据库操作'),
        ),
        body: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return GetBuilder<DatabaseLogic>(builder: (logic) {
      if (logic.isLoading) return LoadingDialog();
      return Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (ctx, idx) => GestureDetector(
                onTap: () async {
                  await logic.updatePerson(logic.personList[idx]);
                },
                onDoubleTap: () async {
                  await logic.removePerson(logic.personList[idx]);
                },
                child: Row(
                  children: [
                    Expanded(child: Text('${logic.personList[idx].id}')),
                    Expanded(child: Text(logic.personList[idx].name)),
                    Expanded(child: Text(logic.personList[idx].type.title)),
                    Expanded(child: Text(logic.personList[idx].hobby ?? '--')),
                    Expanded(flex: 2, child: Text(DateUtil.formatDate(logic.personList[idx].createAt, format: DateFormats.y_mo_d))),
                  ],
                ),
              ),
              separatorBuilder: (ctx, idx) => const Divider(),
              itemCount: logic.personList.length,
            ),
          ),
          TextButton(
              onPressed: () async {
                await logic.delAllPerson();
              },
              child: Text('删除全部')),
          PersonAddWidget(),
        ],
      );
    });
  }
}

class PersonAddWidget extends StatelessWidget {
  PersonAddWidget({super.key});
  final logic = Get.find<DatabaseLogic>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      color: Colors.black12,
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: logic.ctrlText,
            decoration: const InputDecoration(
              fillColor: Colors.transparent,
              filled: true,
              contentPadding: EdgeInsets.all(16),
              border: InputBorder.none,
              hintText: '请输入姓名',
            ),
          )),
          TextButton(
              onPressed: () async {
                await logic.addPersonToDB();
              },
              child: const Text('保存')),
        ],
      ),
    );
  }
}
