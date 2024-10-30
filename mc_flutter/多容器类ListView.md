### 类ListView

#### 类ListView默认构造

```
ListView({
    Key key, 
    Axis scrollDirection: Axis.vertical, 
    bool reverse: false, 
    ScrollController controller, 
    bool primary, 
    ScrollPhysics physics, 
    bool shrinkWrap: false, 
    EdgeInsetsGeometry padding, 
    double itemExtent, 
    bool addAutomaticKeepAlives: true, 
    bool addRepaintBoundaries: true, 
    bool addSemanticIndexes: true, 
    double cacheExtent, 
    List<Widget> children: const [], 
    int semanticChildCount, 
    DragStartBehavior dragStartBehavior: DragStartBehavior.start 
})
```
#### 类ListView构造builder

```
ListView.builder({
    Key key, Axis scrollDirection: Axis.vertical, 
    bool reverse: false, 
    ScrollController controller, 
    bool primary, 
    ScrollPhysics physics, 
    bool shrinkWrap: false, 
    EdgeInsetsGeometry padding, 
    double itemExtent, 
    @required IndexedWidgetBuilder itemBuilder, 
    int itemCount, 
    bool addAutomaticKeepAlives: true, 
    bool addRepaintBoundaries: true, 
    bool addSemanticIndexes: true, 
    double cacheExtent, 
    int semanticChildCount, 
    DragStartBehavior dragStartBehavior: DragStartBehavior.start 
})
```
#### 类ListView构造separated

```
ListView.separated({
    Key key, 
    Axis scrollDirection: Axis.vertical, 
    bool reverse: false, 
    ScrollController controller, 
    bool primary, 
    ScrollPhysics physics, 
    bool shrinkWrap: false, 
    EdgeInsetsGeometry padding, 
    @required IndexedWidgetBuilder itemBuilder, 
    @required IndexedWidgetBuilder separatorBuilder, 
    @required int itemCount, 
    bool addAutomaticKeepAlives: true, 
    bool addRepaintBoundaries: true, 
    bool addSemanticIndexes: true, 
    double cacheExtent 
})
```
#### 类ListView构造custom

用于放动画需求

```
ListView.custom({
    Key key, 
    Axis scrollDirection: Axis.vertical, 
    bool reverse: false, 
    ScrollController controller, 
    bool primary, 
    ScrollPhysics physics, 
    bool shrinkWrap: false, 
    EdgeInsetsGeometry padding, 
    double itemExtent,
   @required SliverChildDelegate childrenDelegate, 
   double cacheExtent, 
   int semanticChildCount 
})
```

#### ListView之循环法

在类ListView的同一级里建立方法_getData()

```
List<Widget> _getData() {    //”_”表示私有
  List<Widget> list_tile = List();
  for (var i = 1; i < 21; i++) {
    list_tile.add(ListTile(
      title: Text("主标题$i"),
      subtitle: Text("副标题$i"),
      selected: false,
      leading: Icon( Icons.memory, size: 30, ), )); }
  return list_tile;}
```

在ListView的构造方法赋值给children

```
children: this._getData(),
```

+ 生成ListView之map法

在lib里建立res文件夹,bing建立数据文件listdata.dart

```
List listData = [ {
"title":'Cadny ship',
"author":'Mothanmde chamian',
"imageUrl":'https://www.itying.com/images/flutter/1.png',
}];  //建立更多的map数据, 放在listData里
```

在类ListView的同一级里建立方法_getData()

```
List<Widget> _getData() {
  List<Widget> listDispaly = List();
 //利用list的iteration
  var tempList = listData.map((value)=>ListTile(      
      leading: Image.network(value["imageUrl"]),
        subtitle: Text(value["author"]),
        title:Text(value["title"])));
  return tempList.toList();}
```

在ListView的构造方法中赋值给children

```
children: this._getData(),
```

+ 生成ListView之build法

```
class MyBody extends StatelessWidget {
//定义类成员变量,只能放这儿,不能方法某个方法内
  List<Widget> listDisplay = List();   
  MyBody() {
      //产生list的循环也可以放在下面的构造函数中
     for (var i = 1; i < 21; i++) {      
       listDisplay.add(ListTile( 
           title: Text("主标题$i"),subtitle: Text("副标题$i"),
           leading: Icon(Icons.memory,size: 30, ),)); } }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.listDisplay.length,
        itemBuilder: (context, index) {
          return listDisplay[index];
        }); }}
```

#### ListView之buildMap法

在lib里建立res文件夹,bing建立数据文件listdata.dart

```
Import “res/listdata.dart”;
List listData = [ {
"title":'Cadny ship',
"author":'Mothanmde chamian',
"imageUrl":'https://www.itying.com/images/flutter/1.png',
}];  //建立更多的map数据, 放在listData里
Widget build(BuildContext context) {
   return ListView.builder(
       itemCount: listData.length,
       itemBuilder: (context, index) {
        return ListTile(
          title: Text(listData[index]["title"]),
          subtitle: Text(listData[index]["author"]),
          leading: Image.network(listData[index]["imageUrl"]),
        );});}
```

#### ListView之buildMap法(已抽离)

```
class MyBody extends StatelessWidget {
   Widget _getListData(context, index) {   
     return ListTile(
      title: Text(listData[index]["title"]),
       subtitle: Text(listData[index]["author"]),
      leading: Image.network(listData[index]["imageUrl"]), ); }
  @override
   Widget build(BuildContext context) {
       //如果是_getListData()就是执行         
     return ListView.builder(    
         itemCount: listData.length, 
         itemBuilder: this._getListData); }} //方法赋值不是执行
```

#### 类ListTile

```
ListTile({
    Key key, 
    Widget leading, 
    Widget title, 
    Widget subtitle, 
    Widget trailing, 
    bool isThreeLine: false 
    bool dense 
    EdgeInsetsGeometry contentPadding, 
    bool enabled: true 
    GestureTapCallback onTap, 
    GestureLongPressCallback onLongPress, 
    bool selected: false
})
```

#### 预定义

```
typedef IndexedWidgetBuilder 
= Widget Function(BuildContext context, int index);
```

