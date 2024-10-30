## 插件video_player

- 应用场景
- 文档

```
https://pub.dev/packages/video_player
```

- 依赖导包

```
video_player: ^0.10.11+1
import 'package:video_player/video_player.dart';
```

- 类VideoPlayer

```
VideoPlayer(VideoPlayerController controller)
```

- 类VideoPlayerController函数

```
VideoPlayerController.asset(
String dataSource, 
{String package, 
Future<ClosedCaptionFile> closedCaptionFile
})
VideoPlayerController.file(
File file, 
{Future<ClosedCaptionFile> closedCaptionFile
})
VideoPlayerController.network(
String dataSource, 
{VideoFormat formatHint, 
Future<ClosedCaptionFile> closedCaptionFile
})
addListener(VoidCallback listener) → void
dispose() → Future<void>
initialize() → Future<void>
notifyListeners() → void
pause() → Future<void>
play() → Future<void>
removeListener(VoidCallback listener) → void
seekTo(Duration position) → Future<void>
setLooping(bool looping) → Future<void>
setVolume(double volume) → Future<void>

```


