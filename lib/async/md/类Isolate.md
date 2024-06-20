---
title: 类Isolate
tags:
  - 异步
  - null
categories: 类基础
copyright: true
top: 1
toc: true
sidebar: true
date: 2021-02-14 12:05:02
updated_at: 2021-02-14 12:05:02
---
摘要:
    Flutter快速开发App
    
<!-- more -->

### 类Isolate

```
//属于dart的Isolate库
import 'dart:isolate';
https://api.flutter.dev/flutter/dart-isolate/Isolate-class.html
```

### 构造函数

```
Isolate(
SendPort controlPort, 
{Capability? pauseCapability, 
Capability? terminateCapability
})
```

### 属性

```
controlPort → SendPort
debugName → String?
errors → Stream
pauseCapability → Capability?
terminateCapability → Capability?

```

### 方法

```
addErrorListener(SendPort port) → void
addOnExitListener(SendPort responsePort, {Object? response}) → void
kill({int priority: beforeNextEvent}) → void
pause([Capability? resumeCapability]) → Capability
ping(SendPort responsePort, {Object? response, int priority: immediate}) → void
removeErrorListener(SendPort port) → void
removeOnExitListener(SendPort responsePort) → void
resume(Capability resumeCapability) → void
setErrorsFatal(bool errorsAreFatal) → void
```

### 静态属性

```
current → Isolate
packageConfig → Future<Uri?>
packageRoot → Future<Uri?>
```

### 静态方法

```
resolvePackageUri(Uri packageUri) → Future<Uri?>
spawn<T>(void entryPoint(T message), T message, {bool paused: false, bool errorsAreFatal: true, SendPort? onExit, SendPort? onError, String? debugName}) → Future<Isolate>
spawnUri(Uri uri, List<String> args, dynamic message, {bool paused: false, SendPort? onExit, SendPort? onError, bool errorsAreFatal: true, bool? checked, Map<String, String>? environment, Uri? packageRoot, Uri? packageConfig, bool automaticPackageResolution: false, String? debugName}) → Future<Isolate>
```

### 常量

```
beforeNextEvent → const int
immediate → const int
```

