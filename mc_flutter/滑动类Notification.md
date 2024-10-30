## 抽象类Notification

- 官方文档

```
https://api.flutter.dev/flutter/widgets/Notification-class.html
```

- 构造函数
- 子类

```
DraggableScrollableNotification 
KeepAliveNotification 
LayoutChangedNotification 
OverscrollIndicatorNotification
```



- 其他

## 类DraggableScrollableNotification

- 官方文档

```
https://api.flutter.dev/flutter/widgets/DraggableScrollableNotification-class.html
```

- 构造函数

```
DraggableScrollableNotification({@required double extent, @required double minExtent, @required double maxExtent, @required double initialExtent, @required BuildContext context})
```

- 其他

## 类KeepAliveNotification

- 官方文档

```
https://api.flutter.dev/flutter/widgets/KeepAliveNotification-class.html
```

- 构造函数

```
KeepAliveNotification(Listenable handle)
```

- 其他

## 类OverscrollIndicatorNotification

- 官方文档

```
https://api.flutter.dev/flutter/widgets/OverscrollIndicatorNotification-class.html
```

- 构造函数

```
OverscrollIndicatorNotification({@required bool leading})
```

- 其他

## 抽象类LayoutChangedNotification

- 官方文档

```
https://api.flutter.dev/flutter/widgets/LayoutChangedNotification-class.html
```

- 构造函数

```
LayoutChangedNotification()
```

- 子类

```
ScrollNotification 
SizeChangedLayoutNotification
```

- 其他

## 类SizeChangedLayoutNotification

- 官方文档

```
https://api.flutter.dev/flutter/widgets/SizeChangedLayoutNotification-class.html
```

- 构造函数

```
SizeChangedLayoutNotification()
```

- 其他

## 类ScrollNotification

- 官方文档

```
https://api.flutter.dev/flutter/widgets/ScrollNotification-class.html
```

- 构造函数

```
ScrollNotification({@required ScrollMetrics metrics, @required BuildContext context})
```

- 属性metrics

```
metrics → ScrollMetrics
depth → int
```

- 子类

```
OverscrollNotification 
ScrollStartNotification
ScrollEndNotification 
ScrollUpdateNotification 
UserScrollNotification
```

- 其他

## 