### 函数showCupertinoDialog

##### 文档

```
https://api.flutter.dev/flutter/cupertino/showCupertinoDialog.html
```

##### 函数体

```
Future<T?> showCupertinoDialog <T>(
{required BuildContext context,
required WidgetBuilder builder,
String? barrierLabel,
bool useRootNavigator: true,
bool barrierDismissible: false,
RouteSettings? routeSettings}
)
```

##### 接口

```
Future<T?> showCupertinoDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  String? barrierLabel,
  bool useRootNavigator = true,
  bool barrierDismissible = false,
  RouteSettings? routeSettings,
}) {
  assert(builder != null);
  assert(useRootNavigator != null);

  return Navigator.of(context, rootNavigator: useRootNavigator).push<T>(CupertinoDialogRoute<T>(
    builder: builder,
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: barrierLabel,
    barrierColor: CupertinoDynamicColor.resolve(_kModalBarrierColor, context),
    settings: routeSettings,
  ));
}
```

##### 简例01

```
import 'package:flutter/cupertino.dart';

// ...

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      restorationScopeId: 'app',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static Route<Object?> _dialogBuilder(BuildContext context, Object? arguments) {
    return CupertinoDialogRoute<void>(
      context: context,
      builder: (BuildContext context) {
        return const CupertinoAlertDialog(
          title: Text('Title'),
          content: Text('Content'),
          actions: <Widget>[
            CupertinoDialogAction(child: Text('Yes')),
            CupertinoDialogAction(child: Text('No')),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: Center(child: CupertinoButton(
        onPressed: () {
          Navigator.of(context).restorablePush(_dialogBuilder);
        },
        child: const Text('Open Dialog'),
      )),
    );
  }
}
```

