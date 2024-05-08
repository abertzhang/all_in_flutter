/*
 * create by zhangchunhua
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';
import 'image.dart';

typedef IndexedTap = void Function(int index);

class ImageUrlGrid extends StatefulWidget {
  final List<String?>? images;
  final IndexedTap? onTap;
  const ImageUrlGrid({Key? key, required this.images, this.onTap, this.photoWidth = 75}) : super(key: key);
  final double photoWidth;
  @override
  ImageUrlGridState createState() => ImageUrlGridState();
}

class ImageUrlGridState extends State<ImageUrlGrid> {
  @override
  Widget build(BuildContext context) {
    if (ObjectUtil.isEmpty(widget.images)) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(color: const Color(0xFFF6F7FA), borderRadius: BorderRadius.circular(6)),
          height: widget.photoWidth,
          width: widget.photoWidth,
          alignment: Alignment.center,
          child: Text('暂无图片', style: TextStyle(fontSize: 42.sp, color: const Color(0xff999999))),
        ),
      );
    }
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.images!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 0,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, idx) {
        return GestureDetector(
          onTap: () => Navigator.of(context).push(PhotoFadeRoute(page: PhotoViewGalleryScreen(images: widget.images, index: idx))),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
            margin: const EdgeInsets.only(right: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: widget.photoWidth,
                  width: widget.photoWidth,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(imageUrl: widget.images?[idx] ?? '', fit: BoxFit.cover),
                  ),
                ),
                //删除功能
                if (widget.onTap != null)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: InkWell(onTap: () => widget.onTap!(idx), child: const Icon(Icons.cancel_rounded, color: Colors.grey, size: 25)),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
