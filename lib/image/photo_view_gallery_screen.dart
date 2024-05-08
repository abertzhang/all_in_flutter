import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewGalleryScreen extends StatefulWidget {
  final List? images;
  final List? assets;
  final int index;
  final String? heroTag;

  const PhotoViewGalleryScreen({Key? key, this.images, this.assets, this.index = 0, this.heroTag}) : super(key: key);

  @override
  PhotoViewGalleryScreenState createState() => PhotoViewGalleryScreenState();
}

class PhotoViewGalleryScreenState extends State<PhotoViewGalleryScreen> {
  int _currentIndex = 0;
  PageController? _controller;

  @override
  Widget build(BuildContext context) {
    int len = 0;

    if (widget.images != null) {
      len = widget.images!.length;
    } else if (widget.assets != null) {
      len = widget.assets!.length;
    } else {
      return const SizedBox();
    }

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
                  imageProvider: NetworkImage(widget.images![index]),
                  heroAttributes: widget.heroTag != null && widget.heroTag!.isNotEmpty ? PhotoViewHeroAttributes(tag: widget.heroTag!) : null,
                );
              },
              itemCount: len,
              backgroundDecoration: null,
              pageController: _controller,
              enableRotation: true,
              loadingBuilder: (context, event) => Center(
                child: SizedBox(
                  width: 25.0,
                  height: 25.0,
                  child: CircularProgressIndicator(
                    value: event == null ? 0 : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
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
              child: Text("${_currentIndex + 1}/$len", style: const TextStyle(color: Colors.white, fontSize: 16)),
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
    super.dispose();
    _controller?.dispose();
  }
}
