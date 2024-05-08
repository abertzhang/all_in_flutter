/*
 * create by zhangchunhua
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'image.dart';

typedef IndexedTap = void Function(int index);

class ImageUrlShow extends StatefulWidget {
  final List<String?>? images;
  final IndexedTap? onTap;
  const ImageUrlShow({Key? key, required this.images, this.onTap}) : super(key: key);

  @override
  ImageUrlShowState createState() => ImageUrlShowState();
}

class ImageUrlShowState extends State<ImageUrlShow> {
  @override
  Widget build(BuildContext context) {
    if (ObjectUtil.isEmpty(widget.images)) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(color: const Color(0xFFF6F7FA), borderRadius: BorderRadius.circular(6)),
          height: 85,
          width: 85,
          alignment: Alignment.center,
          child: const Text('暂无图片', style: TextStyle(fontSize: 20, color: Color(0xff999999))),
        ),
      );
    }

    return Stack(
      children: [
        SizedBox(
          height: 90,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.images!.length,
            itemBuilder: (context, idx) => GestureDetector(
              onTap: () => Navigator.of(context).push(PhotoFadeRoute(page: PhotoViewGalleryScreen(images: widget.images, index: idx))),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
                width: 90,
                margin: const EdgeInsets.only(right: 10),
                child: Stack(
                  fit: StackFit.expand,
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 10,
                      right: 10,
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(imageUrl: widget.images?[idx] ?? '', fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    if (widget.onTap != null)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: InkWell(
                          onTap: () => widget.onTap!(idx),
                          child: const Icon(Icons.cancel_rounded, color: Colors.grey, size: 25),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
