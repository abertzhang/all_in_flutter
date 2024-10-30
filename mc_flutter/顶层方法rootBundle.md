## rootBundle top-level property

##### 官方文档

##### 定义

```
final AssetBundle rootBundle = _initRootBundle()
```

##### 代码

```
//AssetBundle，资产束的接口。
//rootBundle，默认的默认资产捆绑包。
WidgetsFlutterBinding.ensureInitialized();
  ByteData bytes = await rootBundle.load('imgs/img_banner.png');
  final buffer = bytes.buffer;
  var image = buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
```

```
Future<Uint8List> loadFromAsset(String key) async {
  final ByteData byteData = await rootBundle.load(key);
  return byteData.buffer.asUint8List();
}
```



##### 其他

```
- rootBundle.load("本地资源路径")
- NetworkAssetBundle(Uri.parse("网络资源路径")).load("网络资源路径");
- DefaultAssetBundle.of(context).load("本地资源路径");//只能在build中实用，因为需要传入context
```

```
 //返回Codec句柄
 ui.Codec codec = await ui.instantiateImageCodec(ByteData.buffer.asUint8List());
 //获取一帧图片FrameInfo
 ui.FrameInfo fi = await codec.getNextFrame();
 //获取ui.Image 
 ui.Image image = fi.image;
```

```
ByteData ByteDataObj;
//句柄(我的理解是，绘画一系列图片的对象，比如gif就是一系列图片的集合)
ui.Codec codec = await ui.instantiateImageCodec(ByteDataObj.buffer.asUint8List(),targetWidth: width,targetHeight: height);
//一帧数据
ui.FrameInfo fi = await codec.getNextFrame();
//帧数据变成ui.Image
ui.Image image = fi.image;//ByteDataObj 对象可以转成 ui.image给CanvasObj.drawImage()作为参数
//Canvas()需要PictureRecorder()来记录绘画动作，Canvas对象有可以绘画各种形状的方法；CanvasObj.drawImage()方法需要传入ui.Image【ui.Image与material中的Image不是一种widget】
//CanvasObj其他draw方法就可以在图片上绘制其他形图案或者修改图片
//
https://blog.csdn.net/lal95828/article/details/108567013?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522163686903316780271587804%2522%252C%2522scm%2522%253A%252220140713.130102334.pc%255Fall.%2522%257D&request_id=163686903316780271587804&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~first_rank_ecpm_v1~rank_v31_ecpm-3-108567013.first_rank_v2_pc_rank_v29&utm_term=flutter%E7%B1%BBCanvas%E7%94%BB%E6%96%87%E5%AD%97&spm=1018.2226.3001.4187
```

