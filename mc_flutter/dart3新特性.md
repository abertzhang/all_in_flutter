### 类Record

```dart
abstract final class Record {
  Type get runtimeType;
  bool operator ==(Object other);
  String toString();
}
```

```dart
void main() => runApp(MaterialApp(home: HomePage()));
class HomePage extends StatelessWidget {
  HomePage({super.key});
  final color = (red: 255, green: 255, blue: 166);
  final List<(Widget, String)> items = <(Widget, String)>[
    (const Icon((Icons.home)), 'Home'),
    (const Icon((Icons.search)), 'Search'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dart3新特新')),
      body: Column(
        children: [
          Text(color.runtimeType.toString()),
          ...items.map((e) => Row(
                children: [e.$1, Text(e.$2)],
              )),
        ],
      ),
    );
  }
}
```

### ![image.png](http://qiniu-article.myflutter.cn/img/1db622822a05483f9660dc75db509f5f~tplv-k3u1fbpfcp-zoom-in-crop-mark:1512:0:0:0.awebp)if-case

```dart
void main() => runApp(MaterialApp(home: HomePage()));
class HomePage extends StatelessWidget {
  HomePage({super.key});
  final json = {'name': 'abe', 'age': 30};
  String getJsonStr() {
    if (json case {'name': String name, 'age1': int age}) {
      return '${name}s age is $age';
    } else if (json case {'name': 'abe', 'age': int age}) {
      return 'abe is $age years old';
    } else {
      return 'nothing';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dart3新特新')),
      body: Column(
        children: [
          Text(getJsonStr()),
        ],
      ),
    );
  }
}
```

```dart
void main() => runApp(MaterialApp(home: HomePage())
class HomePage extends StatelessWidget {
  final String? title = 'dart3';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dart3新特新')),
      body: Column(
        children: [
          if (title case final String t) ...[
            Text(t),
          ],
          if (title case null) ...[Text('Nothing')] else ...[Text('String')]
        ],
      ),
    );
  }
}
```



### When-case

```dart
void main() => runApp(MaterialApp(home: HomePage()));
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final _currentPage = 10;
  final _lastPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dart3新特新')),
      body: Column(
        children: [
          Text(switch (_currentPage) {
            0 => 'Start',
            1 => 'Next',
            _ when _currentPage == _lastPage => 'Last',
            _ => 'Confirm',
          }),
        ],
      ),
    );
  }
}
```

### 类关键字

