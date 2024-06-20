### 类WidgetsBinding

#### 常用方法

```dart
void addObserver(WidgetsBindingObserver observer) => _observers.add(observer);
```

```dart
bool removeObserver(WidgetsBindingObserver observer) => _observers.remove(observer);
```



#### 使用方式

```dart
WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) {...}
WidgetsBinding.instance.addPostFrameCallback((_) {
print("单次Frame绘制回调"); //只回调一次
});
WidgetsBinding.instance.addPersistentFrameCallback((_) {
print("实时Frame绘制回调"); //每帧都回调
});
```



### 类WidgetsFlutterBinding

#### 源码

```dart
class WidgetsFlutterBinding extends BindingBase with GestureBinding, SchedulerBinding, ServicesBinding, PaintingBinding, SemanticsBinding, RendererBinding, WidgetsBinding {
  static WidgetsBinding ensureInitialized() {
    if (WidgetsBinding._instance == null) {
      WidgetsFlutterBinding();
    }
    return WidgetsBinding.instance;
  }
}
```

#### 使用方式

```dart
void main(){
WidgetsBinding binding=	WidgetsFlutterBinding.ensureInitialized();
	runApp(MyApp);
}
```

