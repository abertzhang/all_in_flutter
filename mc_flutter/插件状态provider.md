### provider应用场景

### 学习资源

```
https://pub.dev/documentation/provider/latest/
```

### 依赖导包

```
provider: ^4.0.2
import ‘package:provider/provider.dart’;
```

### Provider构造函数

```
Provider({
Key key, 
@required Create<T> create, 
Dispose<T> dispose, 
bool lazy, 
TransitionBuilder builder, 
Widget child
})
Provider.value({
Key key, 
@required T value, 
UpdateShouldNotify<T> 
updateShouldNotify, 
TransitionBuilder builder, 
Widget child
})
```

```
Provider({
    Key key,
    @required ValueBuilder<T> builder,
    Disposer<T> dispose,
    Widget child,
  }) : this._(
          key: key,
          delegate: BuilderStateDelegate<T>(builder, dispose: dispose),
          updateShouldNotify: null,
          child: child,
        );
```

```
typedef ValueBuilder<T> = T Function(BuildContext context);
```

```
typedef Disposer<T> = void Function(BuildContext context, T value);
```



### 相关类

```
MultiProvider
ChangeNotifierProvider
ListenableProvider
ValueListenableProvider
StreamProvider
FutureProvider
InheritedProvider
DeferredInheritedProvider<T, R>
ProxyProvider0-6//最多支持6个数据源
ListenableProxyProvider0-6
ChangeNotifierProxyProvider0-6
Consumer0-6//最多支持6个数据源
Selector0-6//最多支持6个数据源

```

```
Provider:provider中最基础的Provider. 接收一个值，并把它暴露出去。
ListenableProvider:用于监听对象的 provider . ListenableProvider会监听对象并在监听被调用的时候rebuild依赖它的组件.
ChangeNotifierProvider
一个特殊的 ListenableProvider 用于改变通知. 它会在需要的时候自动调用 ChangeNotifier.dispose.
ValueListenableProvider:侦听ValueListenable并仅公开ValueListenable.value。
StreamProvider:监听 Stream流，并暴露出最后emitt的值.
FutureProvider:接收一个 Future ，并在future完成时更新依赖。
ProxyProvider :
```

### ChangeNotifierProvider

混入了 `ChangeNotifier` 的类自动帮我们实现了听众管理，所以 ListenableProvider 同样也可以接收混入了 ChangeNotifier 的类。

ChangeNotifierProvider 则更为简单，它能够对子节点提供一个 **继承** / **混入** / **实现** 了 ChangeNotifier 的类。通常我们只需要在 Model 中 `with ChangeNotifier` ，然后在需要刷新状态的时候调用 `notifyListeners` 即可

```
ChangeNotifierProvider({
    Key key,
    @required ValueBuilder<T> builder,
    Widget child,
}) : super(key: key, builder: builder, dispose: _disposer, child: child); 
  /// Provides an existing [ChangeNotifier].
ChangeNotifierProvider.value({
    Key key,
    @required T value,
    Widget child,
  }) : super.value(key: key, value: value, child: child);
}
```

### ListenableProvider 

```
ListenableProvider 提供（provide）的对象是**继承**了 Listenable 抽象类的子类。由于无法混入，所以通过继承来获得 Listenable 的能力，同时必须实现其 `addListener / removeListener` 方法，手动管理收听者。显然，这样太过复杂，我们通常都不需要这样做。
```

### ValueListenableProvider 

```
ValueListenableProvider({
Key key, 
@required Create<ValueNotifier<T>> create, UpdateShouldNotify<T> updateShouldNotify, 
bool lazy, 
TransitionBuilder builder, 
Widget child
})
ValueListenableProvider.value({
Key key, 
@required ValueListenable<T> value, 
UpdateShouldNotify<T> updateShouldNotify, 
TransitionBuilder builder, 
Widget child
})
```

```
ValueListenableProvider 用于提供实现了 继承 / 混入 / 实现 了 ValueListenable 的 Model。它实际上是专门用于处理只有一个单一变化数据的 ChangeNotifier。
class ValueNotifier<T> extends ChangeNotifier implements ValueListenable<T>
通过 ValueListenable 处理的类不再需要数据更新的时候调用 notifyListeners。
```

