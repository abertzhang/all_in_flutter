## 函数showModalBottomSheet

- 官方文档
- 应用场景
- 构造函数

```
Future<T> showModalBottomSheet<T>({
  @required BuildContext context,
  @required WidgetBuilder builder,
})
```

- 局部刷新代码示例

```
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: MyComponent()));
class MyComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyComponent();
}
class _MyComponent extends State<MyComponent> {
  String name = "张三";
  Future<void> _getModelBottomSheet() async {
    showModalBottomSheet(
        context: context,
//showModalBottomSheet打开新页面，setState更新的是老页面
        builder: (BuildContext context) => StatefulBuilder(
            builder: (ctx, toSetState) => Container(
                color: Colors.blue,
                width: double.infinity,
                height: 100.0,
                child: RaisedButton(
                    child: Text(name),
                    onPressed: () => toSetState(() => name =(name=="张三"?"李四":"张三"))))));
  }
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text("Component")),
      body: RaisedButton(
          child: Text("显示sheet"), onPressed: () => _getModelBottomSheet()));
}
```



## 