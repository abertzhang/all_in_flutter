### <u>优化检测工具</u>

#### Flutter Inspector

#### 性能图层

#### Raster 线程问题

#### UI 线程问题定位

#### 检查多视图叠加的视图渲染开关 checkerboardOffscreenLayers

#### 检查缓存的图像开关 checkerboardRasterCacheImages

#### 监控工具[fps_monitor](https://github.com/Nayuta403/fps_monitor)

#### 流畅度检测工具[Flutter Fps](https://juejin.cn/post/6947911434424549384)

### <u>优化指标</u>

#### 页面异常率

#### 页面帧率

#### 页面加载时长

### <u>启动优化</u>

#### Flutter 引擎预加载

#### Dart VM 预热

### <u>布局优化</u>

### <u>内存优化</u>

#### const 实例化

**const 对象只会创建一个编译时的常量值。在代码被加载进 Dart Vm 时，在编译时会存储在一个特殊的查询表里，由于 flutter 采用了 AoT 编译，const + values 的方式会提供一些小的性能优势。**例如：const Color() 仅仅只分配一次内存给当前实例。

#### 识别出消耗多余内存的图片

Flutter Inspector：点击 “Invert Oversized Images”，它会识别出那些解码大小超过展示大小的图片，并且系统会将其倒置，这些你就能更容易在 App 页面中找到它。针对这些图片，你可以指定 cacheWidth 和 cacheHeight 为展示大小，这样可以让 flutter 引擎以指定大小解析图片，减少内存消耗。

<img src="http://qiniu-article.myflutter.cn/img/5f40b02b91214afeafe39ff2ac183c15~tplv-k3u1fbpfcp-zoom-in-crop-mark:3024:0:0:0.png" alt="img" style="zoom: 50%;" />

#### ListView item 中有 image 的情况来优化内存

ListView 不能够杀死那些在屏幕可视范围之外的那些 item，如果 item 使用了高分辨率的图片，那么它将会消耗非常多的内存。

换言之，ListView 在默认情况下会在整个滑动/不滑动的过程中让子 Widget 保持活动状态，这一点是通过 AutomaticKeepAlive 来保证，在默认情况下，每个子 Widget 都会被这个 Widget 包裹，以使被包裹的子 Widget 保持活跃。

其次，如果用户向后滚动，则不会再次重新绘制子 Widget，这一点是通过 RepaintBoundaries 来保证，在默认情况下，每个子 Widget 都会被这个 Widget 包裹，它会让被包裹的子 Widget 仅仅绘制一次，以此获得更高的性能。

但，这样的问题在于，如果加载大量的图片，则会消耗大量的内存，最终可能使 App 崩溃。

通过将这两个选项置为 false 来禁用它们，这样不可见的子元素就会被自动处理和 GC。

```
ListView.builder(
  ...
  addAutomaticKeepAlives: false (true by default)
  addRepaintBoundaries: false (true by default)
);
```

由于重新绘制子元素和管理状态等操作会占用更多的 CPU 和 GPU 资源，但是它能够解决你 App 的内存问题，并且会得到一个高性能的视图列表。

### <u>编码优化</u>

#### 使用const和const构造器

#### 用Widget代替函数创建组件

#### 用nil来占位

对于留白占位组件，我们经常使用`const SizedBox()`。这样的确足够简单，但是还不够，通过查看`SizedBox`的源码，发现`SizedBox`最终还是会对应创建`RenderConstrainedBox`渲染对象，这就免不了去paint()。使用**return** nil;

```dart
const nil = Nil();
/// A widget which is not in the layout and does nothing.
/// It is useful when you have to return a widget and can't return null.
class Nil extends Widget {
  /// Creates a [Nil] widget.
  const Nil({Key? key}) : super(key: key);
  @override
  Element createElement() => _NilElement(this);
}

class _NilElement extends Element {
  _NilElement(Nil widget) : super(widget);
  @override
  void mount(Element? parent, dynamic newSlot) {
    assert(parent is! MultiChildRenderObjectElement, """
        You are using Nil under a MultiChildRenderObjectElement.
        This suggests a possibility that the Nil is not needed or is being used improperly.
        Make sure it can't be replaced with an inline conditional or
        omission of the target widget from a list.
        """);

    super.mount(parent, newSlot);
  }

  @override
  bool get debugDoingBuild => false;
  @override
  void performRebuild() {}
}
```

####  keys 提高性能

#### 使用构造函数

```
ListView.builder(
  ...
   addAutomaticKeepAlives: false (true by default)
   addRepaintBoundaries: false (true by default)
);
```

