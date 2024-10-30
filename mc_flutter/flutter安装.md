### 环境变量

```
//ANDROID_HOME
D:\softsetting\androidsdk
//ANDROID_SDK_HOME
D:\softsetting\androidstudio
//CLASSPATH
%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar
//DART_SDK
D:\softsetting\dartsdk

//FLUTTER_STORAGE_BASE_URL
https://storage.flutter-io.cn
//PUB_HOSTED_URL
https://pub.flutter-io.cn

//GRADLE_USER_HOME
D:\softsetting\androidstudio\.gradle

//JAVA_HOME
D:\ProgramFiles\Java\jdk1.8.0_144

//Goland
D:\ProgramFiles\GoLand\bin

//GOPATH
D:\project\go
```

### dart版本

```
https://dart.dev/tools/sdk/archive
```

```
https://storage.googleapis.com/dart-archive/channels/<stable|beta|dev>/release/<version>/sdk/dartsdk-<platform>-<architecture>-release.zip
```

```
https://storage.googleapis.com/dart-archive/channels/stable/release/2.7.2/sdk/dartsdk-windows-ia32-release.zip
https://storage.googleapis.com/dart-archive/channels/stable/release/2.1.1/sdk/dartsdk-macos-x64-release.zip
https://storage.googleapis.com/dart-archive/channels/beta/release/2.8.0-20.11.beta/sdk/dartsdk-linux-x64-release.zip
https://storage.googleapis.com/dart-archive/channels/dev/release/2.9.0-1.0.dev/sdk/dartsdk-linux-x64-release.zip
```

### 国内镜像

// android\build.gradle

```
   repositories {
        // google()
        // jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        // maven { url 'https://maven.aliyun.com/repository/gradle-plugin' }
        maven {url 'http://download.flutter.io'}
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'https://maven.aliyun.com/repository/public' }
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:3.5.0'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    }
}

allprojects {
    repositories {
        // google()
        // jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        // maven { url 'https://maven.aliyun.com/repository/gradle-plugin' }
        maven {url 'http://download.flutter.io'}
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'https://maven.aliyun.com/repository/public' }
    }
}
```

### flutter sdk 

rootPath]\flutter\packages\flutter_tools\gradle\flutter.gradle

```
buildscript {
    repositories {
        // google()
        // jcenter()
        maven { url 'https://maven.aliyun.com/repository/google' }
        maven { url 'http://download.flutter.io'}
        // maven { url 'https://maven.aliyun.com/repository/gradle-plugin' }
        maven { url 'https://maven.aliyun.com/repository/jcenter' }
        maven { url 'https://maven.aliyun.com/repository/public' }
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:3.5.0'
    }
}
...
class FlutterPlugin implements Plugin<Project> {
	// 此处也要修改其值
    private static final String MAVEN_REPO      = "https://storage.flutter-io.cn/download.flutter.io";
...
```

### yaml文件

最好定义好版本

```
version: 1.0.0+1

environment:
  sdk: "2.12.1"		  //dart
  flutter: "2.0.2"    //flutter

dependencies:
  flutter:
    sdk: flutter


  # The following adds the Cupertino Icons font to your application.
  # Use with the CupertinoIcons class for iOS style icons.
  cupertino_icons: ^1.0.2
  get: any
```

### copyright

```
Flutter:2.0.2, Dart:2.12.1
Project:$project.name,FileName:$file.fileName
CreateDate:$today
Author: Abert.Zhang,E-mail:z_chunhua@126.com
Copyright(c)2019-$today.year
Flutter Go-->>
```

