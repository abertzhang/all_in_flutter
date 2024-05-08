import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '/utils/utils.dart';

class PhotoGalleryView extends StatefulWidget {
  final List images;
  final int index;
  final String? heroTag;

  const PhotoGalleryView({Key? key, required this.images, this.index = 0, this.heroTag}) : super(key: key);

  @override
  PhotoGalleryViewState createState() => PhotoGalleryViewState();
}

class PhotoGalleryViewState extends State<PhotoGalleryView> {
  int _currentIndex = 0;
  late PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(widget.images[index]),
                  // heroAttributes: !StringUtils.isEmpty(widget.heroTag) ? PhotoViewHeroAttributes(tag: widget.heroTag!) : null,
                  heroAttributes: ObjectUtil.isNotEmpty(widget.heroTag) ? PhotoViewHeroAttributes(tag: widget.heroTag!) : null,
                );
              },
              itemCount: widget.images.length,
              backgroundDecoration: null,
              pageController: _controller,
              enableRotation: true,
              loadingBuilder: (context, event) => Container(
                color: Colors.black,
                child: Center(
                  child: SizedBox(
                    width: 25.0,
                    height: 25.0,
                    child: CircularProgressIndicator(
                      value: event == null ? 0 : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
                    ),
                  ),
                ),
              ),
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
          Positioned(
            //图片index显示
            top: MediaQuery.of(context).padding.top + 15,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text("${_currentIndex + 1}/${widget.images.length}", style: const TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
          Positioned(
            //右上角关闭按钮
            right: 10,
            top: MediaQuery.of(context).padding.top,
            child: IconButton(
              icon: const Icon(
                Icons.close,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.index;
    _controller = PageController(initialPage: widget.index);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
