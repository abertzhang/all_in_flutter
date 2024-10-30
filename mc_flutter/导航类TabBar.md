### 类Tabbar

#### 构造函数

```
TabBar({Key key, 
    @required List<Widget> tabs, 
    TabController controller, 
    bool isScrollable: false, 
    Color indicatorColor, 
    double indicatorWeight: 2.0, 
    EdgeInsetsGeometry indicatorPadding: EdgeInsets.zero, 
    Decoration indicator, 
    TabBarIndicatorSize indicatorSize, 
    Color labelColor, 
    TextStyle labelStyle, 
    EdgeInsetsGeometry labelPadding, 
    Color unselectedLabelColor, 
    TextStyle unselectedLabelStyle, 
    DragStartBehavior dragStartBehavior: DragStartBehavior.start, 
    MouseCursor mouseCursor, 
    ValueChanged<int> onTap, ScrollPhysics physics
})
```

### 类TabBarView

#### 构造函数

```
TabBarView({
    Key key, 
    @required List<Widget> children, 
    TabController controller, 
    ScrollPhysics physics, 
    DragStartBehavior dragStartBehavior: DragStartBehavior.start
})
```

### 类Tab

##### 继承关系

```
Object>DiagnosticableTree>Widget>StatelessWidget>Tab
```

##### 构造函数

```
Tab({
    Key key, 
    String text, 
    Widget icon, 
    EdgeInsetsGeometry iconMargin: const EdgeInsets.only(bottom: 10.0), 
    Widget child
})
```

##### 常用属性

```
child → Widget
icon → Widget
iconMargin → EdgeInsetsGeometry
key → Key
text → String
```

### 类TabController

##### 继承关系

```
Object>ChangeNotifier>TabController
```

##### 构造函数

```
TabController({
    int initialIndex: 0, 
    @required int length, 
    @required TickerProvider vsync
})
```

##### 常用属性

```
animation → Animation<double>
index ↔ int
indexIsChanging → bool
length → int
offset ↔ double
previousIndex → int
```

##### 常用方法

```
animateTo(
    int value, 
    {Duration duration: kTabScrollDuration,
    Curve curve: Curves.ease
}) → void
```

```
dispose() → void
notifyListeners() → void
removeListener(void listener()) → void
```

### 类TabBarTheme

##### 继承关系

```
Mixed in types
Diagnosticable
Annotations
@immutable
```

##### 构造函数

```
TabBarTheme({
    Decoration indicator, 
    TabBarIndicatorSize indicatorSize, 
    Color labelColor, 
    EdgeInsetsGeometry labelPadding, 
    TextStyle labelStyle, 
    Color unselectedLabelColor, 
    TextStyle unselectedLabelStyle
})
```

### mixin SingleTickerProviderStateMixin

```
mixin SingleTickerProviderStateMixin<T extends StatefulWidget> on State<T> implements TickerProvider 
```

### 抽象类TickerProvider

##### 继承关系

```
Implementers
TestVSync WidgetTester
```

##### 构造函数

```
TickerProvider()
```

##### 抽象方法

```
createTicker(TickerCallback onTick) → Ticker
```

### 用途和重点

1	TabBar放在Scaffold的AppBar的bottom参数下

2	TabBarView放在Scaffold的body下,对应数量

3	类需要with SingleTickerProviderStateMixin

4	切换可以动画参数TabControtabller的方法

5	像头条的导航栏

6	需要注销dispose()

### 简例01

```
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: DemoTabBar()));
class DemoTabBar extends StatefulWidget {
  const DemoTabBar({Key key}) : super(key: key);
  @override
  _DemoTabBarState createState() => _DemoTabBarState();
}
class _DemoTabBarState extends State<DemoTabBar>
    with SingleTickerProviderStateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];
  TabControtabller _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: myTabs.map((Tab tab) {
            final String label = tab.text.toLowerCase();
            return Center(
                child: Text(
              'This is the $label tab',
              style: const TextStyle(fontSize: 36),
            ));
          }).toList()));
}
```

