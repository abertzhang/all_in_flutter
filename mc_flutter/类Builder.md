### 继承关系

```
//继承父类
Object
DiagnosticableTree
Widget
StatelessWidget
Builder
```

### 构造函数

```
Builder({
	Key key, 
	@required WidgetBuilder builder
})
```

### 用途

当获取不到context时,还有个方法 Future.delayed(Duration(seconds: 0), () {})

### 简例01

```
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: DemoCustomDialog()));
class DemoCustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text("Builder类")),
      body: Builder(builder: (context) {
        //Future也能让获取context
        Future.delayed(Duration(seconds: 0), () {});
        return Center(child: Text('Builder'));
      }));
}
```

