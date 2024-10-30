### 检查flutter sdk

```
flutter doctor
flutter doctor -v //详细的问题点

```

更新flutter sdk

```
flutter upgrade
```

获取第三方插件

```
flutter packages get
```

创建一个flutter 项目

```
flutter create my_flutter_app//注意不能横线-
//创建一个包含包名的flutter项目,
flutter create --org=com.x7data my_flutter_app
flutter create --org=com.x7data --android-language=java my_flutter_app
flutter create --org=com.x7data --ios-language=objc my_flutter_app
//改变已有的语言
flutter create --org=com.x7data --android-language=java --ios-language=objc my_flutter_app
//误删后,重新创建一个项目,不覆盖现有的文件
flutter create --no-overwrite --org==com.x7data my_flutter_app
//windows平台
flutter create --platforms=windows
flutter create --platforms=macos
flutter create --platforms=linux
flutter create --platforms=web
//如果需要以上平台需要把channel改成master
flutter channel master
```

列出所有的设备

```
flutter devices
```

在指定的设备上运行app,

```
flutter run -d 64519b22
flutter run -d 64519b22 -v  //-v详细问题列出
```

在windows上平台运行

```
flutter run -d windows -t lib/main_win.dart
```

使用哪个版本

```
flutter channel

```

