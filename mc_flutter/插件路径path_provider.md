---
title: 库path_provider
tags:
  - null
  - null
categories: 插件
copyright: true
top: 1
toc: true
sidebar: true
date: 2021-02-13 08:05:59
updated_at: 2021-02-13 08:05:59
---
摘要:
    Flutter快速开发App
    
<!-- more -->

## 插件path_provider

- 应用场景
- 官方文档

```
https://pub.dev/packages/path_provider
```

- 依赖导包

```
path_provider: ^1.6.10
import 'package:path_provider/path_provider.dart';
```

- 类函数

```
getApplicationDocumentsDirectory() → Future<Directory>
getApplicationSupportDirectory() → Future<Directory>
getDownloadsDirectory() → Future<Directory>
getExternalCacheDirectories() → Future<List<Directory>>
getExternalStorageDirectories({StorageDirectory type}) → Future<List<Directory>>
getExternalStorageDirectory() → Future<Directory>
getLibraryDirectory() → Future<Directory>
getTemporaryDirectory() → Future<Directory>
```

- 枚举类StorageDirectory

```
alarms → const StorageDirectory
const StorageDirectory(3)
dcim → const StorageDirectory
const StorageDirectory(8)
documents → const StorageDirectory
const StorageDirectory(9)
downloads → const StorageDirectory
const StorageDirectory(7)
movies → const StorageDirectory
const StorageDirectory(6)
music → const StorageDirectory
const StorageDirectory(0)
notifications → const StorageDirectory
const StorageDirectory(4)
pictures → const StorageDirectory
const StorageDirectory(5)
podcasts → const StorageDirectory
const StorageDirectory(1)
ringtones → const StorageDirectory
const StorageDirectory(2)
values → const List<StorageDirectory>
```



- 代码示例
- 其他