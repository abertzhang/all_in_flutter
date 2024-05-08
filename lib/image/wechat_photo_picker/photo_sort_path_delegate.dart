import 'package:wechat_assets_picker/wechat_assets_picker.dart';

/// create by tjie
/// 相册自定义中文路径

// class PhotoSortPathDelegate extends CommonSortPathDelegate {
//   const PhotoSortPathDelegate();
//
//   @override
//   void sort(List<AssetPathEntity> list) {
//     // 在这里你可以对每个你认为需要的路径进行判断。
//     // 我们唯一推荐更改的属性是 [name]，
//     for (final AssetPathEntity entity in list) {
//       // 如果这个路径的 `isAll` 为真，则该路径就是你需要的。
//       if (entity.isAll) {
//         // entity.name = '最近';
//       } else if (entity.name == 'Camera') {
//         // entity.name = '相机';
//       } else if (entity.name == 'WeiXin') {
//         // entity.name = '微信';
//       } else if (entity.name == 'Browser') {
//         // entity.name = '浏览器';
//       } else if (entity.name == 'Screenshots') {
//         // entity.name = '截图';
//       } else if (entity.name == 'CameraImage') {
//         // entity.name = '相机图像';
//       }
//     }
//
//     int index = list.indexWhere((AssetPathEntity element) => element.name == '最近');
//     if (index != -1) {
//       AssetPathEntity item1 = list[0];
//       AssetPathEntity item2 = list[index];
//       list[0] = item2;
//       list[index] = item1;
//     }
//   }
// }

//图片添加按钮--生成路径名称
String pathNameBuild(AssetPathEntity path) {
  switch (path.name) {
    case 'Recent':
      return '最近';
    case 'Camera':
      return '相机';
    case 'Screenshots':
      return '截屏';
    case 'WeiXin':
      return '微信';
    case 'Pictures':
      return '图库';
    default:
      return path.name;
  }
}