### StreamProvider

```
StreamProvider({
Key key, 
@required Create<Stream<T>> create, 
T initialData, 
ErrorBuilder<T> catchError, 
UpdateShouldNotify<T> updateShouldNotify, 
bool lazy, 
TransitionBuilder builder, 
Widget child})

StreamProvider.value({
Key key, 
@required Stream<T> value, 
T initialData, 
ErrorBuilder<T> catchError, 
UpdateShouldNotify<T> updateShouldNotify, 
bool lazy, 
TransitionBuilder builder, 
Widget child
})
```

```
StreamProvider 专门用作提供（provide）一条 Single Stream。
T initialData：你可以通过这个属性声明这条流的初始值。
ErrorBuilder<T> catchError：这个属性用来捕获流中的 error。在这条流 addError 了之后，你会能够通过 T Function(BuildContext context, Object error) 回调来处理这个异常数据。实际开发中它非常有用。
updateShouldNotify：和之前的回调一样，这里不再赘述。
除了这三个构造方法都有的属性以外，StreamProvider 还有三种不同的构造方法。
StreamProvider(...)：默认构造方法用作创建一个 Stream 并收听它。
StreamProvider.controller(...)：通过 builder 方式创建一个 StreamController<T>。并且在 StreamProvider 被移除时，自动释放 StreamController。
StreamProvider.value(...)：监听一个已有的 Stream 并将其 value 提供给子孙节点。
```

### FutureProvider

```
FutureProvider({
Key key, 
@required Create<Future<T>> create, 
T initialData, 
ErrorBuilder<T> catchError, 
UpdateShouldNotify<T> updateShouldNotify, 
bool lazy, 
TransitionBuilder builder, 
Widget child
})

FutureProvider.value({
Key key, @required Future<T> value, T initialData, ErrorBuilder<T> catchError, UpdateShouldNotify<T> updateShouldNotify, TransitionBuilder builder, Widget child})
```

```
FutureProvider，它提供了一个 Future 给其子孙节点，并在 Future 完成时，通知依赖的子孙节点进行刷新
```

### InheritedProvider

```
InheritedProvider({
Key key, 
Create<T> create, 
T update(BuildContext context, T value),
UpdateShouldNotify<T> updateShouldNotify, 
void debugCheckInvalidValueType(T value), 
StartListening<T> startListening, 
Dispose<T> dispose, 
TransitionBuilder builder, 
bool lazy, 
Widget child
})

InheritedProvider.value({
Key key, 
@required T value, 
UpdateShouldNotify<T> updateShouldNotify, 
StartListening<T> startListening, 
bool lazy, 
TransitionBuilder builder, 
Widget child
})
```

### DeferredInheritedProvider

```
DeferredInheritedProvider({Key key, @required Create<T> create, Dispose<T> dispose, @required DeferredStartListening<T, R> startListening, UpdateShouldNotify<R> updateShouldNotify, bool lazy, TransitionBuilder builder, Widget child})

DeferredInheritedProvider.value({Key key, @required T value, @required DeferredStartListening<T, R> startListening, UpdateShouldNotify<R> updateShouldNotify, bool lazy, TransitionBuilder builder, Widget child})
```

### Consumer

```
//只有 Bar 会在A更新的时候 rebuild . Foo 和 Baz 不会更新.
Foo(
  child: Consumer<A>(
    builder: (_, a, child) {
      return Bar(a: a, child: child);
    },
    child: Baz(),
  ),
)
```

### Selector

**Selector控制的粒度比Consumer更细，Consumer是监听一个Provider中所有数据的变化，Selector则是监听某一个/多个值的变化**。

```
Selector({
    Key key,
//当父widget请求更新selector返回值与之前返回值不同时会调builder
    @required ValueWidgetBuilder<S> builder,
    //selector返回具体的值，返回的值必须继承自==而且不能为null
    @required S Function(BuildContext, A) selector,
    Widget child,
  })
```

