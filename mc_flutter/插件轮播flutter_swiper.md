### 依赖导包

```
flutter_swiper: ^1.1.6
import 'package:flutter_swiper/flutter_swiper.dart';
```

### 应用场景

### 类Swiper构造函数

```
Swiper({
//生成轮播的图片
Widget Function(BuildContext, int) itemBuilder, 
PageIndicatorLayout indicatorLayout = PageIndicatorLayout.NONE,
PageTransformer transformer,
int itemCount, //图片个数,不超过20个
bool autoplay = false,  //默认自动播放false,
SwiperLayout layout = SwiperLayout.DEFAULT, //显示类型,枚举值SwiperLayout
int autoplayDelay = kDefaultAutoplayDelayMs,   //图片停留时间
bool autoplayDisableOnInteraction = true,
int duration = kDefaultAutoplayTransactionDuration,
void Function(int) onIndexChanged, //切换时响应该时间
int index, //以index开始时显示
void Function(int) onTap,  //单击时发生该事件
SwiperPlugin control,
bool loop = true,    //默认循环
Curve curve = Curves.ease,
Axis scrollDirection = Axis.horizontal,    //默认水平横向切换
SwiperPlugin pagination,
List<SwiperPlugin> plugins,       //可以定义多个分页指示器
ScrollPhysics physics,
Key key,
//控制切换箭头的颜色\类型\大小\边距\有无
SwiperController controller, 
CustomLayoutOption customLayoutOption,
double containerHeight,//高度
double containerWidth, //宽度
//小于1时图片宽度乘以该参数,剩余宽度用前后两张来补齐
double viewportFraction = 1.0,  
double itemHeight,      //图片的高度
double itemWidth,         //图片宽度
bool outer = false, //默认分页指示符显示在图片内 ,true为显示图下方
double scale,
double fade})
```



### 类Swiper命名构造

```
Swiper.children({
List<Widget> children,
bool autoplay = false,
PageTransformer transformer,
int autoplayDelay = kDefaultAutoplayDelayMs,
bool reverse = false,
bool autoplayDisableOnInteraction = true,
int duration = kDefaultAutoplayTransactionDuration,
void Function(int) onIndexChanged, int index, void Function(int) onTap,
bool loop = true, Curve curve = Curves.ease,
Axis scrollDirection = Axis.horizontal, SwiperPlugin pagination,
SwiperPlugin control, List<SwiperPlugin> plugins,
SwiperController controller, Key key,
CustomLayoutOption customLayoutOption, ScrollPhysics physics,
double containerHeight, double containerWidth,
double viewportFraction = 1.0, double itemHeight, double itemWidth,
bool outer = false, double scale = 1.0})
```

### 类SwiperControl构造

```
SwiperControl({
IconData iconPrevious = Icons.arrow_back_ios,    //翻前页的图标,默认向前箭头
IconData iconNext = Icons.arrow_forward_ios,    //默认向后箭头,也可设置null
Color color,                                //图标颜色
Color disableColor,
Key key,
double size = 30.0,                           //图标大小
EdgeInsetsGeometry padding = const EdgeInsets.all(5.0)
})
```

### 类PageIndicator

```
PageIndicator({
Key key,
double size = 20.0, double space = 5.0,
int count, double activeSize = 20.0,
PageController controller,
Color color = Colors.white30,
PageIndicatorLayout layout = PageIndicatorLayout.SLIDE,
Color activeColor = Colors.white,
double scale = 0.6,
double dropHeight = 20.0
})
```

### 类SwiperPluginConfig构造

```
SwiperPluginConfig({
int activeIndex,
int itemCount,
PageIndicatorLayout indicatorLayout,
bool outer,
Axis scrollDirection,
SwiperController controller,
PageController pageController,
SwiperLayout layout,
bool loop
})
```

### 类SwiperPluginView

```
SwiperPluginView(
SwiperPlugin plugin,
SwiperPluginConfig config
)
```

### 类SwiperPagination构造

```
SwiperPagination({                    //分页指示标志
Alignment alignment,
Key key,
EdgeInsetsGeometry margin = const EdgeInsets.all(10.0),
SwiperPlugin builder = SwiperPagination.dots})
```

### 简单示例01

```
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
void main() => runApp(MaterialApp(home: DemoSwiper()));
class DemoSwiper extends StatelessWidget {
  final List<Map> swiperImgList = [
    {"url": "https://www.itying.com/images/flutter/1.png"},
    {"url": "https://www.itying.com/images/flutter/2.png"},
    {"url": "https://www.itying.com/images/flutter/3.png"},
    {"url": "https://www.itying.com/images/flutter/4.png"}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("轮播图演示")),
      body: Container(
        width: double.infinity,
        color: Colors.blueGrey,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                swiperImgList[index]["url"],
                fit: BoxFit.fill,
              );
            },
            itemCount: swiperImgList.length,
            //可以设置null,则不显示
            pagination: SwiperPagination(),
            //可以设置null,则不显示
            control: SwiperControl(),
          ),
        ),
      ),
    );
  }
}

```

## 