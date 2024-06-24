import 'dart:async';

void main() async {
  int result = await syncCompleterMethod();
  print(result);
}

Future<int> syncCompleterMethod() {
  // final Completer<int> syncCompleter = Completer.sync();
  final Completer<int> syncCompleter = Completer();
  print('sync: 1');
  syncCompleter.future.then((value) => print('sync: 2'));
  syncCompleter.complete(1);
  print('sync: 3');
  return syncCompleter.future;
}
