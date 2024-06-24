import 'dart:async';

typedef TaskCall = void Function(bool success, dynamic result);
typedef TaskFutureFunc = Future Function();
void main() {
  Future task1() {
    return Future(() async {
      print('start task1');
      await Future.delayed(const Duration(seconds: 3));
      return 'end task1';
    });
  }

  Future task2() {
    return Future(() async {
      print('start task2');
      await Future.delayed(const Duration(seconds: 3));
      return 'end task2';
    });
  }

  TaskQueueUtil queueUtil = TaskQueueUtil();
  queueUtil.addTask(task1).then((result) {
    print(result);
    return Future.value(result);
  });

  queueUtil.addTask(task2).then((result) {
    print(result);
    return Future.value(result);
  });
}

class TaskQueueUtil {
  bool _isTaskRunning = false;
  final List<TaskItem> _taskList = [];
  bool get isTaskRunning => _isTaskRunning;
  Future addTask(TaskFutureFunc futureFunc, {dynamic param}) {
    Completer completer = Completer();
    TaskItem taskItem = TaskItem(
      futureFunc,
      (success, result) {
        if (success) {
          completer.complete(result);
        } else {
          completer.completeError(result);
        }
        _taskList.removeAt(0);
        _isTaskRunning = false;
        _doTask();
      },
    );
    _taskList.add(taskItem);
    _doTask();
    return completer.future;
  }

  Future<void> _doTask() async {
    if (_isTaskRunning) return;
    if (_taskList.isEmpty) return;
    //获取先进入的任务
    TaskItem task = _taskList.first;
    _isTaskRunning = true;
    try {
      //执行任务
      var result = await task.futureFunc();
      //完成任务
      task.callback(true, result);
    } catch (_) {
      task.callback(false, _.toString());
    }
  }
}

class TaskItem {
  final TaskFutureFunc futureFunc;
  final TaskCall callback;
  const TaskItem(this.futureFunc, this.callback);
}
