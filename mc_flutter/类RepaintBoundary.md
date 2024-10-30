### 类RepaintBoundary

#### 文档资料

[说说Flutter中的RepaintBoundary](https://blog.csdn.net/qq_17766199/article/details/103452637)

[Flutter 绘制探索 5 | 深入分析重绘范围 RepaintBoundary | 七日打卡](https://juejin.cn/post/6917786452247986190)

[Flutter Widget 之RepaintBoundary](https://juejin.cn/post/7169091691012915213)

[Flutter 绘制番外 | 将你的 Canvas 绘制保存为图片](https://juejin.cn/post/7212643320068489273)

#### 简例01--将屏幕内容保存图片

```dart
import 'dart:typed_data';
import 'dart:ui' as ui; 
final GlobalKey _repaintKey = GlobalKey();
Uint8List? imagePost;  

/// 获取截取图片的数据
  Future<Uint8List?> _getImageData() async {
    BuildContext? buildContext = _repaintKey.currentContext;
    if (buildContext != null) {
      RenderRepaintBoundary boundary = buildContext.findRenderObject() as RenderRepaintBoundary;
      // 第一次执行时，boundary.debugNeedsPaint 为 true，此时无法截图（如果为true时直接截图会报错）
      if (boundary.debugNeedsPaint) {
        // 延时一定时间后，boundary.debugNeedsPaint 会变为 false，然后可以正常执行截图的功能
        await Future.delayed(const Duration(milliseconds: 20));
        // 重新调用方法
        return _getImageData();
      }
      // 获取当前设备的像素比
      double dpr = ui.window.devicePixelRatio;
      // pixelRatio 代表截屏之后的模糊程度，因为不同设备的像素比不同
      // 定义一个固定数值显然不是最佳方案，所以以当前设备的像素为目标值
      ui.Image image = await boundary.toImage(pixelRatio: dpr);
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List? imageBytes = byteData?.buffer.asUint8List();
      // 返回图片的数据
      return imageBytes;
    }
    return null;
  }
```

#### 简例02--不显示的情况下将画板内容保存为图片

```dart
Future createCanvas() async {
  ui.PictureRecorder recorder = ui.PictureRecorder();
  Canvas canvas = Canvas(recorder);
  Size boxSize = const Size(100, 100);
  canvas.drawRect(Offset.zero & boxSize, Paint()..color = Colors.blue);
  ui.Picture picture = recorder.endRecording();
  ui.Image image = await picture.toImage(boxSize.width.toInt(), boxSize.height.toInt());
  //转换成UintList8
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  imagePost = byteData?.buffer.asUint8List();
  //转成file
  if (byteData != null) {
    File file = File('e:\box.png');
    file.writeAsBytes(imagePost!);
  }
}
```

