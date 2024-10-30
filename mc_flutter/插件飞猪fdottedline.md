## 插件fdottedline

- 文档地址

```
https://pub.dev/packages/fdottedline
```

- 应用场景

虚线的应用

- 依赖导包

```
fdottedline 1.0.1
import 'package:fdottedline/fdottedline.dart';
```

- 构造函数

```
FDottedLine({
	Key key, 
	Color color: Colors.black, 
	double height, 
	double width, 
	double dottedLength: 5.0, 
	double space: 3.0, 
	double strokeWidth: 1.0, 
	FDottedLineCorner corner, 
	Widget child
})
```

- 库内其他类

用来设置圆角的参数

```
FDottedLineCorner({
	double leftTopCorner: 0, 
	double rightTopCorner: 0, 
	double rightBottomCorner: 0, 
	double leftBottomCorner: 0
})
```

```
FDottedLineCorner.all(double radius)
```

- 代码示例



- 其他