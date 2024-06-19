/*
dart run  lib/async/future_main.dart
*/
void main() async {
  Future.delayed(const Duration(seconds: 0), () {
    print('至少等待0秒后执行');
  });
  //
  print(await Future.value('立即显示'));
  Future.sync(() {
    print("任务2，来自同步创建");
  });

  Future.microtask(() {
    print("任务2，来自微队列创建");
  });
  int count = 0;
  Future.doWhile(() {
    count++;
    print('无限循环');
    return count < 10;
  });
}
