### 类ScrollController

##### 构造函数

```
ScrollController({
    double initialScrollOffset = 0.0,
    this.keepScrollOffset = true,
    this.debugLabel,
  }) 
```

##### 简例01backtop

```
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: DemoBacKToTop()));
class DemoBacKToTop extends StatefulWidget {
  @override
  _DemoBacKToTopState createState() => _DemoBacKToTopState();
}
class _DemoBacKToTopState extends State<DemoBacKToTop> {
  List dataList = List(300);
  ScrollController _ctrlScrollBackTop;
  //TODO 需要添加dispose(),省去了
  @override
  void initState() {
    super.initState();
    _ctrlScrollBackTop = ScrollController();
    _ctrlScrollBackTop.addListener(() {
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('返回顶部')),
      body: ListView.separated(
        controller: _ctrlScrollBackTop,
          itemBuilder: (context, idx) => Center(
            child: Container(
              color: Colors.greenAccent.withOpacity(0.4),
                  height: 40,
                  width: double.infinity,
                  child: Center(child: Text('$idx')),
                ),
          ),
          separatorBuilder: (context, idx) => Divider(height: 2),
          itemCount: dataList.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _ctrlScrollBackTop.animateTo(0.0,
              duration: Duration(milliseconds: 800),
              curve: Curves.decelerate);
        },
        child: Icon(Icons.vertical_align_top)
      )
    );
  }
}
```

