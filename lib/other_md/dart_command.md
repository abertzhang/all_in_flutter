### Dart

#### 运行

```
dart run ./lib/async/sync_yield_count_main.dart
```

### Pub

```dart
//Pub 会创建一个.packages 文件（位于应用程序的根路目录下），该文件将应用程
//序所依赖的每个包名相应的映射到系统缓存中的包
flutter pub get
//更新依赖到最新版本
flutter pub upgrade
//升级intl到最新版本，其它包不变
flutter pub upgrade intl
```

```dart
//清除所有缓存的 Package 并重新安装
flutter pub cache
flutter pub cache add <package> [--version <constraint>] [--all]
//系统缓存中的所有 Package 执行重安装以修正篡改的问题  
flutter pub cache repair  
/*
如果省略掉 --version，Pub 会从已知的版本中挑选一个最适合的进行安装
*/
pub cache add barback --version "<=0.8.0 <0.110"
```

```dart
/*
--style=<style> 或 -s <style> ## 指定的样式输出格式。用于指定依赖项打印输出的样式。
# 共有 简洁、树状 和 列表 三种，默认是树状样式。
# tree 以树状的形式打印依赖信息。这是默认格式。
# list 以列表的形式打印依赖信息。
# compact 以紧凑列表的形式打印依赖信息。
--dev # 打印所有包依赖信息，包括开发时期依赖。它是默认选项。
--no-dev #打印除了开发期依赖之外的所有包依赖。
--executables #打印所有可用的可执行文件。
*/
pub deps [--style=<style>] [--dev] [--no-dev] [--executables]
//
pub deps --size  

```

```dart
/*
在没有其它额外参数的情况下，pub downgrade命令会获取当前工作目录下 pubspec.yaml 文件中列出的所有依赖项以及它们间接依赖项的最低版本
*/
pub downgrade [--[no-]offline] [-n|--dry-run] [dependencies...]
//指定pub downgrade命令只将某个依赖项的版本降至最低且不影响其余依赖项
pub downgrade test  
```

```dart
/*
--dry-run 或 -n #该选项可以让你运行上传 Package 的整个流程但不会真正地上传任何文件到 pub.dev 网站。此操作可以让你在真正上传到 pub.dev 网站前检查你的上传等相关配置是否有误。
--force 或 -f  #该选项让 Pub 在上传时不再向你进行确认。正常情况下，它会在你上传时向你显示 Package 的内容以及向你进行确认。
*/
pub publish [--dry-run] [--force]

```

```dart
/*
pub uploader add bob@example.com # 我们已经向 bob@example.com 发送了一份邀请函，在他/她确认后就会成被加入上传者（权限）
pub uploader remove bob@example.com # // 成功将该上传者从 package 中移除
pub uploader --package=transmogrify add bob@example.com 
 # // 我们已经向 bob@example.com 发送了一份邀请函，在他/她确认后就会成被加入上传者（权限）
通过 pub uploader add <email> 命令发送邀请，被邀请的用户必须接受。
*/
pub uploader [options] {add/remove} <email>

```

```dart
pub outdated
```

```dart
pub global
https://www.cnblogs.com/fulade/p/14093552.html
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

