### 函数showGeneralDialog

##### 文档

```
https://api.flutter.dev/flutter/widgets/showGeneralDialog.html
```

##### 函数体

```
Future<T?> showGeneralDialog <T extends Object?>(
{required BuildContext context,
required RoutePageBuilder pageBuilder,
bool barrierDismissible: false,
String? barrierLabel,
Color barrierColor: const Color(0x80000000),
Duration transitionDuration: const Duration(milliseconds: 200),
RouteTransitionsBuilder? transitionBuilder,
bool useRootNavigator: true,
RouteSettings? routeSettings}
)
```

##### 接口

```
Future<T?> showGeneralDialog<T extends Object?>({
  required BuildContext context,
  required RoutePageBuilder pageBuilder,
  bool barrierDismissible = false,
  String? barrierLabel,
  Color barrierColor = const Color(0x80000000),
  Duration transitionDuration = const Duration(milliseconds: 200),
  RouteTransitionsBuilder? transitionBuilder,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
}) {
  assert(pageBuilder != null);
  assert(useRootNavigator != null);
  assert(!barrierDismissible || barrierLabel != null);
  return Navigator.of(context, rootNavigator: useRootNavigator).push<T>(RawDialogRoute<T>(
    pageBuilder: pageBuilder,
    barrierDismissible: barrierDismissible,
    barrierLabel: barrierLabel,
    barrierColor: barrierColor,
    transitionDuration: transitionDuration,
    transitionBuilder: transitionBuilder,
    settings: routeSettings,
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static Route<Object?> _dialogBuilder(BuildContext context, Object? arguments) {
    return RawDialogRoute<void>(
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return const AlertDialog(title: Text('Alert!'));
      },
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

