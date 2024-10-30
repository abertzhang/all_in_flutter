### 类AnimatedBuilder

#### 继承关系

```dart
//继承父类Inheritance
Object 
  DiagnosticableTree 
  Widget StatefulWidget 
  AnimatedWidget 
  AnimatedBuilder
```

#### 构造函数

```dart
AnimatedBuilder({
  Key? key, 
  required Listenable animation, 
  required TransitionBuilder builder, 
  Widget? child
})  
```

### 类TweenAnimationBuilder

```dart
TweenAnimationBuilder({
  Key? key, 
  required Tween<T> tween, 
  required Duration duration, 
  Curve curve = Curves.linear, 
  required ValueWidgetBuilder<T> builder, 
  VoidCallback? onEnd, 
  Widget? child
})
```

### 预定义

```dart
ValueWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T value,
  Widget? child
)
```



### 文档资料

[官方文档AnimationedBuilder](https://api.flutter.dev/flutter/widgets/AnimatedBuilder-class.html)

[文档TweenAnimationBuilder](https://api.flutter.dev/flutter/widgets/TweenAnimationBuilder-class.html)