### 依赖导包

```
dependencies:
  logger: ^0.9.4
import 'package:logger/logger.dart';
```

##### 使用Logger

```
var logger = Logger();
logger.d("Logger is working!");
```



##### 日志级别

```
logger.v("Verbose log");
logger.d("Debug log");
logger.i("Info log");
logger.w("Warning log");
logger.e("Error log");
logger.wtf("What a terrible failure log");
```

##### 参数

```
var logger = Logger(
  filter: null, 
  printer: PrettyPrinter(),
  output: null, 
);
```

```
var logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2, 
    errorMethodCount: 8, 
    lineLength: 120, 
    colors: true, 
    printEmojis: true, 
    printTime: false 
  ),
);
```

过滤

```
class MyFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}
```



```
class MyPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) {
    return [event.message];
  }
}
```



```
var logger = Logger(
  printer: PrefixPrinter(PrettyPrinter(colors: false))
);
```



```
class ConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    for (var line in event.lines) {
      print(line);
    }
  }
}
```

