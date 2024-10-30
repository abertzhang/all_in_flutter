## factory模式

- 应用场景

如类timer就是factory模式,系统里只能有一个实例

在数据库操作时,只打开一个数据库DB实例

- 代码举例

在Dart的代码编辑器里可以直接运行,或在线DartPad执行,链接: https://dartpad.cn/

```
class Manager {
  static Manager _instance;		//创建静态私有变量_instance
  Manager._internal();			//私有的命名构造空的函数
  static Manager _getInstance() {		
    if (_instance == null) {
      _instance = new Manager._internal();
    }
    return _instance;
  }
  factory Manager() => _getInstance();	//前缀factory,构造函数,利用私有函数_getInstance()
  static Manager get instance => _getInstance();	//get instance变量
}
main() {
  Manager manager1 = new Manager();
  Manager manager2 = Manager.instance;
  print(identical(manager1, manager2));
}
```

