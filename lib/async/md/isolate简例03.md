---
title: isolate简例03
tags:
  - 异步
  - null
categories: dart
copyright: true
top: 1
toc: true
sidebar: true
date: 2021-02-14 12:00:51
updated_at: 2021-02-14 12:00:51
---
摘要:
    Flutter快速开发App
    
<!-- more -->

### 最简单的isolate

```
import 'dart:isolate';
main(List<String> args) async {
  //接收和监听功能
  final mainReceivePort = ReceivePort();
  mainReceivePort.listen((onData) {
    print("mainReceive:$onData");
  });
  await Isolate.spawn(entryFunction, mainReceivePort.sendPort);
}
//在新isolate上运行,可以共享全局类的变量
void entryFunction(SendPort sendPort) {
  String sendMsg = "from new isolate!";
  sendPort.send(sendMsg);
}
```

