### 类StatefulBuilder

```
StatefulBuilder({
Key key, 
@required StatefulWidgetBuilder builder
})
```

### 主要用途

小范围的刷新

dialog内刷新



### 预定义StatefulWidgetBuilder

```
typedef StatefulWidgetBuilder 
= Widget Function(BuildContext context, StateSetter setState);
```

### 简例01

```
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: DemoCustomDialog()));
class DemoCustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text("dialog内state")),
      body: RaisedButton(
          onPressed: () =>
              showDialog(
                  context: context,
                  builder: (context) {
                    String label = 'test';
                    return Material(
                      child: StatefulBuilder(
                        builder: (context, state) {
                          return GestureDetector(
                            child: Text(label),
                            onTap: () {
                              label += 'test8';
// 注意不是调用老页面的setState，而是要调用builder中的setState。
//在这里为了区分，在构建builder的时候将setState方法命名为了state。
                              state((){});
                            },
                          );
                        },
                      ),
                    );
                  }),
          child: Text("点击")));
}
```

