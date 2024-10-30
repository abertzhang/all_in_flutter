### route动画带参应用场景

##### 第一步

新建customroute.dart

```
class PageRouteRandomAnimation extends PageRouteBuilder {
  final Widget widget;
  final int random;
  @override
  PageRouteRandomAnimation(this.widget, {this.random: 2})
      : super(
            transitionDuration: const Duration(milliseconds: 850), //设置动画时长800毫秒
            pageBuilder: (BuildContext context, Animation<double> animation1,
                Animation<double> animation2) {
              return widget;
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation1,
                Animation<double> animation2,
                Widget child) {
              var style;
              //print("sf");

              switch (random) {
                case 0:
                  {
                    style = ScaleTransition(
                        scale: Tween(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                                parent: animation1,
                                curve: Curves.fastOutSlowIn)),
                        child: child);
                  }
                  break;
                case 1:
                  {
                    style = FadeTransition(
                      //渐变过渡 0.0-1.0
                      opacity:
                          Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: animation1, //动画样式
                        curve: Curves.fastOutSlowIn, //动画曲线
                      )),
                      child: child,
                    );
                  }
                  break;
                case 2:
                  {
                    style = RotationTransition(
                      turns:
                          Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: animation1,
                        curve: Curves.fastOutSlowIn,
                      )),
                      child: ScaleTransition(
                        scale: Tween(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                                parent: animation1,
                                curve: Curves.fastOutSlowIn)),
                        child: child,
                      ),
                    );
                  }
                  break;
                case 3:
                  {
                    style = SlideTransition(
                      position: Tween<Offset>(
                              begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                          .animate(CurvedAnimation(
                              parent: animation1, curve: Curves.fastOutSlowIn)),
                      child: child,
                    );
                  }
                  break;
                default:
                  {
                    style = ScaleTransition(
                        scale: Tween(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                                parent: animation1,
                                curve: Curves.fastOutSlowIn)),
                        child: child);
                  }
              }
              return style;
            });
}
```

第二步:路由类内定义参数变量

```
final arguments;
DemoFlow({this.arguments});	//路由类DemoFlow
```

第三步:开始路由

```
Navigator.push(context, PageRouteRandomAnimation(DemoFlow(arguments: "带参动画路由",)));
```

route命名带参

- 应用场景

当许多页面需要路由,用此法统一可管理路由

- 步骤

第一步:新建routes.dart

```
import 'package:demokindwidgets/flow/demoflow.dart';
import 'package:demokindwidgets/main.dart';
import 'package:flutter/material.dart';
final routes = {
  "/main": (context) => MyScaffold(),
  "/flow": (context, {arguments}) => DemoFlow(arguments: arguments),
}; 
// ignore: top_level_function_literal_block
final myOnGenerateRoute = (RouteSettings settings){
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route = MaterialPageRoute(
          builder: (context) => pageContentBuilder(context));
      return route;
    }
  
  }
return null;
};
```

第二步:设置onGenerateRoute

```
class MyMaterialApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: myOnGenerateRoute,
      //可以不用home: MyScaffold(),
      initialRoute: "/main"
    );
  }
}
```

第三步:路由类内定义参数变量

```
final arguments;
DemoFlow({this.arguments});	//路由类DemoFlow
```

第四步:开始路由

```
Navigator.pushNamed(context, "/flow",arguments: "任意参数");
```
