## 插件fsuper

- 文档

```
https://pub.dev/packages/fsuper
```

- 应用场景

FSuper 是一个强大的组件，能够支持富文本、圆角、边框、图片、小红点、以及同时设置多达两个子组件，且能够通过相对位置控制它们。 FSuper 能够帮助开发者快速舒适的构建复杂视图。

- 依赖导包

```
fsuper: ^0.1.5
import 'package:fsuper/fsuper.dart';
```

- 构造函数

```
FSuper({
double width, 
double height, 
double maxWidth, 
double maxHeight, 
String text, 
Color textColor, 
double textSize, 
FontStyle textStyle, 
FontWeight textWeight, 
double fontHeight, 
Alignment textAlignment, 
TextAlign textAlign, 
List<TextSpan> spans, 
GestureTapCallback onClick, 
Color backgroundColor, 
ImageProvider backgroundImage, 
Widget child1, 
Alignment child1Alignment, 
EdgeInsets child1Margin, 
GestureTapCallback onChild1Click, 
Widget child2, 
Alignment child2Alignment, 
EdgeInsets child2Margin, 
GestureTapCallback onChild2Click, 
bool redPoint: false, 
Color redPointColor: Colors.redAccent, 
double redPointSize: 20, 
Offset redPointOffset, String redPointText, 
Color redPointTextColor: Colors.white, 
double redPointTextSize: 11, 
Gradient gradient, 
EdgeInsetsGeometry padding, 
Corner corner, 
CornerStyle cornerStyle: CornerStyle.round, 
Color strokeColor, 
double strokeWidth, 
Color shadowColor, 
Offset shadowOffset, 
double shadowBlur: 1, 
EdgeInsets margin
})
```

```

```

- 库内其他类

```
Corner({double leftTopCorner: 0, double rightTopCorner: 0, double rightBottomCorner: 0, double leftBottomCorner: 0})
```

```
Corner.all(double radius)
```

```
CornerStyle enum
bevel → const CornerStyle,1
round → const CornerStyle,0
values → const List<CornerStyle>
```



- 代码示例

```
FSuper(
  margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
  width: double.infinity,
  text: "This is FSuper!",
  backgroundColor: Color(0xffffc900),
),
```



- 其他