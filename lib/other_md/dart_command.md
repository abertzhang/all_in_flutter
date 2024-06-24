### Dart

#### 运行

```
dart run ./lib/async/sync_yield_count_main.dart
```



### Flutter

#### 打包

```dart
# 调试例子1：设置渠道为应用宝。
flutter run --dart-define=CHANNEL=YYB

# 调试例子2：设置渠道为应用宝。DEBUG参数是Y
flutter run --dart-define=CHANNEL=YYB --dart-define=DEBUG=Y

#打包例子1：打包应用宝渠道包
flutter build apk --dart-define=CHANNEL=YYB

#打包例子2：打包应用宝渠道包,DEBUG参数是Y
flutter build apk --dart-define=CHANNEL=YYB --dart-define=DEBUG=Y
```

