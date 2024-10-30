### 顶层方法showDialog

##### 文档

```
https://api.flutter.dev/flutter/material/showDialog.html
```



##### 函数体

```
Future<T?> showDialog <T>(
    {required BuildContext context,
    required WidgetBuilder builder,
    bool barrierDismissible: true,
    Color? barrierColor: Colors.black54,
    String? barrierLabel,
    bool useSafeArea: true,
    bool useRootNavigator: true,
    RouteSettings? routeSettings}
)
```

##### 接口

```
Future<T?> showDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
  Color? barrierColor = Colors.black54,
  String? barrierLabel,
  bool useSafeArea = true,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
}) {
  assert(builder != null);
  assert(barrierDismissible != null);
  assert(useSafeArea != null);
  assert(useRootNavigator != null);
  assert(debugCheckHasMaterialLocalizations(context));

  final CapturedThemes themes = InheritedTheme.capture(
    from: context,
    to: Navigator.of(
      context,
      rootNavigator: useRootNavigator,
    ).context,
  );

  return Navigator.of(context, rootNavigator: useRootNavigator).push<T>(DialogRoute<T>(
    context: context,
    builder: builder,
    barrierColor: barrierColor,
    barrierDismissible: barrierDismissible,
    barrierLabel: barrierLabel,
    useSafeArea: useSafeArea,
    settings: routeSettings,
    themes: themes,
  ));
}
```



##### 简例01

```
import 'package:flutter/material.dart';

// ...

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'app',
      title: 'Restorable Routes Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static Route<Object?> _dialogBuilder(BuildContext context, Object? arguments) {
    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) => const AlertDialog(title: Text('Material Alert!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.of(context).restorablePush(_dialogBuilder);
          },
          child: const Text('Open Dialog'),
        ),
      ),
    );
  }
}
```

