### 应用场景

### 依赖导包

```
scoped_model: ^1.0.1
import 'package:scoped_model/scoped_model.dart';
```

### 简例01

```
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
void main() => runApp(MaterialApp(home: ScopedModelDemo()));
class ScopedModelDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScopedModel(
      model: CounterModel(),
      child: Scaffold(
          appBar: AppBar(title: Text("ScopedModel")),
          body: Center(
              child: ScopedModelDescendant<CounterModel>(
                  builder: (context, _, model) => ActionChip(
                      label: Text("${model.count}"),
            onPressed: () => model.addCount(value: 5))))));
}
class CounterModel extends Model {
  int _count = 0;
  int get count => _count;
  void addCount({int value: 1}) {
    _count += value;
    notifyListeners();
  }
}
```