ListView 无法杀死它的子节点，因为它们在屏幕上不可见。如果child里有高分辨率的图像，会消耗大量的内存。做这些选项错误，可能导致使用更多的 GPU 和 CPU 工作，但它可以解决我们的内存问题，您将得到一个非常高性能的看法没有明显的问题。

#### 遵循 Dart 风格

UpperCamelCase 名称将每个单词的首字母大写，包括第一个单词。

lowerCamelCase 每个单词的第一个字母都大写，除了第一个字母总是小写，即使它是首字母缩略词。

lowercase*with_underscores 名称只使用小写字母，即使对于首字母缩写也是如此，而使用 _ 的单词也是如此。

类、枚举类型、 typedef 和类型参数应该大写每个单词(包括第一个单词)的第一个字母，并且不使用分隔符。

```dart
//使用 UpperCamelCase 命名类型
good
class SliderMenu { ... }
class HttpRequest { ... }
typedef Predicate<T> = bool Function(T value);
const foo = Foo();
@foo
class C { ... }
//使用以下命名库、包、目录和源文件
Good
library peg_parser.source_scanner;
import 'file_system.dart';
import 'slider_menu.dart';

Bad
library pegparser.SourceScanner;
import 'file-system.dart';
import 'SliderMenu.dart';
//使用以下命名库、包、目录和源文件
Good
library peg_parser.source_scanner;
import 'file_system.dart';
import 'slider_menu.dart';

Bad
library pegparser.SourceScanner;
import 'file-system.dart';
import 'SliderMenu.dart';
```

#### 少MediaQuery/LayoutBuilder

#### async/await 代替 then 函数

#### 有效使用操作符

```dart
var car = van == null ? bus : audi;         // Old pattern
var car = audi ?? bus;                      // New pattern
var car = van == null ? null : audi.bus;    // Old pattern
var car = audi?.bus;                        // New pattern
(item as Car).name = 'Mustang';         // Old pattern
if (item is Car) item.name = 'Mustang'; // New pattern
```

#### 利用字符串模板内插

```dart
// Inappropriate

var discountText = 'Hello, ' + name + '! You have won a brand new ' + brand.name + 'voucher! Please enter your email to redeem. The offer expires within ' + timeRemaining.toString() ' minutes.';

// Appropriate

var discountText = 'Hello, $name! You have won a brand new ${brand.name} voucher! Please enter your email to redeem. The offer expires within ${timeRemaining} minutes.';

```

#### 使用 for/while 代替 foreach/map

<img src="http://qiniu-article.myflutter.cn/img/102f0270e3424a0aacde7ec7ba6d8fcb~tplv-k3u1fbpfcp-zoom-in-crop-mark:3024:0:0:0.png" alt="img" style="zoom:67%;" />

####  精确显示图片和图标

<img src="https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/3360b306d0984876bef0b2c4bf7bfb78~tplv-k3u1fbpfcp-zoom-in-crop-mark:3024:0:0:0.image" alt="img" style="zoom:67%;" />

#### 使用 SKSL Warmup

```
flutter run --profile --cache-sksl --purge-persistent-cache
flutter build apk --cache-sksl --purge-persistent-cache
```

#### 使用 RepaintBoundary widgets

Flutter widgets 与渲染对象相关联。渲染对象有一个名为 paint 的方法，用于执行绘制。但是，即使关联的 widgets 实例不变，也可以调用 paint 方法。这是因为如果其中一个被标记为脏的话，Flutter 可能会对同一层中的其他渲染对象执行重新绘制。当渲染对象需要通过 RenderObject.markneedspaint 重新绘制时，它会告诉它最近的祖先重新绘制。祖先对其祖先执行相同的操作，可能直到根 RenderObject 为止。当一个渲染对象的 paint 方法被触发时，它在同一层中的所有子渲染对象都将被重新绘制。

在某些情况下，当需要重新绘制渲染对象时，同一层中的其他渲染对象不需要重新绘制，因为它们呈现的内容保持不变。换句话说，如果我们只能重新绘制某些渲染对象会更好。使用 RepaintBoundary 对于限制 markneedspain 在渲染树上的传播和 paintChild 在渲染树上的传播非常有用。RepaintBoundary 可以将祖先呈现对象与后代呈现对象解耦。因此，只能重新绘制内容发生变化的子树。使用 RepaintBoundary 可以显著提高应用程序的性能，特别是如果不需要重新绘制的子树需要大量的重新绘制工作时。

#### 使用命名构造器

#### 主动释放资源

#### 不要在 List Map 中使用引用

```
List a = [1,2,3,4];
List b;
b = a;
a.remove(1);
print(a);  // [2,3,4]
print(b);  // [2,3,4]
//准确使用方法
List a = [1,2,3,4];
List b;
b = jsonDecode(jsonEncode(a));
a.remove(1);
print(a);  // [2,3,4]
print(b);  // [1,2,3,4]
```