```
//只有在list长度改变的时候才会rebuild. item改变的时候不会更新
Selector<List, int>(
  selector: (_, list) => list.length,
  builder: (_, length, __) {
    return Text('$length');
  }
);
```

```
//分别用consumer和selector来包裹,selector更细腻范围小
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MaterialApp(home: DemoSelector()));

class DemoSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (_) => Counter(),
      child: Scaffold(
          appBar: AppBar(title: Text('Consumer-Select')),
          body: Center(
              child: Builder(
                  builder: (context) => Column(children: <Widget>[
                        Selector(
                          selector: (_, Counter counter) => counter.value1,
                          builder: (context, data, child) {
                            print('Text1重绘了');
                            return Text('Text1: $data');
                          },
                        ),
                        Consumer(
                            builder: (context, Counter counter, child) {
                          print('Text2重绘了');
                          return Text('Text2 : ${counter.value2}');
                        }),
                        RaisedButton(
                          onPressed: () {
                            print('Button1被点击');
                            Provider.of<Counter>(context, listen: false).add1();
                          },
                          child: Text('Button1'),
                        ),
                        RaisedButton(
                            onPressed: () {
                              print('Button2被点击');
                              Provider.of<Counter>(context, listen: false)
                                  .add2();
                            },
                            child: Text('Button2'))
                      ])))));
}

class Counter with ChangeNotifier {
  int _count1 = 0;
  int _count2 = 100;

  int get value1 => _count1;

  int get value2 => _count2;

  void add1() {
    _count1++;
    notifyListeners();
  }

  void add2() {
    _count2++;
    notifyListeners();
  }
}
```

### ProxyProvider 

ProxyProvider 将其他provider的多个值整合成一个新的对象, 并将结果发送给 Provider.

该新对象会在任何一个它依赖的provides更新的时候更新.

下面的例子用 ProxyProvider 基于counter 创建 translations.


```
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() => runApp(MaterialApp(home: DemoProxyProvider()));
class DemoProxyProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => Counter()),
            ProxyProvider<Counter, Translations>(
                update: (_, Counter counter, __) => Translations(counter.count))
          ],
          child: Scaffold(
              appBar: AppBar(title: Text('proxyprovider')),
              body: Builder(
                  builder: (context) => Column(children: [
                        Text('${context.select((Translations t) => t.title)}'),
                        Text('${context.watch<Counter>().count}'),
                        RaisedButton(
                            child: Text('计数+1'),
                            onPressed: () => context.read<Counter>().addCount())
                      ]))));
}
class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void addCount() {
    _count++;
    notifyListeners();
  }
}
class Translations {
  int _value;
  Translations(this._value);
  String get title => '你点击了$_value次';
}
```

它可以有多个变化来源, 如:

- ProxyProvider vs ProxyProvider2 vs ProxyProvider3, ...

类名后面的数字来源于其他providers .

- ProxyProvider vs ChangeNotifierProxyProvider vs ListenableProxyProvider, ...

他们的工作方式相似,但 ChangeNotifierProxyProvider 会将它的值发送到ChangeNotifierProvider，而不是发送结果到 Provider, 

### ChangeNotifierProxyProvider 

```
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Person with ChangeNotifier {
  //当人物的年龄改变时候，Job的内容会自动改变
  Person({this.name, this.age});
  final String name;
  int age;
  void increaseAge() {
    this.age++;
    notifyListeners();
  }
}
class Job with ChangeNotifier {
  Job(this.person, {
    this.career,
  });
  final Person person;
  String career;
  String get title {
    if (person.age >= 28) return 'Dr. ${person.name}, $career PhD';
    return '${person.name}, Student';
  }
}

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider<Person>(
                create: (_) => Person(name: 'Yohan', age: 25)),
            ChangeNotifierProxyProvider<Person, Job>(
              create: (BuildContext context) =>
                  Job(Provider.of<Person>(context, listen: false)),
              update: (BuildContext context, Person person, Job job) =>
                  Job(person, career: 'Vet'),
            ),
          ],
          child: MyApp()
      )
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>MaterialApp(home: MyHomePage());
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context)=>Scaffold(
      appBar: AppBar(
          title: Text('Provider Class')
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Hi, may name is ${context.select((Job j) => j.person.name)}',
          ),
          Text('Age: ${context.select((Job j) => j.person.age)}'),
          Text(context.watch<Job>().title)
        ]
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('Add'),
        onPressed: () => context.read<Person>().increaseAge(),
      ));
}
```



