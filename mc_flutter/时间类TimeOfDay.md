### 类TimeOfDay

##### 文档

```
https://api.flutter.dev/flutter/material/TimeOfDay-class.html
```

##### 构造默认

```
TimeOfDay({required int hour, required int minute})
```

##### 构造fromDateTime

```
TimeOfDay.fromDateTime(DateTime time)
```

##### 构造now

```
TimeOfDay.now()
```

##### 简例01

```
TimeOfDay now = TimeOfDay.now();
TimeOfDay releaseTime = TimeOfDay(hour: 15, minute: 0); // 3:00pm
TimeOfDay roomBooked = TimeOfDay.fromDateTime(DateTime.parse('2018-10-20 16:30:04Z')); // 4:30pm
```

##### 公有属性

```
hashCode → int
hour → int
hourOfPeriod → int
minute → int
period → DayPeriod
periodOffset → int

```

##### 私有属性

```
runtimeType → Type
```

##### 公有方法

```
format(BuildContext context) → String
replacing({int? hour, int? minute}) → TimeOfDay
toString() → String
```

##### 私有方法

```
noSuchMethod(Invocation invocation) → dynamic
```

##### 常量变量

```
hoursPerDay → const int
hoursPerPeriod → const int
minutesPerHour → const int
```

