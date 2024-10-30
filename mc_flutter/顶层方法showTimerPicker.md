### 函数showTimePicker

##### 文档

```
https://api.flutter.dev/flutter/material/showTimePicker.html
```

##### 函数体

```
Future<TimeOfDay?> showTimePicker (
    {required BuildContext context,
    required TimeOfDay initialTime,
    TransitionBuilder? builder,
    bool useRootNavigator: true,
    TimePickerEntryMode initialEntryMode: TimePickerEntryMode.dial,
    String? cancelText,
    String? confirmText,
    String? helpText,
    RouteSettings? routeSettings
})
```

##### 接口

```
Future<TimeOfDay?> showTimePicker({
  required BuildContext context,
  required TimeOfDay initialTime,
  TransitionBuilder? builder,
  bool useRootNavigator = true,
  TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial,
  String? cancelText,
  String? confirmText,
  String? helpText,
  RouteSettings? routeSettings,
}) async {
  assert(context != null);
  assert(initialTime != null);
  assert(useRootNavigator != null);
  assert(initialEntryMode != null);
  assert(debugCheckHasMaterialLocalizations(context));

  final Widget dialog = _TimePickerDialog(
    initialTime: initialTime,
    initialEntryMode: initialEntryMode,
    cancelText: cancelText,
    confirmText: confirmText,
    helpText: helpText,
  );
  return await showDialog<TimeOfDay>(
    context: context,
    useRootNavigator: useRootNavigator,
    builder: (BuildContext context) {
      return builder == null ? dialog : builder(context, dialog);
    },
    routeSettings: routeSettings,
  );
}
```

### 类TimePickerThemeData

##### 文档

```
https://api.flutter.dev/flutter/material/TimePickerThemeData-class.html
```

##### 继承关系

```
Mixed in types
Diagnosticable
Annotations
@immutable
```

##### 构造函数

```
TimePickerThemeData({
    Color? backgroundColor, 
    Color? hourMinuteTextColor, 
    Color? hourMinuteColor, 
    Color? dayPeriodTextColor, 
    Color? dayPeriodColor, 
    Color? dialHandColor, 
    Color? dialBackgroundColor, 
    Color? dialTextColor, 
    Color? entryModeIconColor, 
    TextStyle? hourMinuteTextStyle, 
    TextStyle? dayPeriodTextStyle, 
    TextStyle? helpTextStyle, 
    ShapeBorder? shape, 
    ShapeBorder? hourMinuteShape, 
    OutlinedBorder? dayPeriodShape, 
    BorderSide? dayPeriodBorderSide, 
    InputDecorationTheme? inputDecorationTheme
})
```

##### 公有方法

```
copyWith({Color? backgroundColor, Color? hourMinuteTextColor, Color? hourMinuteColor, Color? dayPeriodTextColor, Color? dayPeriodColor, Color? dialHandColor, Color? dialBackgroundColor, Color? dialTextColor, Color? entryModeIconColor, TextStyle? hourMinuteTextStyle, TextStyle? dayPeriodTextStyle, TextStyle? helpTextStyle, ShapeBorder? shape, ShapeBorder? hourMinuteShape, OutlinedBorder? dayPeriodShape, BorderSide? dayPeriodBorderSide, InputDecorationTheme? inputDecorationTheme}) → TimePickerThemeData
```

##### 静态方法

```
lerp(
    TimePickerThemeData? a, 
    TimePickerThemeData? b, 
    double t
) → TimePickerThemeData
```



### 简例01

```
Future<TimeOfDay?> selectedTime24Hour = showTimePicker(
  context: context,
  initialTime: TimeOfDay(hour: 10, minute: 47),
  builder: (BuildContext context, Widget? child) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
      child: child!,
    );
  },
);
```

### 简例02

```
Future<TimeOfDay?> selectedTimeRTL = showTimePicker(
  context: context,
  initialTime: TimeOfDay.now(),
  builder: (BuildContext context, Widget? child) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: child!,
    );
  },
);
```