### 简例01页面级别

```
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() => runApp(MaterialApp(home: MyHome()));
class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => Counter(),
        child: Builder(
            builder: (BuildContext context) => Scaffold(
                appBar: AppBar(
                    title: Text(
                        "演示:${Provider.of<Counter>(context).value}")),
                body: Column(children: <Widget>[
                  Consumer(
                  builder: (BuildContext context, Counter counter,
                          Widget child) =>
                      Text("Consumer包裹:${counter.value}")),
                  Consumer(
                  builder: (BuildContext context, Counter counter,
                          Widget child) =>
                      RaisedButton(
                        child: Icon(Icons.add),
                        onPressed: counter.addValue,
                      ))
                ]))));
  }
}
class Counter with ChangeNotifier {
  int _count = 1;
  int get value => _count;
  void addValue() {
    _count++;
    notifyListeners();
  }
}
```



### 简例02应用级别

```
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Counter())],
      child: Consumer(
          builder: (BuildContext context, Counter counter, Widget child) =>
              MaterialApp(
                  theme: ThemeData(primaryColor: counter.themeColor),
                  home: MyHome())));
}
class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Provider程序级别演示")),
        body: Column(children: <Widget>[
          RaisedButton(
              color: Colors.green,
              child: Text("主题色变绿"),
              onPressed: () => Provider.of<Counter>(context, listen: false)
                  .changeThemeColor(color: Colors.green)),
          RaisedButton(
              color: Colors.orangeAccent,
              child: Text("主题色变黄"),
              onPressed: () => Provider.of<Counter>(context, listen: false)
                  .changeThemeColor(color: Colors.orangeAccent))
        ]));
  }
}
class Counter with ChangeNotifier {
  Color _themeColor = Colors.redAccent;
  Color get themeColor => _themeColor;
  Color changeThemeColor({Color color: Colors.teal}) {
    _themeColor = color;
    notifyListeners();
    return _themeColor;
  }
}
```

### 简例03

```
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(context.widget.toString());
    return ChangeNotifierProvider(
      create: (_) => LoanInfo2(),
      child: MaterialApp(home: RepayScaffold()),
    ); //MaterialApp(home: RepayScaffold());
  }
}
class RepayScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(context.widget.toString());
    return ChangeNotifierProvider<LoanInfo>(
        create: (_) => LoanInfo(),
        child: Scaffold(
            appBar: AppBar(title: Text('还款计划示算页')),
            body: Builder(builder: (context) {
              return Center(
                  child: Column(children: <Widget>[
                Consumer<LoanInfo>(
                  builder: (context, model, child) {
                    return Text('${model.loanAmount}');
                  },
                ),
                RaisedButton(
                    child: Text('到第二页'),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return SecondScaffold();
                      }));
                    })
              ]));
            })));
  }
}

class SecondScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(context.widget.toString());
    return Scaffold(
        appBar: AppBar(),
        body: Builder(
            builder: (context) => Column(children: <Widget>[
                  Consumer<LoanInfo2>(builder: (context, model, child) {
                    return Text('第二页:${model.loanAmount}');
                  }),
                  RaisedButton(
                    child: Text('转到第一页'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ])));
  }
}

class LoanInfo with ChangeNotifier {
  double _loanAmount; //贷款本金
  double get loanAmount => _loanAmount ?? 0;

  @override
  void dispose() {
    super.dispose();
  }
}

class LoanInfo2 with ChangeNotifier {
  double _loanAmount; //贷款本金
  double get loanAmount => _loanAmount ?? 10000;

  LoanInfo2();

  @override
  void dispose() {
    super.dispose();
  }
}
```

