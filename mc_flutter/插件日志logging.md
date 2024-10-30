### 依赖导包

```
dependencies:
  logging: ^0.11.4
import 'package:logging/logging.dart';
```

### 类Logger

##### 构造函数

```
Logger(String name)
Logger.detached(String name)
```

##### 常用属性

```
children → Map<String, Logger>
fullName → String
level ↔ Level
name → String
onRecord → Stream<LogRecord>
parent → Logger

```

##### 常用方法

```
clearListeners() → void
```

```
fine(dynamic message, [Object error, StackTrace stackTrace]) → void
```

```
finer(dynamic message, [Object error, StackTrace stackTrace]) → void
```

```
finest(dynamic message, [Object error, StackTrace stackTrace]) → void
```

```
config(dynamic message, [Object error, StackTrace stackTrace]) → void
```

```
info(dynamic message, [Object error, StackTrace stackTrace]) → void
```

```
isLoggable(Level value) → bool
```

```
log(Level logLevel, dynamic message, [Object error, StackTrace stackTrace, Zone zone]) → void
```

```
severe(dynamic message, [Object error, StackTrace stackTrace]) → void
```

```
shout(dynamic message, [Object error, StackTrace stackTrace]) → void
```

```
warning(dynamic message, [Object error, StackTrace stackTrace]) → void
```

##### 静态方法

```
root → Logger
```

### 类Level

##### 构造函数

```
Level(String name, int value)
```

##### 常用属性

```
name → String
value → int
```

##### 常用方法

```
compareTo(Level other) → int
```

##### 操作符

```
operator <(Level other) → bool
operator <=(Level other) → bool
operator ==(Object other) → bool
operator >(Level other) → bool
operator >=(Level other) → bool
```

##### 常量

```
//const Level('ALL', 0)
ALL → const Level

//const Level('CONFIG', 700)
CONFIG → const Level

//const Level('FINE', 500)
FINE → const Level

//const Level('FINER', 400)
FINER → const Level

//const Level('FINEST', 300)
FINEST → const Level

//const Level('INFO', 800)
INFO → const Level

//const [ALL, FINEST, FINER, FINE, CONFIG, INFO, WARNING, SEVERE, SHOUT, OFF]
LEVELS → const List<Level>

const Level('OFF', 2000)
OFF → const Level

const Level('SEVERE', 1000)
SEVERE → const Level

//const Level('SHOUT', 1200)
SHOUT → const Level

//const Level('WARNING', 900)
WARNING → const Level
```

