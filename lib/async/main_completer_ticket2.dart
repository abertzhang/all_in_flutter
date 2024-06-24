import 'dart:async';
import 'dart:math';

void main() async {
  String str = await getCountOfTicket();
  print(str);
  //无法获取到结果
  getCountOfTicket().then((value) => print);
  String result = await nestedMethod();
  print(result);
}

Future<Map> findLastTicket(String value) {
  final int count = Random().nextInt(4) + 1;
  return Future.delayed(Duration(seconds: count), () {
    return {
      'count': count,
      'city': value,
    };
  });
}

Future<String> getCountOfTicket() async {
  final Completer<String> completer = Completer();
  findLastTicket('北京').then((value) {
    if (!completer.isCompleted) {
      completer.complete('${value['city']} - ${value['count']}');
    }
  });

  findLastTicket('上海').then((value) {
    if (!completer.isCompleted) {
      completer.complete('${value['city']} - ${value['count']}');
    }
  });
  findLastTicket('郑州').then((value) {
    if (!completer.isCompleted) {
      completer.complete('${value['city']} - ${value['count']}');
    }
  });
  return completer.future;
}

Future<String> nestedMethod() {
  final Completer<int> countCompleter = Completer();
  final Completer<String> markCompleter = Completer();
  countCompleter.complete(10);
  countCompleter.future.then((value) => markCompleter.complete('票数:$value'));
  return markCompleter.future;
}
