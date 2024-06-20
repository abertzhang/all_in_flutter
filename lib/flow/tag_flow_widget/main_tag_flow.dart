import 'package:flutter/material.dart';

import 'tag_flow_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MaterialApp(home: TagFlowPage()));
}

class TagFlowPage extends StatelessWidget {
  const TagFlowPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('折叠标签'),
      ),
      body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TagFlowWidget(
                items: const [
                  '衣服',
                  'T恤宽松男',
                  '男鞋',
                  '香蕉苹果',
                  '休闲裤',
                  '牛仔裤',
                  '红薯',
                  '红薯',
                  '红薯',
                  '红薯',
                  '西红柿',
                  '更多商品',
                  '热销商品',
                  '最新商品',
                  '特价商品',
                  '限时特价商品',
                  '限时商品',
                  '热门商品',
                ],
                maxRows: 3,
                spaceHorizontal: 8,
                spaceVertical: 8,
                itemHeight: 30,
                horizontalPadding: 8,
                itemBgColor: Colors.lightBlue.withAlpha(30),
                itemStyle: const TextStyle(height: 1.1),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
            ],
          )),
    );
  }
}
