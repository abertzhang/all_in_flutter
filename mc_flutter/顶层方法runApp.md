### 方法runApp

```
void runApp (
	Widget app
)
```

### 方法代码

```
void runApp(Widget app) { 
WidgetsFlutterBinding.ensureInitialized()
    ..scheduleAttachRootWidget(app)
    ..scheduleWarmUpFrame();
}
```

### 相关

```
See also:
WidgetsBinding.attachRootWidget, which creates the root widget for the widget hierarchy.
RenderObjectToWidgetAdapter.attachToRenderTree, which creates the root element for the element hierarchy.
WidgetsBinding.handleBeginFrame, which pumps the widget pipeline to ensure the widget, element, and render trees are all built.
```

### 文档资料

[官方文档](https://api.flutter.dev/flutter/widgets/runApp.html)

[Flutter 必知必会系列 —— runApp 做了啥](https://juejin.cn/post/7083327115734548516)
