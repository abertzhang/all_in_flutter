## 插件fbutton

- 文档

```
https://pub.dev/packages/fbutton
```

- 应用场景

支持配置圆角、各种特效、边角、边框以及 Loading等

- 依赖导包

```
fbutton: ^1.0.4
import 'package:fbutton/fbutton.dart';
```

- 构造函数

```
FButton({
Key key, 
@required VoidCallback onPressed, 
String text, Color textColor, 
Color disabledTextColor, 
double fontSize, 
FontStyle fontStyle, 
Color color, 
Color disabledColor, 
Color hoverColor, 
Color highlightColor, 
Color splashColor, 
bool effect: false, 
EdgeInsetsGeometry padding, 
FocusNode focusNode, 
bool autofocus: false, 
double width, 
double height, 
FButtonCorner corner, 
FButtonCornerStyle cornerStyle: FButtonCornerStyle.round, 
Color strokeColor, double strokeWidth, 
Color shadowColor, 
Offset shadowOffset, 
double shadowBlur: 1.0, 
Gradient gradient, 
Widget image, 
double imageMargin: 6.0, 
ImageAlignment imageAlignment: ImageAlignment.left, 
bool loading: false, Color loadingColor, 
double loadingStrokeWidth: 4.0, 
bool clickLoading: false, 
bool hideTextOnLoading: false, 
String loadingText, 
double loadingSize: 12, 
bool clickEffect: false
})
```

- 库内其他类FButtonCorner

```
FButtonCorner({
double leftTopCorner: 0, 
double rightTopCorner: 0, 
double rightBottomCorner: 0, 
double leftBottomCorner: 0
})
```

```
FButtonCorner.all(double radius)
```

```
//枚举类FButtonCornerStyle enum
bevel → const FButtonCornerStyle 
round → const FButtonCornerStyle
values → const List<FButtonCornerStyle>
```

```
//枚举类ImageAlignment enum
bottom → const ImageAlignment//文字底部
left → const ImageAlignment//文字左边
right → const ImageAlignment//文字右边
top → const ImageAlignment//文字顶部
values → const List<ImageAlignment>
```

- 代码示例
- 其他

## 