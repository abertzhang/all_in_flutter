### 类RefreshIndicator

##### 参考文档

```
https://api.flutter.dev/flutter/material/RefreshIndicator-class.html
```

##### 继承关系

```
Inheritance
Object DiagnosticableTree Widget StatefulWidget RefreshIndicator
```

##### 构造函数

```
RefreshIndicator({
	Key? key, 
	required Widget child, 
	double displacement: 40.0, 
	required RefreshCallback onRefresh, 
	Color? color, 
	Color? backgroundColor, 
	ScrollNotificationPredicate notificationPredicate: defaultScrollNotificationPredicate, 
	String? semanticsLabel, 
	String? semanticsValue, 
	double strokeWidth: 2.0, 
	RefreshIndicatorTriggerMode triggerMode: RefreshIndicatorTriggerMode.onEdge
	})
```

### 类RefreshIndicatorState

可以结合goboalkey

##### 文档资料

```
https://api.flutter.dev/flutter/material/RefreshIndicatorState-class.html
```



### 简例01

```

void main() => runApp(MaterialApp(home: DemoRefresh()));
class DemoRefresh extends StatelessWidget {
  ScrollController _ctrlScroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    _ctrlScroll.addListener(() {
      if (_ctrlScroll.position.pixels == _ctrlScroll.position.maxScrollExtent) {
        print("开始加载更多...");
      }
    });
    return Scaffold(
        appBar: AppBar(title: Text('Refresh加载')),
        body: RefreshIndicator(
            onRefresh: () => Future.delayed(Duration(seconds: 3)),
            child: ListView.builder(
                itemCount: 60,
                itemBuilder: (context, idx) =>
                    Container(child: Text('列表数据$idx')))));
  }
}
```

### 简例02

```
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: DemoRefresh()));
class DemoRefresh extends StatefulWidget {
  @override
  _DemoRefreshState createState() => _DemoRefreshState();
}
class _DemoRefreshState extends State<DemoRefresh> {
  List totalData = [];
  List pageData = [];
  int startItem = 0, items = 10;
  int endItem = 10;
  bool endFlag = false;
  void _next() {
    if (endItem > totalData.length) {
      endItem = totalData.length;
      endFlag = true;
      pageData = totalData.sublist(startItem, endItem);
      pageData.add(-1);
    } else {
      pageData = totalData.sublist(startItem, endItem);
    }
    setState(() {});
    startItem = startItem + items;
    endItem = endItem + items;
  }
  @override
  void initState() {
    super.initState();
    totalData = List.generate(68, (idx) => idx);
    _next();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Refresh加载')),
        body: RefreshIndicator(
            onRefresh: () => Future.delayed(Duration(seconds: 1), () {
                  if (!endFlag) {
                    _next();
                  }
                }),
            child: ListView.separated(
                separatorBuilder: (context, idx) => Divider(),
                itemCount: pageData.length,
                itemBuilder: (context, idx) => (endFlag && pageData[idx] == -1)
                    ? Center(child: Text('--我已经到底啦--'))
                    : Container(
                        color: Colors.greenAccent,
                        height: 60,
                        child: Center(child: Text('列表数据${pageData[idx]}'))))));
  }
}
```

### 简例03

```
void main() => runApp(MaterialApp(home: DemoRefresh()));
class DemoRefresh extends StatefulWidget {
  @override
  _DemoRefreshState createState() => _DemoRefreshState();
}
class _DemoRefreshState extends State<DemoRefresh> {
  List totalData = [];
  List pageData = [];
  int startItem = 0, items = 10;
  int endItem = 10;
  bool endFlag = false;
  void _next() {
    if (endItem > totalData.length) {
      endItem = totalData.length;
      endFlag = true;
    }
    pageData = totalData.sublist(startItem, endItem);
    setState(() {});
    startItem = startItem + items;
    endItem = endItem + items;
  }
  @override
  void initState() {
    super.initState();
    totalData = List.generate(163, (idx) => idx);
    _next();
  }
  @override
  Widget build(BuildContext context)=>Scaffold(
        appBar: AppBar(title: Text('Refresh加载')),
        body: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: RefreshIndicator(
                onRefresh: () => Future.delayed(Duration(seconds: 1), () {
                      if (!endFlag) {
                        _next();
                      }
                    }),
                child: Column(children: [
                  Container(
                    height: 530,
                    child: ListView.separated(
                        separatorBuilder: (context, idx) => Divider(),
                        itemCount: pageData.length,
                        itemBuilder: (context, idx) => Container(
                            color: Colors.greenAccent,
                            height: 60,
                            child:
                                Center(child: Text('列表数据${pageData[idx]}')))),
                  ),
                  Offstage(
                    offstage: false,
                    child: endFlag
                        ? Center(
                            child: Text('第${(startItem ~/ items)}页,我已经到底啦'),
                          )
                        : Center(child: Text('第${(startItem ~/ items)}页')),
                  )
                ]))));

}
```

### 简例04

和listview在一起,list view的count=data.length+1

```
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: DemoRefresh()));
class DemoRefresh extends StatefulWidget {
  @override
  _DemoRefreshState createState() => _DemoRefreshState();
}
class _DemoRefreshState extends State<DemoRefresh> {
  List totalData = [];
  List pageData = [];
  int startItem = 0, items = 10;
  int endItem = 10;
  bool endFlag = false;
  void _nextPage() {
    if (endItem > totalData.length) {
      endItem = totalData.length;
      endFlag = true;
    }
    pageData = totalData.sublist(startItem, endItem);
    setState(() {});
    startItem = startItem + items;
    endItem = endItem + items;
  }
  @override
  void initState() {
    super.initState();
    totalData = List.generate(33, (idx) => idx);
    _nextPage();
  }
  @override
  Widget build(BuildContext context)=>Scaffold(
        appBar: AppBar(title: Text('Refresh加载')),
        body: RefreshIndicator(
            onRefresh: () => Future.delayed(Duration(seconds: 1), () {
                  if (!endFlag) {
                    _nextPage();
                  }
                }),
            child: Container(
              height: endFlag?75*(pageData.length+1):75.0*pageData.length,
              child: ListView.separated(
                  separatorBuilder: (context, idx) => Divider(),
                  itemCount:endFlag? (pageData.length+1):pageData.length,
                  itemBuilder: (context, idx) => (endFlag&&idx==pageData.length)?Center(child: Text('我已经到底啦')):Container(
                      color: Colors.greenAccent,
                      height: 60,
                      child:
                      Center(child: Text('列表数据${pageData[idx]}'))))
            )));}
```

### 类RefreshProgressIndicator

##### 文档资料

```
https://api.flutter.dev/flutter/material/RefreshProgressIndicator-class.html
```



##### 继承关系

```
Inheritance
Object DiagnosticableTree Widget StatefulWidget ProgressIndicator CircularProgressIndicator RefreshProgressIndicator
```



##### 构造函数

```
RefreshProgressIndicator({
	Key? key, 
	double? value, 
	Color? backgroundColor, 
	Animation<Color?>? valueColor, 
	double strokeWidth: 2.0, 
	String? semanticsLabel, 
	String? semanticsValue
})
```

### 抽象类ProgressIndicator 

