/*
 * create by zhangchunhua
 * 图片上传控件
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

import '../image.dart';

class WechatPhotoPicker extends StatefulWidget {
  final int maxCount;
  final double photoWidth;
  final RxList<AssetEntity> photoAssets;
  final Color? colorBackground;
  const WechatPhotoPicker({super.key, required this.photoAssets, this.maxCount = 6, this.photoWidth = 75, this.colorBackground});
  @override
  WechatPhotoPickerState createState() => WechatPhotoPickerState();
}

class WechatPhotoPickerState extends State<WechatPhotoPicker> {
  int gridCount = 1;
  @override
  Widget build(BuildContext context) {
    gridCount = (widget.photoAssets.length + 1) > widget.maxCount ? widget.maxCount : widget.photoAssets.length + 1;
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 5,
      childAspectRatio: 1,
      shrinkWrap: true,
      children: List.generate(gridCount, (index) {
        if (index < (widget.photoAssets.length)) {
          return _buildShowPhoto(index);
        } else {
          return _buildAddPhoto();
        }
      }),
    );
  }

  // 图片添加按钮
  _buildAddPhoto() {
    return GestureDetector(
      onTap: () async {
        widget.photoAssets.value = await AssetPicker.pickAssets(
              context,
              pickerConfig: AssetPickerConfig(
                textDelegate: const AssetPickerTextDelegate(),
                maxAssets: widget.maxCount,
                selectedAssets: widget.photoAssets,
                requestType: RequestType.image,
                specialItemPosition: SpecialItemPosition.prepend,
                themeColor: Theme.of(context).primaryColor,
                sortPathDelegate: const CommonSortPathDelegate(),
                pathNameBuilder: pathNameBuild,
                specialItemBuilder: (BuildContext context, AssetPathEntity? path, int length) {
                  //不是'Recent'或'Picture'则不显示相机按钮
                  if (!(path?.isAll == true || path?.name == 'Pictures')) return null;
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      final AssetEntity? result = await CameraPicker.pickFromCamera(
                        context,
                        pickerConfig: const CameraPickerConfig(enableRecording: true, textDelegate: CameraPickerTextDelegate()),
                      );
                      if (result == null) return;
                      final AssetPicker<AssetEntity, AssetPathEntity> picker = context.findAncestorWidgetOfExactType()!;
                      final DefaultAssetPickerBuilderDelegate delegate = picker.builder as DefaultAssetPickerBuilderDelegate;
                      final DefaultAssetPickerProvider p = delegate.provider;
                      await p.switchPath(p.currentPath);
                      p.selectAsset(result);
                    },
                    child: const Center(child: Icon(Icons.camera_enhance, size: 42.0)),
                  );
                },
              ),
            ) ??
            <AssetEntity>[];
        setState(() {});
      },
      child: Center(
        child: Container(
          width: widget.photoWidth,
          height: widget.photoWidth,
          decoration: BoxDecoration(
            color: widget.colorBackground ?? const Color(0xFFF6F7FA),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.add_a_photo_outlined, size: 30, color: Color(0xff999999)),
              SizedBox(height: 5),
              Text('添加照片', style: TextStyle(fontSize: 15, color: Color(0xDD545A63))),
            ],
          ),
        ),
      ),
    );
  }

  //显示图片
  _buildShowPhoto(int index) {
    var asset = widget.photoAssets.elementAt(index);
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          child: GestureDetector(
            onTap: () {
              AssetPickerViewer.pushToViewer(
                context,
                currentIndex: index,
                previewAssets: widget.photoAssets,
                themeData: AssetPicker.themeData(Get.theme.primaryColor),
              );
            },
            child: SizedBox(
              width: widget.photoWidth,
              height: widget.photoWidth,
              child: RepaintBoundary(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image(image: AssetEntityImageProvider(asset, isOriginal: false), fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: kThemeAnimationDuration,
          top: 6,
          right: 6,
          child: GestureDetector(
            onTap: () => setState(() => widget.photoAssets.removeAt(index)),
            child: DecoratedBox(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0), color: Theme.of(context).canvasColor.withOpacity(0.8)),
              child: const Icon(Icons.cancel_rounded, size: 20.0, color: Colors.grey),
            ),
          ),
        )
      ],
    );
  }
}
