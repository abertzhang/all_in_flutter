### 抽象类ShapeBorder

#### 文档资料

```
https://api.flutter.dev/flutter/painting/ShapeBorder-class.html
```

#### 继承关系

```dart
//Implement,子类
BoxBorder
InputBorder
OutlinedBorder
```

#### 常用属性

```dart
dimensions->EdgeInsetsGeometry
preferPaintInterior->bool
```



#### 静态方法

```dart
lerp(ShapeBorder? a, ShapeBorder? b, double t) → ShapeBorder?
```

#### 常用方法

```dart
add(ShapeBorder other, {bool reversed = false}) → ShapeBorder?
getInnerPath(Rect rect, {TextDirection? textDirection}) → Path
getOuterPath(Rect rect, {TextDirection? textDirection}) → Path
lerpFrom(ShapeBorder? a, double t) → ShapeBorder?
lerpTo(ShapeBorder? b, double t) → ShapeBorder?
paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) → void
scale(double t) → ShapeBorder
```

#### 继承关系图

![image-20211129145448192](http://qiniu-article.myflutter.cn/img/image-20211129145448192.png)

```
抽象类ShapeBorder, 它的子类如下:
ShapeBorder [abstract]
|---InputBorder [abstract]
    |---OutlineInputBorder
    |---UnderlineInputBorder
|---BoxBorder [abstract]
    |---BorderDirectional
    |---Border
|---OutlineBorder [abstract]  
    |---BeveledRectangleBorder//斜角
		|---CircleBorder//圆形   
		|---ContinuousRectangleBorder//连续圆    
    |---RoundedRectangleBorder//圆角
		|---StadiumBorder//体育馆形状的,两头圆
		|---MaterialStateOutlineBorder,抽象类
		|---MaterialStateProperty<OutlineBorder?>    
```



### 抽象类BoxBorder 

#### 文档资料

```
https://api.flutter.dev/flutter/painting/BoxBorder-class.html
```

#### 继承关系

```
//继承父类
Object ShapeBorder BoxBorder
//子类继承
Border
BorderDirectional
```


#### 静态方法

```
lerp(BoxBorder? a, BoxBorder? b, double t) → BoxBorder?
```

#### 常用方法

```dart
add(ShapeBorder other, {bool reversed = false}) → BoxBorder?
getInnerPath(Rect rect, {TextDirection? textDirection}) → Path
getOuterPath(Rect rect, {TextDirection? textDirection}) → Path
paint(Canvas canvas, Rect rect, {TextDirection? textDirection, BoxShape shape = BoxShape.rectangle, BorderRadius? borderRadius}) → void

```

### 类Border 

##### 文档资料

```
https://api.flutter.dev/flutter/painting/Border-class.html
```

##### 继承关系

```
//继承父类
Object 
ShapeBorder 
BoxBorder 
Border
//
```

##### 构造函数

```dart
Border({
	BorderSide top, 
	BorderSide right, 
	BorderSide bottom, 
	BorderSide left
	})
```

##### 命名函数

```dart
Border.all({
	Color color = const Color(4278190080), 
	double width = 1.0, 
	BorderStyle style = BorderStyle.solid
	})
```

```
Border.fromBorderSide(BorderSide side)
```

```
Border.symmetric({
	BorderSide vertical = BorderSide.none, 
	BorderSide horizontal = BorderSide.none
	})
```

### 类BorderSide

##### 文字资料

```
https://api.flutter.dev/flutter/painting/BorderSide-class.html
```

##### 构造函数

```
BorderSide({Color color, double width, BorderStyle style})
```

### 类BorderDirectional 

##### 文档资料

```
https://api.flutter.dev/flutter/painting/BorderDirectional-class.html
```

##### 继承关系

```
//继承父类
Object 
ShapeBorder 
BoxBorder 
BorderDirectional
```

##### 构造函数

```
BorderDirectional({
	BorderSide top, 
	BorderSide start, 
	BorderSide end, 
	BorderSide bottom
	})
```

### 类InputBorder 

#### 文档资料

```
https://api.flutter.dev/flutter/material/InputBorder-class.html
```

#### 继承关系

```
//继承父类
Object 
ShapeBorder 
InputBorder
//子类继承
OutlineInputBorder
UnderlineInputBorder
```

#### 构造函数

```
InputBorder({BorderSide borderSide})
```

### 类OutlineInputBorder 

#### 文档资料

```
https://api.flutter.dev/flutter/material/OutlineInputBorder-class.html
```

#### 父类

```
//父类
Object 
ShapeBorder 
InputBorder 
OutlineInputBorder
```

#### 构造函数

```
OutlineInputBorder({
BorderSide borderSide = const BorderSide(), 
BorderRadius borderRadius, 
double gapPadding
})
```

### 类UnderlineInputBorder 

#### 文档资料

```
https://api.flutter.dev/flutter/material/UnderlineInputBorder-class.html
```

#### 继承关系

```
Object
ShapeBorder
InputBorder
UnderlineInputBorder
```

#### 构造函数

```
UnderlineInputBorder({
BorderSide borderSide = const BorderSide(), 
BorderRadius borderRadius
})
```

### 抽象类OutlinedBorder 

#### 文档资料

```
https://api.flutter.dev/flutter/painting/OutlinedBorder-class.html
```

#### 继承关系

```
//父类
Object 
ShapeBorder 
OutlinedBorder
//子类
BeveledRectangleBorder
CircleBorder
ContinuousRectangleBorder
MaterialStateOutlinedBorder
RoundedRectangleBorder
StadiumBorde
```

#### 构造函数

```
OutlinedBorder({BorderSide side})
```

### 类BeveledRectangleBorder

#### 文档资料

```
https://api.flutter.dev/flutter/painting/BeveledRectangleBorder-class.html
```

#### 继承关系

```
Object 
ShapeBorder 
OutlinedBorder 
BeveledRectangleBorder
```

#### 构造函数

```
BeveledRectangleBorder({
BorderSide side = BorderSide.none, 
BorderRadiusGeometry borderRadius
})
```

### 类CircleBorder 

#### 继承关系

```
Object 
ShapeBorder 
OutlinedBorder 
CircleBorder
```

#### 构造函数

```
CircleBorder({BorderSide side = BorderSide.none})
```

### 类ContinuousRectangleBorder 

#### 继承关系

```
Object 
ShapeBorder 
OutlinedBorder 
ContinuousRectangleBorder
```

#### 构造函数

```
ContinuousRectangleBorder({
BorderSide side = BorderSide.none, 
BorderRadiusGeometry borderRadius
})
```

### 抽象类MaterialStateOutlinedBorder 

#### 文档资料

```
https://api.flutter.dev/flutter/material/MaterialStateOutlinedBorder-class.html
```

#### 继承关系

```
//父类
Object 
ShapeBorder 
OutlinedBorder 
MaterialStateOutlinedBorder
//子类
MaterialStateProperty<OutlinedBorder?>
```

### 简例01

```dart
class SelectedBorder extends RoundedRectangleBorder implements MaterialStateOutlinedBorder {
  @override
  OutlinedBorder? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.selected)) {
      return const RoundedRectangleBorder();
    }
    return null;  // Defer to default value on the theme or widget.
  }
}
bool isSelected = true;
@override
Widget build(BuildContext context) {
  return FilterChip(
    label: const Text('Select chip'),
    selected: isSelected,
    onSelected: (bool value) {
      setState(() {
        isSelected = value;
      });
    },
    shape: SelectedBorder(),
  );
}
```

### 类RoundedRectangleBorder

#### 文档资料

```
https://api.flutter.dev/flutter/painting/RoundedRectangleBorder-class.html
```

#### 继承关系

```
//父类
Object 
ShapeBorder 
OutlinedBorder 
RoundedRectangleBorder
```

##### 构造函数

```
RoundedRectangleBorder({
BorderSide side = BorderSide.none, 
BorderRadiusGeometry borderRadius
})
```

### 类StadiumBorder 

##### 文档资料

```
https://api.flutter.dev/flutter/painting/StadiumBorder-class.html
```

##### 父类

```
Object->ShapeBorder-> OutlinedBorder-> StadiumBorder
```

##### 构造函数

```
StadiumBorder({BorderSide side = BorderSide.none})
```

### 类InputDecorator 

##### 文档位置

```
https://api.flutter.dev/flutter/material/InputDecorator-class.html
```

##### 父类

```
Object DiagnosticableTree Widget StatefulWidget InputDecorator
```

##### 构造函数

```
InputDecorator({
Key? key, 
required InputDecoration decoration, 
TextStyle? baseStyle, 
TextAlign? textAlign, 
TextAlignVertical? textAlignVertical, 
bool isFocused, 
bool isHovering, 
bool expands, 
bool isEmpty, 
Widget? child
})
```

