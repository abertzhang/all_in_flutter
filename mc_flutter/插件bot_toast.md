## 插件bot_toast

- 应用场景
- 依赖导包

```
bot_toast: ^3.0.0
import 'package:bot_toast/bot_toast.dart';
```

- 初始化BotToast

```
MaterialApp(
      title: 'BotToast Demo',
      builder: BotToastInit(), //1.调用BotToastInit
      navigatorObservers: [BotToastNavigatorObserver()], //2.注册路由观察者
      home: XxxxPage(),
  )
```

```
final botToastBuilder = BotToastInit();  //1.调用BotToastInit
MaterialApp(
      title: 'BotToast Demo',
      builder: (context, child) {
        child = myBuilder(context,child);  //do something
        child = botToastBuilder(context,child); 
        return child;
      }, 
      navigatorObservers: [BotToastNavigatorObserver()], //2.注册路由观察者
      home: XxxxPage(),
  )
```

- 使用BotTosat

```
BotToast.showText(text:"xxxx");  //弹出一个文本框;
BotToast.showSimpleNotification(title: "init"); //弹出简单通知
BotToast.showLoading(); //弹出一个加载动画
//弹出一个定位Toast
BotToast.showAttachedWidget(
    attachedWidget: (_) => Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.favorite,
              color: Colors.redAccent,
            ),
          ),
        ),
    duration: Duration(seconds: 2),
    target: Offset(520, 520));
```

- 代码示例
- 其他