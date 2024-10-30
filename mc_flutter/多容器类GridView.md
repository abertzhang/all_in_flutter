### 类GridView

#### 构造函数

```
GridView({
Key key, 
Axis scrollDirection: Axis.vertical, 
bool reverse: false, 
ScrollController controller, bool primary, 
ScrollPhysics physics, bool shrinkWrap: false, 
EdgeInsetsGeometry padding, 
//修饰符抽象类,用SliverGridDelegateWithFixedCrossAxisCount赋值
@required SliverGridDelegate gridDelegate, 
bool addAutomaticKeepAlives: true, 
bool addRepaintBoundaries: true, 
bool addSemanticIndexes: true, 
double cacheExtent, 
List<Widget> children: const [], 
int semanticChildCount })
```
#### 命名构造builder

```
GridView.builder({
    Key key, 
    Axis scrollDirection: Axis.vertical, 
    bool reverse: false, 
    ScrollController controller, bool primary, 
    ScrollPhysics physics, bool shrinkWrap: false, 
    EdgeInsetsGeometry padding, 
    @required SliverGridDelegate gridDelegate, 
    @required IndexedWidgetBuilder itemBuilder, 
    int itemCount bool addAutomaticKeepAlives: true, 
    bool addRepaintBoundaries: true, 
    bool addSemanticIndexes: true, double cacheExtent,
     int semanticChildCount
 })
```
#### 命名构造count

```
GridView.count({
    Key key, 
    Axis scrollDirection: Axis.vertical, //滚动方向
    bool reverse: false, 
    ScrollController controller, 
    bool primary, ScrollPhysics physics, 
    bool shrinkWrap: false, 
    EdgeInsetsGeometry padding, 
    @required int crossAxisCount, //一行多少个
    double mainAxisSpacing: 0.0, // 上下间隔
    double crossAxisSpacing: 0.0, // 左右间隔
    double childAspectRatio: 1.0, //item宽高比
    bool addAutomaticKeepAlives: true, 
    bool addRepaintBoundaries: true, 
    bool addSemanticIndexes: true, 
    double cacheExtent, 
    List<Widget> children: const [], 
    int semanticChildCount, 
    DragStartBehavior dragStartBehavior: DragStartBehavior.start
})
```

#### 命名构造custom

```
GridView.custom({
    Key key, 
    Axis scrollDirection: Axis.vertical, 
    bool reverse: false, 
    ScrollController controller, 
    bool primary, 
    ScrollPhysics physics, 
    bool shrinkWrap: false, 
    EdgeInsetsGeometry padding, 
    @required SliverGridDelegate gridDelegate, 
    @required SliverChildDelegate childrenDelegate, 
    double cacheExtent, 
    int semanticChildCount, 
    DragStartBehavior dragStartBehavior: DragStartBehavior.start
})
```

#### 生成GridView的普通方法

```
class MyScaffoldState extends State<MyScaffold> {
  List<Widget> gridData = List();
  @override
  Widget build(BuildContext context) {
     for(int i=0; i<40; i++){
      gridData.add(Text("我是网格")); }
     return Scaffold(
      appBar: AppBar(title: Text("基本widget演ty示"), ),
      body: Container(
//使用.count命名构造方法
        child: GridView.count(                            
//5为列数,另一个行数mainAxisCount
            children: gridData, crossAxisCount: 5, ), )); } 
```

#### 生成GridView之map法

```
class MyScaffoldState extends State<MyScaffold> {
  List<Widget> _getGridData(){
    var tempList = listData.map((value){
//这是遍历后值iter形式迭代给tempList
       return Container( child: Column(    
          children: <Widget>[
             Image.network(value["imageUrl"]),
             SizedBox(height: 5,),   //没有padding参数用这个比较好
             Text(value["title"]),
             Text(value["author"]),
          ],),);});
   return tempList.toList();  }
    .....      //中间代码省略
          child: GridView.count(
            children: _getGridData(),
            crossAxisCount: 2,         //控制列数
            padding: EdgeInsets.all(10),  //内边距
            mainAxisSpacing: 10,       //横向item之间的间隙
            crossAxisSpacing: 10,       //纵向item之间的间隙
            scrollDirection: Axis.horizontal,  //控制网格横向还是垂直
          ),));  }}
```

#### 生成GridView之build法

```
class MyScaffoldState extends State<MyScaffold> {
  Widget _getGridData(context, index) {          //生成item抽离后的方法
     return Container( child: Column(children: <Widget>[
          Image.network(listData[index]["imageUrl"]),
          SizedBox(height: 5,),
          Text(listData[index]["title"]),
          Text(listData[index]["author"]),        ],      ),    );  }
     ....
        child: GridView.builder(
            itemCount: listData.length,
            itemBuilder: this._getGridData,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
 //    scrollDirection: Axis.horizontal,//builder函数里没有这个
         //builder函数里没有这个,需要外面再套一个Container
         //padding: EdgeInsets.all(10),
            mainAxisSpacing: 10,         //横向之间间隙
            crossAxisSpacing: 10,         //纵向之间间隙
            ),), ));}
```
