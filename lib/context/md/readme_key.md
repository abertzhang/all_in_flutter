### 类GlobalKey

#### 获取普通widget大小

```dart
/*
flutter中有两种布局模型分别是基于RenderBox的盒模型布局和基于Sliver的按需加载列表布局。
*/
final RenderBox renderBox =boxKey?.currentContext?.findRenderObject();
final boxHeight = renderBox?.size?.height ?? 0.0;
final boxWidth = renderBox?.size?.width ?? 0.0;
```
#### 获取普通Sliver大小
```dart
/*
对于基于Sliver的按需加载列表布局，如SliverList，可以通过如下方法得到sliver可视区域的大小
*/
final RenderSliver renderSliver =sliverKey?.currentContext?.findRenderObject();
final sliverListHeight = renderSliver?.semanticBounds?.height ?? 0.0;
final sliverListWidth = renderSliver?.semanticBounds?.width ?? 0.0;
```



### 类UniqueKey

### 类ValueKey

### 类ObjectKey

### 类PageStorageKey

### 参考文档

[Flutter组件--LocalKey,GlobalKey以及获取子组件](https://blog.csdn.net/eastWind1101/article/details/127375844?utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-0-127375844-blog-131716617.235^v43^pc_blog_bottom_relevance_base7&spm=1001.2101.3001.4242.1&utm_relevant_index=3)

[Flutter Keys： 你的终极指南，让 widget 世界更快乐](https://zhangbing.blog.csdn.net/article/details/137471452?spm=1001.2101.3001.6650.3&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EYuanLiJiHua%7ECtr-3-137471452-blog-135698370.235%5Ev43%5Epc_blog_bottom_relevance_base7&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EYuanLiJiHua%7ECtr-3-137471452-blog-135698370.235%5Ev43%5Epc_blog_bottom_relevance_base7&utm_relevant_index=4)

[flutter中获取元素的大小](https://blog.csdn.net/weixin_33979745/article/details/88810567)

[flutter获取widget的大小](https://www.jianshu.com/p/6a9f5461d600)