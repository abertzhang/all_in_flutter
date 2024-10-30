### 插件fl_chart

##### 文件位置

```
https://pub.flutter-io.cn/packages/fl_chart
```

### 导包依赖

```
fl_chart: ^0.40.0
import 'package:fl_chart/fl_chart.dart';
```

### 类BarChart

##### 实现功能

```
饼图
```



##### 继承关系

```
Inheritance
Object DiagnosticableTree Widget StatefulWidget ImplicitlyAnimatedWidget BarChart
```

##### 文件位置

```
https://pub.flutter-io.cn/documentation/fl_chart/latest/fl_chart/BarChart-class.html
```

##### 构造函数

```
BarChart(
	BarChartData data, 
	{Duration swapAnimationDuration = const Duration(milliseconds: 150), 
	Curve swapAnimationCurve = Curves.linear
})
```

### 类BarChartData

##### 实现功能

```

```

##### 文件位置

```
https://pub.flutter-io.cn/documentation/fl_chart/latest/fl_chart/BarChartData-class.html
```

##### 继承关系

```
Object BaseChartData AxisChartData BarChartData
混入EquatableMixin类
```

##### 构造函数

```
BarChartData({
	List<BarChartGroupData>? barGroups, //x轴数据组
	FlTitlesData? titlesData, //四周的标题
	BarTouchData? barTouchData, //点击后显示内容
	FlAxisTitleData? axisTitleData, 
	FlGridData? gridData, //网格线设置
	FlBorderData? borderData, //图表的外框边
	RangeAnnotations? rangeAnnotations, 
	//
	double? groupsSpace, 
    BarChartAlignment? alignment, //枚举类值同普通aligment
	double? maxY, //y轴最大值,超过柱状图会显示在外面
	double? minY, //y轴最小值,
	Color? backgroundColor//背景色
})
```

### 类BarChartGroupData

##### 继承关系

```
混入EquatableMixin
```

##### 构造函数

```
BarChartGroupData({
	required int x, //x轴
	List<BarChartRodData>? barRods, //
	double? barsSpace, 
	List<int>? showingTooltipIndicators
})
```

### 类BarChartRodData

##### 继承关系

```
混入EquatableMixin
```

##### 构造函数

```
BarChartRodData({
	required double y, //柱子高度
	List<Color>? colors, //柱子颜色
	Offset? gradientFrom, 
	Offset? gradientTo, 
	List<double>? gradientColorStops, 
	double? width, //柱子宽度
	BorderRadius? borderRadius, //柱状图的圆角
	BorderSide? borderSide, 
	BackgroundBarChartRodData? backDrawRodData, 
	List<BarChartRodStackItem>? rodStackItems//柱子内可以设置不同颜色
})
```

### 类BackgroundBarChartRodData

##### 实现功能

```

```

##### 构造函数

```
BackgroundBarChartRodData({
	double? y, 
	bool? show, 
	List<Color>? colors, 
	Offset? gradientFrom, 
	Offset? gradientTo, 
	List<double>? colorStops
})
```



### 类BarChartRodStackItem

##### 文件位置

```
https://pub.flutter-io.cn/documentation/fl_chart/latest/fl_chart/BarChartRodStackItem-class.html
```

##### 继承关系

```
混入EquatableMixin
```

##### 构造函数

```
BarChartRodStackItem(
	double fromY, //某段柱子开始位置
	double toY, //某段柱子结束位置,注意要连续
	Color color, 
	[BorderSide borderSide = DefaultBorderSide]
)
```

### 类FlTitlesData

##### 文件位置

```
https://pub.flutter-io.cn/documentation/fl_chart/latest/fl_chart/FlTitlesData-class.html
```

##### 构造函数

```
FlTitlesData({
	bool? show, 
	SideTitles? leftTitles, 
	SideTitles? topTitles, 
	SideTitles? rightTitles, 
	SideTitles? bottomTitles
})
```

### 类SideTitles

##### 构造函数

```
SideTitles({
	bool? showTitles, 
	GetTitleFunction? getTitles, 
	double? reservedSize, 
	GetTitleTextStyleFunction? getTextStyles, 
	TextDirection? textDirection, 
	double? margin, 
	double? interval, 
	double? rotateAngle, 
	CheckToShowTitle? checkToShowTitle
})
```

### 预定义GetTitleFunction

```
typedef GetTitleFunction = String Function(double value);
```

### 类BarTouchData

##### 继承关系

```
Object FlTouchData<BarTouchResponse> BarTouchData
```

##### 构造函数

```
BarTouchData({
	bool? enabled, 
	BaseTouchCallback<BarTouchResponse>? touchCallback,
    MouseCursorResolver<BarTouchResponse>? mouseCursorResolver, 
    BarTouchTooltipData? touchTooltipData, 
    EdgeInsets? touchExtraThreshold, 
    bool? allowTouchBarBackDraw, 
    bool? handleBuiltInTouches
})
```

### 类BarTouchTooltipData

##### 构造函数

```
BarTouchTooltipData({
	Color? tooltipBgColor, 
	double? tooltipRoundedRadius, 
	EdgeInsets? tooltipPadding, 
	double? tooltipMargin, 
	double? maxContentWidth, 
	GetBarTooltipItem? getTooltipItem, 
	bool? fitInsideHorizontally, 
	bool? fitInsideVertically, 
	TooltipDirection? direction, 
	double? rotateAngle
})
```

