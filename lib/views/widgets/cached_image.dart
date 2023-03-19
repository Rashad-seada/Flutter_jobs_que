import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedImage extends StatelessWidget {
  double width;
  double height;
  Widget Function(BuildContext,String)? placeHolder;
  Widget Function(BuildContext,String,dynamic)? errorWidget;
  String imageUrl;

  CachedImage({
    this.width = 50,
    this.height = 50,
    this.placeHolder,
    this.errorWidget,
    required this.imageUrl,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(
      fadeOutDuration: const Duration(milliseconds: 50),
      fadeInDuration: const Duration(milliseconds: 50),
      width: width,
      height: height,
      fit: BoxFit.cover,
      placeholder: placeHolder,
      errorWidget: errorWidget,
      imageUrl: imageUrl,
    );
  }
}