![截屏2023-12-26 19.39.41](http://qiniu-article.myflutter.cn/img/%E6%88%AA%E5%B1%8F2023-12-26%2019.39.41.png)

### List增强

```dart
void main(){
final [first,...,last]=[2,3,4,6,8];
  print('$first,$last');
}
//2,8
```

```dart
void main(){
final [first,...,last]=[2,8];
  print('$first,$last');
}
//2,8
```

```dart
void main(){
final [first,...,last]=[2];
  print('$first,$last');
}
//Uncaught Error: Bad state: Pattern matching error
```

### Record解构

```dart
void main(){
const position=(x:0,y:2);
  final(x:x1,y:y1)=position;
  print('x1:$x1,y1:$y1');
  
  final (:x,:y)=position;
   print('x:$x,y:$y');
}
/*
x1:0,y1:2
x:0,y:2
*/
```

### switch-when

```dart
void main(){
  List<int> numbers=[1,2,3];
  final result=switch(numbers){
      [...,final num,_]=>'Number is $num',
      []||[_]=>'Need more numbers',
  };
  print(result);
}
```

```dart
void main(){
  final date = DateTime(2023,12,3);
  print(formatDate(date));
}

String formatDate(DateTime dateTime){
  final today = DateTime.now();
  final difference = dateTime.difference(today);
  return switch(difference){
      Duration(inDays:0)=>'today',
      Duration(inDays:1)=>'tomorrow',
      Duration(inDays:-1)=>'yesterday',
      Duration(inDays:final days,isNegative:true)=>'${days.abs()} days ago',
      Duration(inDays:final days)=>'$days days from now',
  
  };
}
```

### enum和Record

```dart
void main(){
  bool isAuth =true;
  bool isPaid=true;
  final type = switch((isAuth,isPaid)){
      (true,true)=>AccountType.vip,
      (true,false)=>AccountType.member,
      (_,_)=>AccountType.guest,
  };
  print(type.toString());
}

enum AccountType{
  vip,member,guest,
}
//AccountType.vip
```

### Record的Extension

```dart
void main(){
const Student student =(name:'zhang',number:19);
  student.sayHi();
}
typedef Student=({String name,int number});
extension StudentExt on Student{
  void sayHi(){
    print('Hi,I am ${this.name} No.$number');
  }
}
```

### for-indexed

```dart
void main(){
final sttudents = ['Anny','Berry','Alan','Hank'];
  for(final(index,element) in sttudents.indexed){
    print('$index,$element');
  }
}
```

### FutureBuilder

```dart
void main() => runApp(MaterialApp(home: HomePage()));
class HomePage extends StatelessWidget {
  final String? title = 'dart3';
  Future<String> getString() async {
    return Future.delayed(Duration(seconds: 3), () => 'Seconde 3...');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dart3新特新')),
      body: Column(
        children: [
          FutureBuilder(
              future: getString(),
              builder: (ctx, snapshot) {
                return switch (snapshot) {
                  final snap when snapshot.hasData => Text(snap.data ?? ''),
                  final AsyncSnapshot<String> shot when !shot.hasError => Text('wait...'),
                  _ => Text('Oops'),
                };
              })
        ],
      ),
    );
  }
}
```

### sealed类

```dart
void main(){
  final car = getCar();
  final name =switch(car){
    _ when car is Tesla=>'Tesla',
    Tesla(name:final name2)=>name2,
    Bmw()=>'Bmw',
    Bmw(:final name)=>name,   
  };
  print(name);
}
sealed class Car{
  final String name;
  Car(this.name);
}
class Tesla extends Car{Tesla(super.name);}
class Bmw extends Car{Bmw(super.name);}
Car getCar()=>Bmw('blue');
```

### switch

```dart
void main(){
int score = 69;
var info = switch (score) {
  >=40 && < 60 => 'D',
  == 100 => 'A+',
  >= 90 && < 100 => 'A',
  >= 80 && < 90 => 'B',
  >= 70 && < 80 => 'C',
  _ => 'E',
  };
  print(info);
}
```

### yield

```dart
void main() {
  final countdown = countDown(5);
  for (final value in countdown) {
    print(value);
  }
}
Iterable<int> countDown(int from) sync* {
  while (from > 0) {
    yield from;
    from--;
  }
}
```

```dart
main() {
  getEmoji(10).forEach(print);
}

Iterable<String> getEmoji(int count) sync* {
  Runes first = Runes('\u{1f47f}');
  for (int i = 0; i < count; i++) {
    yield String.fromCharCodes(first.map((e) => e + i));
  }
}
```

```dart
main() {
  getEmojiWithTime(10).forEach(print);
}
Iterable<String> getEmojiWithTime(int count) sync* {
  yield* getEmoji(count)
      .map((e) => '$e -- ${DateTime.now().toIso8601String()}');
}
Iterable<String> getEmoji(int count) sync* {
  Runes first = Runes('\u{1f47f}');
  for (int i = 0; i < count; i++) {
    yield String.fromCharCodes(first.map((e) => e + i));
  }
}
```

```dart
main() {
  fetchEmojis(10).listen(print);
}
Stream<String> fetchEmojis(int count) async* {
  for (int i = 0; i < count; i++) {
    yield await fetchEmoji(i);
  }
}
Future<String> fetchEmoji(int count) async {
  Runes first = Runes('\u{1f47f}');
  print('加载开始--${DateTime.now().toIso8601String()}');
  await Future.delayed(Duration(seconds: 2)); //模拟耗时
  print('加载结束--${DateTime.now().toIso8601String()}');
  return String.fromCharCodes(first.map((e) => e + count));
}
```

```dart
main() {
  getEmojiWithTime(10).listen(print);
}
Stream<String> getEmojiWithTime(int count) async* {
  yield* fetchEmojis(count).map((e) => '$e -- ${DateTime.now().toIso8601String()}');
}
Stream<String> fetchEmojis(int count) async*{
  for (int i = 0; i < count; i++) {
    yield await fetchEmoji(i);
  }
}
Future<String> fetchEmoji(int count) async{
  Runes first = Runes('\u{1f47f}');
  await Future.delayed(Duration(seconds: 2));//模拟耗时
  return String.fromCharCodes(first.map((e) => e + count));
}
```

```dart
/*
1. yield 和 yield* 就像 return，但它们不会结束函数；
2.yield 和 yield* 只能在 async* 或 sync* 生成器函数中使用；
3. yield 和 yield* 在 async* 中使用时，返回Stream；
4.yield 和 yield* 在 sync* 中使用时，返回 Iterable；
5.yield 用于生成值，而 yield* 用于把当前生成器函数的流程委托给另一个生成器函数。
*/
```

```dart
//如果生成器是递归的，可以使用 yield* 来提高性能。
Iterable<int> naturalsDownFrom(int n) sync* {
  if (n > 0) {
    yield n;
    yield* naturalsDownFrom(n - 1);
  }
}
```



### 参考资料

[Flutter 3.13 生命周期新组件 AppLifecycleListener](https://juejin.cn/post/7269431378902269992)

[dart3高效语法](https://www.bilibili.com/video/BV1si4y1Y7yY/?spm_id_from=333.1007.top_right_bar_window_history.content.click&vd_source=b9aff273129955972ba5e761af57d33d)

[Dart 内置类型之 Record，不同于元组](https://juejin.cn/post/7287773353308373047)

[Dart 3.0 语法新特性 | 类型修饰符](https://juejin.cn/post/7233403727755673661?searchId=2023122622185643E40804F67B5A73AFE4)

[Dart 3.0 语法新特性 | Records 记录类型](https://juejin.cn/post/7233067863500849209)

[Dart 3.0 语法新特性 | 模式匹配 Patterns](https://juejin.cn/post/7240838046789648442?searchId=2023122622185643E40804F67B5A73AFE4)

[Flutter - Dart 3α 新特性 Record 和 Patterns 的提前预览讲解](https://juejin.cn/post/7194741144482218045?from=search-suggest)

[Dart 3.0 语法新特性 | switch 匹配加强](https://juejin.cn/post/7245975053233455164?from=search-suggest)

[sync* 和 async* 、yield 和yield* 、async 和 await](https://juejin.cn/post/6844904163407577096?searchId=202312262336482E7BE7E83FE05386B683)

[dart语言--生成器、可调用类、isolates、typedefs、元数据注解、注释](https://juejin.cn/post/6844903909702500365?from=search-suggest)

[Flutter 小技巧之 3.13 全新生命周期 AppLifecycleListener](https://juejin.cn/post/7269644295588708413)