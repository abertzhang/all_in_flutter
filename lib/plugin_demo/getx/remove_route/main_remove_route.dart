import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    home: HomePage(),
    initialRoute: RouteConfig.home,
    getPages: RouteConfig.getPages,
    navigatorObservers: [routeHistoryObserver], //记录路由栈
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('移除路由')),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Get.toNamed(RouteConfig.a);
            },
            child: const Text('APage'),
          ),
        ],
      ),
    );
  }
}

class RouteConfig {
  static const String home = '/home';
  static const String a = '/a';
  static const String b = '/b';
  static const String c = '/c';
  static final List<GetPage> getPages = [
    GetPage(name: home, page: () => const HomePage()),
    GetPage(name: a, page: () => const APage()),
    GetPage(name: b, page: () => const BPage()),
    GetPage(name: c, page: () => const CPage()),
  ];
}

HistoryRouteObserver routeHistoryObserver = HistoryRouteObserver();

///记录路由历史
class HistoryRouteObserver extends RouteObserver<PageRoute> {
  List<Route<dynamic>> history = <Route<dynamic>>[];

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    history.remove(route);
    //调用Navigator.of(context).pop() 出栈时回调
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    history.add(route);
    //调用Navigator.of(context).push(Route()) 进栈时回调
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    history.remove(route);
    //调用Navigator.of(context).removeRoute(Route()) 移除某个路由回调
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (oldRoute != null) {
      history.remove(oldRoute);
    }
    if (newRoute != null) {
      history.add(newRoute);
    }
    //调用Navigator.of(context).replace( oldRoute:Route("old"),newRoute:Route("new")) 替换路由时回调
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('didStartUserGesture');
  }

  @override
  void didStopUserGesture() {
    print('didStopUserGesture');
  }

  @override
  void subscribe(RouteAware routeAware, PageRoute route) {
    print('subscribe');
  }
}

extension GetExtension on GetInterface {
  //路由历史
  List<Route<dynamic>> get history => routeHistoryObserver.history;
  //是否已打开
  bool containName(String name) {
    return getRouteByName(name) != null;
  }

//通过name获取route,从栈顶带师查找
  Route? getRouteByName(String name) {
    var index = history.lastIndexWhere((element) => element.settings.name == name);
    if (index != -1) {
      return history[index];
    }
    return null;
  }

//通过name获取route
  List<Route> getRoutesByName(String name) {
    return history.where((element) => element.settings.name == name).toList();
  }

//移除指定页面,一次
  void removeName(String name) {
    var route = getRouteByName(name);
    if (route != null) {
      if (history.last == route) {
        //移除当前页,直接返回
        Get.back();
      } else {
        Get.removeRoute(route);
      }
    }
  }

//移除所有指定页面
  void removeAllName(String name) {
    var routes = getRoutesByName(name);
    for (final route in routes) {
      Get.removeRoute(route);
    }
  }
}

class APage extends StatelessWidget {
  const APage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('APage')),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Get.toNamed(RouteConfig.b);
            },
            child: const Text('BPage'),
          ),
        ],
      ),
    );
  }
}

class BPage extends StatelessWidget {
  const BPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BPage')),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              Get.toNamed(RouteConfig.c);
            },
            child: const Text('CPage'),
          ),
        ],
      ),
    );
  }
}

class CPage extends StatelessWidget {
  const CPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CPage')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Get.removeName(RouteConfig.a);
            },
            child: const Text("Remove A"),
          ),
          ElevatedButton(
            onPressed: () {
              Get.removeName(RouteConfig.b);
            },
            child: const Text("Remove B"),
          ),
        ],
      ),
    );
  }
}