由于这个原因，每当您尝试调用列表 a 的任何方法时，都会自动调用列表 b。比如 a.remove (some) ; 也会从列表 b 中删除该项;

#### 避免 build中耗时操作

#### 隐藏组件使用Visibility

[Flutter](https://so.csdn.net/so/search?q=Flutter&spm=1001.2101.3001.7020)中的Offstage与Visibility都可以将子widget进行隐藏，不同的是Visibility可以设置隐藏之后是否还占据原来的控件、设置隐藏后是否响应事件，Offstage隐藏后之前所占的空间就会消失。

 [Offstage](https://juejin.cn/post/6995009905371381791) 组件可以控制 `child` 的`显隐`，与它相比较的往往是 `Visibility` 组件。Offstage 源码中有对 `Visibility` 的一句介绍：它可以更高效地`隐藏`组件(尽管不那么微妙)。

Visibility更高效

`Visibility 组件` 可以说是显隐功能的合集。能控制四个属性：是否接受事件、是否保持尺寸、是否保持状态、是否停止动画，分别由 IgnorePointer、Opacity、Offstage 和 TickerMode 实现。是一个上层的简单封装，目的是方便用户使用，尽可能少犯错误。所以如果想显隐组件，又不知道用什么好，Visibility 可以无脑翻牌。

```
//其中maintainSize就是保持大小不变，但是单独设置这一个不行，会报错，maintainAnimation和maintainState也需要同时设置。
Visibility(
  visible: true,
  maintainAnimation: true,
  maintainSize: true,
  maintainState: true,
  child: Text("补测"),
)
```

[文档资料](https://blog.csdn.net/qq_30447263/article/details/128619630?utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-4-128619630-blog-115504251.235^v27^pc_relevant_3mothn_strategy_and_data_recovery&spm=1001.2101.3001.4242.3&utm_relevant_index=6)

opacity耗性能

if条件是否显示组件会导致页面重新绘制

### <u>包体积优化</u>

#### 图片优化

#### 移除冗余的二三库

#### 启用代码缩减和资源缩减

打开 minifyEnabled 和 shrinkResources，构建出来的 release 包会减少 10% 左右的大小，甚至更多。

#### 构建单 ABI 架构的包

目前手机市场上，x86 / x86_64/armeabi/mips / mips6 的占有量很少，arm64-v8a 作为最新一代架构，是目前的主流，而 armeabi-v7a 只存在少部分的老旧手机中。

所以，**为了进一步优化包大小，你可以构建出单一架构的安装包，在 Flutter 中可以通过以下方式来构建出单一架构的安装包**：

```
cd <flutter应用的android目录>
flutter build apk --split-per-abi
```

如果想进一步压缩包体积可将 so 进行动态下发，将 so 放在远端进行动态加载，不仅能进一步减少包体积也可以实现代码的热修复和动态加载。

### <u>文档资料</u>

[Flutter卡顿优化锦辑](https://juejin.cn/post/6844904079773138957)

[Flutter调优工具使用及Flutter高性能编程部分要点分析](https://juejin.cn/post/7157905466821967902)

[Flutter | 性能优化——如何避免应用 jank](https://juejin.cn/post/6844903974752124941)

[17 个提高性能的 Flutter 最佳实践](https://juejin.cn/post/7091049136287383560)

[超级全面的Flutter性能优化实践](https://juejin.cn/post/7145730792948252686#heading-12)

[深入探索Flutter性能优化](https://juejin.cn/post/7066954522655981581)

[Flutter 性能优化 Tips](https://juejin.cn/post/6844903736956059662)

[淘特 Flutter 流畅度优化实践](https://juejin.cn/post/7046305749097512997)

[ListView流畅度翻倍！！Flutter卡顿分析和通用优化方案](https://juejin.cn/post/6940134891606507534)

[已开源！Flutter 流畅度优化组件 Keframe](https://juejin.cn/post/6979781997568884766)

[Flutter之旅：Dart语法扫尾-包访问-泛型--异常-异步-mixin](https://juejin.cn/post/6844903881441280007)

```
  late AppLifecycleState? _lifeState;
  late final AppLifecycleListener _onLifeListener;
  @override
  void initState() {
    super.initState();
    _lifeState = SchedulerBinding.instance.lifecycleState;

    _onLifeListener = AppLifecycleListener(
      onResume: () {
        LogUtil.v('main-onResume');
        UpgradeUtil().fetchUpgrade();
      },
    );
    // HMYAliPushUtils.instance.initAliyunPush();
  }

  @override
  void dispose() {
    _onLifeListener.dispose();
    _lifeState = null;
    super.dispose();
  }
```

