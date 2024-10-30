---
title: 库flutter_bloc
tags:
  - 状态管理
  - null
categories: 插件
copyright: true
top: 1
toc: true
sidebar: true
date: 2021-03-02 15:04:54
updated_at: 2021-03-02 15:04:54
---
摘要:
    Flutter快速开发App
    
<!-- more -->

### 依赖导包

```
dependencies:
  bloc: ^6.1.3
  flutter_bloc: ^6.1.3
  equatable: ^1.2.5
import 'package:flutter_bloc/flutter_bloc.dart';
```

### 类Bloc<Event, State>

##### 继承关系

```
Inheritance
Object Stream<State> Cubit<State> Bloc
Implemented types
EventSink<Event>
```

##### 构造函数

```
Bloc(State initialState)
```

##### 私有属性

```
first → Future<State>
hashCode → int
state → State
isBroadcast → bool
isEmpty → Future<bool>
last → Future<State>
length → Future<int>
runtimeType → Type
single → Future<State>
```



##### 私有方法

```
any(bool test(State element)) → Future<bool>
asBroadcastStream({void onListen(StreamSubscription<State> subscription), void onCancel(StreamSubscription<State> subscription)}) → Stream<State>
asyncExpand<E>(Stream<E> convert(State event)) → Stream<E>
asyncMap<E>(FutureOr<E> convert(State event)) → Stream<E>
cast<R>() → Stream<R>
contains(Object needle) → Future<bool>
distinct([bool equals(State previous, State next)]) → Stream<State>
drain<E>([E futureValue]) → Future<E>
elementAt(int index) → Future<State>
every(bool test(State element)) → Future<bool>
expand<S>(Iterable<S> convert(State element)) → Stream<S>
firstWhere(bool test(State element), {State orElse()}) → Future<State>
fold<S>(S initialValue, S combine(S previous, State element)) → Future<S>
forEach(void action(State element)) → Future
handleError(Function onError, {bool test(dynamic error)}) → Stream<State>
join([String separator = ""]) → Future<String>
lastWhere(bool test(State element), {State orElse()}) → Future<State>
listen(void onData(State), {Function onError, void onDone(), bool cancelOnError}) → StreamSubscription<State>
map<S>(S convert(State event)) → Stream<S>
noSuchMethod(Invocation invocation) → dynamic
onChange(Change<State> change) → void
pi
pe(StreamConsumer<State> streamConsumer) → Future
reduce(State combine(State previous, State element)) → Future<State>
singleWhere(bool test(State element), {State orElse()}) → Future<State>
skip(int count) → Stream<State>
skipWhile(bool test(State element)) → Stream<State>
take(int count) → Stream<State>
takeWhile(bool test(State element)) → Stream<State>
timeout(Duration timeLimit, {void onTimeout(EventSink<State> sink)}) → Stream<State>
toList() → Future<List<State>>
toSet() → Future<Set<State>>
toString() → String
transform<S>(StreamTransformer<State, S> streamTransformer) → Stream<S>
where(bool test(State event)) → Stream<State>
```

##### 公有方法

```
add(Event event) → void
addError(Object error, [StackTrace stackTrace]) → void
close() → Future<void>
emit(State state) → void
mapEventToState(Event event) → Stream<State>
onError(Object error, StackTrace stackTrace) → void
onEvent(Event event) → void
onTransition(Transition<Event, State> transition) → void
transformEvents(Stream<Event> events, TransitionFunction<Event, State> transitionFn) → Stream<Transition<Event, State>>
transformTransitions(Stream<Transition<Event, State>> transitions) → Stream<Transition<Event, State>>

```

##### 静态方法

```
observer ↔ BlocObserver
```

### 类BlocObserver

##### 构造函数

```
BlocObserver()
```

##### 私有方法

```
toString() → String
noSuchMethod(Invocation invocation) → dynamic
```

##### 公有方法

```
onChange(Cubit cubit, Change change) → void
onClose(Cubit cubit) → void
onCreate(Cubit cubit) → void
onError(Cubit cubit, Object error, StackTrace stackTrace) → void
onEvent(Bloc bloc, Object event) → void
onTransition(Bloc bloc, Transition transition) → void
```

### 类Cubit<State>

##### 继承关系

```
Inheritance
Object Stream<State> Cubit
Implementers
Bloc
```

构造函数

```
Cubit(State _state)
```

公有方法

```
addError(Object error, [StackTrace stackTrace]) → void
close() → Future<void>
emit(State state) → void
listen(void onData(State), {Function onError, void onDone(), bool cancelOnError}) → StreamSubscription<State>
onChange(Change<State> change) → void
onError(Object error, StackTrace stackTrace) → void
```

##### 私有方法

