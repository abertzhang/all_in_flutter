import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/widgets.dart';
import 'sqflite_logic.dart';

class SqflitePage extends StatefulWidget {
  const SqflitePage({Key? key}) : super(key: key);

  @override
  State<SqflitePage> createState() => _SqflitePageState();
}

class _SqflitePageState extends State<SqflitePage> {
  final logic = Get.put(SqfliteLogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarGradient(
        title: Text('sqflite演示'),
        gradientBegin: Colors.green,
        gradientEnd: Colors.lightBlueAccent,
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return GetBuilder<SqfliteLogic>(builder: (logic) {
      if (logic.isLoading) return LoadingDialog();
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: logic.userList.length,
              itemBuilder: (ctx, idx) {
                var user = logic.userList[idx];
                return GestureDetector(
                  onDoubleTap: () async => await logic.delUser(id: user.id ?? -1),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Expanded(child: Text('${user.id ?? '--'}')),
                      Expanded(child: Text(user.name ?? '--')),
                      Expanded(child: Text(user.account ?? '--')),
                      Expanded(child: Text(user.pwd ?? '--')),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(onPressed: () async => await logic.addUser(), child: Text('新增user')),
              TextButton(onPressed: () async => await logic.delAllUser(), child: Text('清空所有')),
            ],
          ),
        ],
      );
    });
  }
}
