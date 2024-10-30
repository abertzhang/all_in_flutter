### 依赖导包

```dart
sensors_plus: ^3.0.2
import 'package:sensors_plus/sensors_plus.dart';
```

### 库sensors_plus

#### 包含类

```dart
AccelerometerEvent
GyroscopeEvent
MagnetometerEvent
Sensors
SensorsPlatform
UserAccelerometerEvent  
```



#### 常用属性

```dart
accelerometerEvents → Stream<AccelerometerEvent>
gyroscopeEvents → Stream<GyroscopeEvent>
magnetometerEvents → Stream<MagnetometerEvent>
userAccelerometerEvents → Stream<UserAccelerometerEvent>  
```



### 类Sensors

#### 常用属性

```dart
//有重力影响
accelerometerEvents → Stream<AccelerometerEvent>
//陀螺仪
gyroscopeEvents → Stream<GyroscopeEvent>
//
magnetometerEvents → Stream<MagnetometerEvent>
//无重力影响  
userAccelerometerEvents → Stream<UserAccelerometerEvent>  
```

### 类GyroscopeEvent

#### 常用属性

```
x → double
y → double
z → double
```



#### 参考资料

[官方文档sensors_plus](https://pub-web.flutter-io.cn/packages/sensors_plus/install)

[Flutter传感器](https://blog.csdn.net/qq_38779672/article/details/119649429)

[贪吃蛇](https://developer.aliyun.com/article/1049899)

[Flutter 仿自如App裸眼3D](https://juejin.cn/post/6991409083765129229)

[Flutter 实现 “真” 3D 动画效果，用纯代码实现立体 Dash 和 3D 掘金 Logo](https://juejin.cn/post/7129239231473385503)

[OpenGl仿自如裸眼3D效果](https://juejin.cn/post/7035645207278256165)