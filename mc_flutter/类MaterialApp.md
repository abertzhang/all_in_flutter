### 类MaterialApp

#### 构造函数

```dart
MaterialApp({
  Key? key, 
  GlobalKey<NavigatorState>? navigatorKey, 
  GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey, 
  Widget? home, 
  Map<String, WidgetBuilder> routes = const <String, WidgetBuilder>{}, 
  String? initialRoute, 
  RouteFactory? onGenerateRoute, 
  InitialRouteListFactory? onGenerateInitialRoutes, 
  RouteFactory? onUnknownRoute, 
  List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[], 
  TransitionBuilder? builder, 
  String title = '', 
  GenerateAppTitle? onGenerateTitle, 
  Color? color, 
  ThemeData? theme, 
  ThemeData? darkTheme, 
  ThemeData? highContrastTheme, 
  ThemeData? highContrastDarkTheme, 
  ThemeMode? themeMode = ThemeMode.system, 
  Duration themeAnimationDuration = kThemeAnimationDuration, 
  Curve themeAnimationCurve = Curves.linear, 
  Locale? locale, 
  Iterable<LocalizationsDelegate>? localizationsDelegates, 
  LocaleListResolutionCallback? localeListResolutionCallback, 
  LocaleResolutionCallback? localeResolutionCallback, 
  Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')], 
  bool debugShowMaterialGrid = false, 
  bool showPerformanceOverlay = false, 
  bool checkerboardRasterCacheImages = false, 
  bool checkerboardOffscreenLayers = false, 
  bool showSemanticsDebugger = false, 
  bool debugShowCheckedModeBanner = true, 
  Map<ShortcutActivator, Intent>? shortcuts, 
  Map<Type, Action<Intent>>? actions, 
  String? restorationScopeId, 
  ScrollBehavior? scrollBehavior, 
  bool useInheritedMediaQuery = false
})
```

#### 命名构造

```dart
MaterialApp.router({
  Key? key, 
  GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey, 
  RouteInformationProvider? routeInformationProvider, 
  RouteInformationParser<Object>? routeInformationParser, 
  RouterDelegate<Object>? routerDelegate, 
  RouterConfig<Object>? routerConfig, 
  BackButtonDispatcher? backButtonDispatcher, 
  TransitionBuilder? builder, 
  String title = '', 
  GenerateAppTitle? onGenerateTitle, 
  Color? color, 
  ThemeData? theme, 
  ThemeData? darkTheme, 
  ThemeData? highContrastTheme, 
  ThemeData? highContrastDarkTheme, 
  ThemeMode? themeMode = ThemeMode.system, 
  Duration themeAnimationDuration = kThemeAnimationDuration, 
  Curve themeAnimationCurve = Curves.linear, 
  Locale? locale, 
  Iterable<LocalizationsDelegate>? localizationsDelegates, 
  LocaleListResolutionCallback? localeListResolutionCallback, 
  LocaleResolutionCallback? localeResolutionCallback, 
  Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')], 
  bool debugShowMaterialGrid = false, 
  bool showPerformanceOverlay = false, 
  bool checkerboardRasterCacheImages = false, 
  bool checkerboardOffscreenLayers = false, 
  bool showSemanticsDebugger = false, 
  bool debugShowCheckedModeBanner = true, 
  Map<ShortcutActivator, Intent>? shortcuts, 
  Map<Type, Action<Intent>>? actions, 
  String? restorationScopeId, 
  ScrollBehavior? scrollBehavior, 
  bool useInheritedMediaQuery = false
})

```

#### 静态方法

```dart
createMaterialHeroController() → HeroController
```

#### 文档资料

[官方文档](https://api.flutter.dev/flutter/material/MaterialApp-class.html)

[Flutter之MaterialApp使用详解](https://juejin.cn/post/6844903656932786189)
