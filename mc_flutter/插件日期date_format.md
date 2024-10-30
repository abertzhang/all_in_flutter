### 依赖导包

```
dependencies:
  date_format: ^1.0.9
import 'package:date_format/date_format.dart';
```

### 库date_format

##### 类

```
EnglishLocale
Locale
```

##### 常量变量

```
am → const String//'am'
D → const String//'D'
d → const String//'d'
DD → const String//'DD'
dd → const String//'dd'
escape → const String//'\\'
H → const String
h → const String
HH → const String
hh → const String
M → const String
m → const String
MM → const String
mm → const String
n → const String//Outputs minute compactly
nn → const String
S → const String
s → const String
ss → const String
SSS → const String//Outputs millisecond as three digits
u → const String//Outputs millisecond compactly
uuu → const String//Outputs microsecond
W → const String//Outputs week in year compactly
w → const String
WW → const String
yy → const String
yyyy → const String//Outputs year as four digits
Z → const String
z → const String
```

##### 函数

```
dayInYear(DateTime date) → int
formatDate(DateTime date, List<String> formats, {Locale locale = const EnglishLocale()}) → String
```

### 类Locale

### 类EnglishLocale



##### 简例01

```
import 'package:date_format/date_format.dart';

main() {
  print(formatDate(DateTime(1989, 2, 21), [yyyy, '-', mm, '-', dd]));
  print(formatDate(DateTime(1989, 2, 21), [yy, '-', m, '-', dd]));
  print(formatDate(DateTime(1989, 2, 1), [yy, '-', m, '-', d]));

  print(formatDate(DateTime(1989, 2, 1), [yy, '-', MM, '-', d]));
  print(formatDate(DateTime(1989, 2, 21), [yy, '-', M, '-', d]));

  print(formatDate(DateTime(1989, 2, 1), [yy, '-', M, '-', d]));

  print(formatDate(DateTime(2018, 1, 14), [yy, '-', M, '-', DD]));
  print(formatDate(DateTime(2018, 1, 14), [yy, '-', M, '-', D]));

  print(formatDate(DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss]));

  print(formatDate(
      DateTime(1989, 02, 1, 15, 40, 10), [hh, ':', nn, ':', ss, ' ', am]));

  print(formatDate(
      DateTime(1989, 02, 1, 15, 40, 10), [hh, ':', nn, ':', ss, ' ', am]));

  print(formatDate(DateTime(1989, 02, 1, 15, 40, 10), [hh]));
  print(formatDate(DateTime(1989, 02, 1, 15, 40, 10), [h]));

  print(formatDate(DateTime(1989, 02, 1, 5), [am]));
  print(formatDate(DateTime(1989, 02, 1, 15), [am]));

  print(
      formatDate(DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss, z]));

  print(formatDate(
      DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss, ' ', Z]));

  print(formatDate(DateTime(1989, 02, 21), [yy, ' ', w]));
  print(formatDate(DateTime(1989, 02, 21), [yy, ' ', W]));

  print(formatDate(DateTime(1989, 12, 31), [yy, '-W', W]));
  print(formatDate(DateTime(1989, 1, 1), [yy, '-', mm, '-w', W]));

  print(formatDate(
      DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss, ' ', Z]));

  print(formatDate(DateTime(2020, 04, 18, 21, 14), [H, '\\h', n]));
}
```

