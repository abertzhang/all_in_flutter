## 抽象类Decoration

##### 文档资料

```
https://api.flutter.dev/flutter/painting/Decoration-class.html
```

##### 被继承子类

```
BoxDecoration
FlutterLogoDecoration
ShapeDecoration
UnderlineTabIndicator
```

##### 相关类关系图

![image-20211129151324779](D:\project\nodejs\blogcode\flutterblog\source\_posts\images\image-20211129151324779.png)

### 类BoxDecoration

##### 文档资料

```
https://api.flutter.dev/flutter/painting/BoxDecoration-class.html
```

##### 构造函数

```dart
BoxDecoration({
Color? color, 
DecorationImage? image, 
BoxBorder? border, 
BorderRadiusGeometry? 
borderRadius, 
List<BoxShadow>? boxShadow, 
Gradient? gradient, 
BlendMode? backgroundBlendMode, 
BoxShape shape
})
```

### 类DecorationImage 

##### 文档资料

```
https://api.flutter.dev/flutter/painting/DecorationImage-class.html
```

##### 构造函数

```
DecorationImage({
required ImageProvider<Object> image, 
ImageErrorListener? onError, 
ColorFilter? colorFilter, 
BoxFit? fit, 
AlignmentGeometry alignment, 
Rect? centerSlice, 
ImageRepeat repeat, 
bool matchTextDirection, 
double scale
})
```

### 类FlutterLogoDecoration

##### 文档资料

```
https://api.flutter.dev/flutter/painting/FlutterLogoDecoration-class.html
```

##### 继承关系

```
Object>>Decoration>>FlutterLogoDecoration
```



##### 构造函数

```
FlutterLogoDecoration({
Color textColor, 
FlutterLogoStyle style, 
EdgeInsets margin
})
```

### 类ShapeDecoration 

##### 文档资料

```
https://api.flutter.dev/flutter/painting/ShapeDecoration-class.html
```

##### 继承关系

```
Object>>Decoration>>ShapeDecoration
```

##### 构造函数

```
ShapeDecoration({
Color? color, 
DecorationImage? image, 
Gradient? gradient, 
List<BoxShadow>? shadows, 
required ShapeBorder shape
})
```

##### 命名构造

```
ShapeDecoration.fromBoxDecoration(BoxDecoration source)
```

### 类UnderlineTabIndicator

##### 文档资料

```
https://api.flutter.dev/flutter/material/UnderlineTabIndicator-class.html
```

##### 继承关系

```
Object>>Decoration>>UnderlineTabIndicator
```



##### 构造函数

```
UnderlineTabIndicator({
BorderSide borderSide, 
EdgeInsetsGeometry insets
})
```

### 类BorderSide 

##### 文档资料

```
https://api.flutter.dev/flutter/painting/BorderSide-class.html
```

##### 子类

```
MaterialStateBorderSide
```



##### 构造函数

```
BorderSide({
Color color, 
double width, 
BorderStyle style
})
```

### 抽象类MaterialStateBorderSide

##### 文档资料

```
https://api.flutter.dev/flutter/material/MaterialStateBorderSide-class.html
```

##### 父类

```
Object>>BorderSide>>MaterialStateBorderSide
```

##### 子类

```
MaterialStateProperty<BorderSide?>
```

### 类MaterialStateProperty

##### 文档资料

```

```

##### 子类

```
MaterialStateBorderSide
MaterialStateColor
MaterialStateMouseCursor
MaterialStateOutlinedBorder
```



### 枚举类MaterialState 

##### 文档资料

```
https://api.flutter.dev/flutter/material/MaterialState-class.html
```

##### 枚举值

```
disabled 
dragged 
error 
focused 
hovered 
pressed 
selected 
values 
```