```
any(bool test(State element)) → Future<bool>
asBroadcastStream({void onListen(StreamSubscription<State> subscription), void onCancel(StreamSubscription<State> subscription)}) → Stream<State>
asyncExpand<E>(Stream<E> convert(State event)) → Stream<E>
asyncMap<E>(FutureOr<E> convert(State event)) → Stream<E>
cast<R>() → Stream<R>
contains(Object needle) → Future<bool>
distinct([bool equals(State previous, State next)]) → Stream<State>
drain<E>([E futureValue]) → Future<E>
elementAt(int index) → Future<State>
every(bool test(State element)) → Future<bool>
expand<S>(Iterable<S> convert(State element)) → Stream<S>
firstWhere(bool test(State element), {State orElse()}) → Future<State>
fold<S>(S initialValue, S combine(S previous, State element)) → Future<S>
forEach(void action(State element)) → Future
handleError(Function onError, {bool test(dynamic error)}) → Stream<State>
join([String separator = ""]) → Future<String>
lastWhere(bool test(State element), {State orElse()}) → Future<State>
map<S>(S convert(State event)) → Stream<S>
pipe(StreamConsumer<State> streamConsumer) → Future
reduce(State combine(State previous, State element)) → Future<State>
singleWhere(bool test(State element), {State orElse()}) → Future<State>
skip(int count) → Stream<State>
skipWhile(bool test(State element)) → Stream<State>
take(int count) → Stream<State>
takeWhile(bool test(State element)) → Stream<State>
timeout(Duration timeLimit, {void onTimeout(EventSink<State> sink)}) → Stream<State>
toList() → Future<List<State>>
toSet() → Future<Set<State>>
toString() → String
transform<S>(StreamTransformer<State, S> streamTransformer) → Stream<S>
where(bool test(State event)) → Stream<State>

```

### 类Transition<Event, State>

##### 继承关系

```
Inheritance
Object Change<State> Transition
Annotations
@immutable
```

##### 构造函数

```
Transition({
    @required State currentState, 
    @required Event event, 
    @required State nextState
})
```

##### 私有属性

```
currentState → State
nextState → State
untimeType → Type
```

##### 公有属性

```
event → Event
hashCode → int

```

### 类Change<State>

##### 继承关系

```
Implementers
Transition
Annotations
@immutable
```

##### 构造函数

```
Change({
@required State currentState, @required State nextState})
```

### 预定义

```
typedef TransitionFunction<Event, State> 
= Stream<Transition<Event, State>>
    Function(Event);
```

### 简例01

```
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc(),
        child: BlocBuilder<ThemeBloc, ThemeData>(builder: (context, theme) {
          return MaterialApp(
              title: 'Flutter Demo',
              home: BlocProvider(
                create: (context) => CounterBloc(),
                child: CounterPage(),
              ),
              theme: theme);
        }));
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Counter')),
        body: BlocBuilder<CounterBloc, int>(builder: (context, count) {
          return Center(
              child: Text('$count', style: TextStyle(fontSize: 24.0)));
        }),
        floatingActionButton: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: FloatingActionButton(
                      child: Icon(Icons.add),
                      onPressed: () => BlocProvider.of<CounterBloc>(context)
                          .add(CounterEvent.increment))),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: FloatingActionButton(
                      child: Icon(Icons.remove),
                      onPressed: () => BlocProvider.of<CounterBloc>(context)
                          .add(CounterEvent.decrement))),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: FloatingActionButton(
                    child: Icon(Icons.update),
                    onPressed: () => BlocProvider.of<ThemeBloc>(context)
                        .add(ThemeEvent.toggle),
                  ))
            ]));
  }
}

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.increment:
        yield state + 1;
        break;
    }
  }
}
enum ThemeEvent { toggle }
class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  @override
  ThemeData get initialState => ThemeData.light();
  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
    switch (event) {
      case ThemeEvent.toggle:
        yield state == ThemeData.dark() ? ThemeData.light() : ThemeData.dark();
        break;
    }
  }
}
```

##### 简例02

```
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(Cubit cubit, Change change) {
    print(change);
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(cubit, error, stackTrace);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider(
          create: (_) => CounterBloc(),
          child: CounterPage(),
        ));
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Counter')),
        body: BlocBuilder<CounterBloc, int>(builder: (_, count) {
          return Center(
            child: Text('$count', style: Theme.of(context).textTheme.headline1),
          );
        }),
        floatingActionButton: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () =>
                      context.read<CounterBloc>().add(CounterEvent.increment),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: FloatingActionButton(
                    child: const Icon(Icons.remove),
                    onPressed: () =>
                        context.read<CounterBloc>().add(CounterEvent.decrement),
                  ))
            ]));
  }
}

enum CounterEvent { increment, decrement }
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(3);
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.decrement:
        yield state - 1;
        break;
      case CounterEvent.increment:
        yield state + 1;
        break;
      default:
        addError(Exception('unsupported event'));
    }
  }
}
```

