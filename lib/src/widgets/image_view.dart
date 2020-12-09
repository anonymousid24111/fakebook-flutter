import 'package:fakebook_flutter_app/src/models/post.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageView extends StatefulWidget {
  List<ImagePost> images;
  ImageView(this.images);

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: PhotoViewGallery.builder(
      scrollPhysics: ScrollPhysics(),
      builder: (BuildContext context, int index) {
        return PhotoViewGalleryPageOptions(
          onTapUp: (context, details, controllerValue) =>
              Navigator.pop(context),
          //gestureDetectorBehavior: HitTestBehavior.deferToChild,
          imageProvider: NetworkImage(widget.images[index].url),
          initialScale: PhotoViewComputedScale.contained * 0.8,
          heroAttributes: PhotoViewHeroAttributes(tag: index),
        );
      },
      itemCount: widget.images.length,
      loadingBuilder: (context, event) => Center(
        child: Container(
          width: 20.0,
          height: 20.0,
          child: CircularProgressIndicator(
            value: event == null
                ? 0
                : event.cumulativeBytesLoaded / event.expectedTotalBytes,
          ),
        ),
      ),
      //backgroundDecoration: widget.backgroundDecoration,
      // pageController: widget.pageController,
      //onPageChanged: onPageChanged,
    ));
  }
}
