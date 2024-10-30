### 类Timer

##### 官方文档

```
https://api.flutter.dev/flutter/dart-async/Timer-class.html
```

##### 应用场景

倒计时,周期性(循环)的执行某函数,预定时间间隔后执行某函数

##### 导包

```
import 'dart:async';
```

##### 构造函数

```
Timer(Duration duration, void callback())
```

##### 命名构造

```
Timer.periodic(Duration duration, void callback(Timer timer))
```

##### 静态方法

This function is equivalent to `new Timer(Duration.zero, callback)`.

```
run(void callback()) → void
```

##### 属性isActive

```
isActive → bool
```

##### 方法

```
cancel() → void
```

##### 属性tick

相当于是内部的一个计时器,当callback就tick自加一次,被cancel()后归零

+ 预定5秒后执行

```
Timer(Duration(seconds: 5),(){print("5秒到了！");});
```

##### 循环的callback

第一步：定义变量

```
Timer _timerCountdown;
```

第二步:销毁的准备

```
void dispose() {
    _timerLogin.cancel();
    super.dispose();
  }
```

第三步:定义函数

```
void startPeriodic() {
    var callback = (timer) {
      print("每个5秒打印一下:${timer.tick}");
    };
    _timerCountdown = Timer.periodic(Duration(seconds: 5), callback);
  }
```

第四步:适当位置启动命令

```
startPeriodic();
```

##### 倒计时代码步骤

第一步:建类实例和变量

```
Timer _timerLogin;
  int _countdownTime = 0;
```

第二步:销毁timer的准备

```
void dispose() {
    _timerLogin.cancel();
    super.dispose();
  }
```

第三步:定义可启动倒计时的函数

```
void startCountdownTimer() {
    const oneSec = const Duration(seconds: 1);
    var callback = (timer) {
          setState(() {
            if (_countdownTime == 0
                ) {
              _timerLogin.cancel(); //TOD定时器关闭的位置
            } else {
              _countdownTime--;
            }
          });
        };
    _timerLogin = Timer.periodic(oneSec, callback);
  }
```

第四步:在适当位置启动命令

```
startCountdownTimer();
```
