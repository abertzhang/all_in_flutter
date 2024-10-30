<img src="http://qiniu-article.myflutter.cn/img/cover_car_01.jpg" style="zoom: 50%;" />

### 标题-用InheritedWidget定义自己provider

### 提笔缘由

状态管理伴随着Flutter的发展日益丰富，如果说响应式是Flutter的特色，那么状态管理的就是实现方式，从最初的provide再到官方认可的provider，还有scoped_model，event_bus，get，riverpod，BloC，redux等等太多。作为开发者，对这些状态管理实现方式可以了解一二，当然因为学疏才浅，我只能略懂。Stream和InheritedWidget两种不同方式实现状态管理，项目中常用的Provider核心就是InheritedWidget，所以通过探究该类来侧面理解provider，在实践中很少用到InheritedWidget，但他是个幕后英雄。

### 关联知识点

- InheritedWidget
- ValueNotifier
- ValueListenBuilder
- Builder
- ChangeNotifier
- ValueListenable

### 类InheritedWidget

构造函数很简单，需要必传一个Widget，因为只有他的child，才能获取到存放在树梢的数据。

```dart
InheritedWidget({Key key,required Widget child})
```

继承InheritedWidget后必须override的方法，作用是你来决定通知变化的条件，以便节省资源。

```dart
updateShouldNotify(
covariant InheritedWidget oldWidget
) → bool
```

继承的新类需要一个静态方法 of(context)，也是核心的一步，child就是通过of获取在树梢的数据，借助context.dependOnInheritedWidgetOfExactType<T>方法来获取。

### 最简单示例

用最简单的例子演示InheritedWidget使用步骤，定义类ColorInherited继承InheritedWidget，里面存放颜色color和大小size，ColorInherited用于下面的child获取。ColorInherited可以放在Scaffold上下都可以，注意点是需要类Builder促使生成context，否则会因为context问题而报错，第二个注意点是dependOnInheritedWidgetOfExactType方法是泛型，要传入具体类。示例代码如下：

```dart
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: ColorInheritedPage()));
class ColorInheritedPage extends StatelessWidget {
  const ColorInheritedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('InheritedWidget演示')),
      body: ColorInherited(
        size: const Size(300, 100),
        color: Colors.brown,
        child: Builder(builder: (context) {
          var provider = ColorInherited.of(context);
          return Container(
            height: provider.size.height,
            width: provider.size.width,
            color: provider.color,
          );
        }),
      ),
    );
  }
}

class ColorInherited extends InheritedWidget {
  final Color color;
  final Size size;
  const ColorInherited({
    super.key,
    required super.child,
    required this.color,
    required this.size,
  });
  static ColorInherited of(BuildContext context) {
    var inherited = context.dependOnInheritedWidgetOfExactType<ColorInherited>();
    assert(inherited != null, 'error:No ColorInherited ');
    return inherited!;
  }

  @override
  bool updateShouldNotify(covariant ColorInherited oldWidget) {
    return oldWidget.size != size || oldWidget.color != color;
  }
}
```

### 计数器示例

在理解InheritedWidget如何使用后，我们可继续探究。上面例子中是静态数据，页面没有任何变化，现在用他来做个计数器的页面，是一种有变化的状态，需要及时去响应，就可以结合ChangeNotifier类，这个是不是熟悉的味道，在provider中定义数据类时需要继承他，借助ChangeNotifier定义自己的数据，存放一个变量，是需要ValueNotifier类，

```dart
//存放需要监听的变量
class CounterNotify extends ChangeNotifier {
  final countState = ValueNotifier<int>(0);
  void add() => countState.value++;
}
```

而ValueListenableBuilder负责在页面上响应变化做到局部刷新，ValueNotifier和ValueListenableBuilder配套使用。

有数据源之后，需要借助InheritedWidget来放在树上，其下child随时取用，这个状态管理类CounterInherited里有个变量是CounterNotify类型的，也就是数据源。

```dart
//类似于Provider类
class CounterInherited extends InheritedWidget {
  const CounterInherited({
    super.key,
    required super.child,
    required this.counterNotify,
  });
  final CounterNotify counterNotify;
  static CounterInherited of(BuildContext context) {
    var inherited = context.dependOnInheritedWidgetOfExactType<CounterInherited>();
    assert(inherited != null, '在context中未找到CounterInherited类');
    return inherited!;
  }

  @override
  bool updateShouldNotify(covariant CounterInherited oldWidget) {
    return oldWidget.counterNotify != counterNotify;
  }
}
```

万事具备，只欠显示在页面上，ValueNotifier和ValueListenableBuilder配套使用，一个负责页面端显示，一个负责状态变化及通知。其实更严格地说是ValueListenable和ValueListenableBuilder配套使用，ValueNotifier只是抽象类ValueListenable的继承者，还有熟悉的类Animation也是属于ValueListenable，

```dart
//构造函数
ValueListenableBuilder({
Key? key, 
required ValueListenable<T> valueListenable, //对应数据源的变量
required ValueWidgetBuilder<T> builder, 
Widget? child
})
//抽象类ValueListenable的继承者有: ValueNotifier、Animation、RouteInformationProvider、SelectionHandler。
```

用InheritedWidget和ValueListenable组装的计数器完成，代码如下：

```dart
//空安全,Flutter3.3.2
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(home: CounterInheritedPage()));
class CounterInheritedPage extends StatelessWidget {
  const CounterInheritedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CounterInherited(
      counterNotify: CounterNotify(),
      child: Scaffold(
        appBar: AppBar(title: const Text('InheritedWidget计数器')),
        //需要Builder促使context实例,否则无context
        body: Builder(builder: (context) {
          var provider = CounterInherited.of(context).counterNotify;
          return Center(
            child: GestureDetector(
              onTap: provider.add,
              //局部刷新
              child: ValueListenableBuilder(
                valueListenable: provider.countState,
                builder: (context, value, child) {
                  return Text('${provider.countState.value}');
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}

//类似于Provider类
class CounterInherited extends InheritedWidget {
  const CounterInherited({
    super.key,
    required super.child,
    required this.counterNotify,
  });
  final CounterNotify counterNotify;
  static CounterInherited of(BuildContext context) {
    var inherited = context.dependOnInheritedWidgetOfExactType<CounterInherited>();
    assert(inherited != null, '在context中未找到CounterInherited类');
    return inherited!;
  }

  @override
  bool updateShouldNotify(covariant CounterInherited oldWidget) {
    return oldWidget.counterNotify != counterNotify;
  }
}

//存放需要监听的变量
class CounterNotify extends ChangeNotifier {
  final countState = ValueNotifier<int>(0);
  void add() => countState.value++;
}
```

