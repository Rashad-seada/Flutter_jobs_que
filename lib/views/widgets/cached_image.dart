import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedImage extends StatelessWidget {
  Widget Function(BuildContext,String)? placeHolder;
  Widget Function(BuildContext,String,dynamic)? errorWidget;
  String imageUrl;

  CachedImage({
    this.placeHolder,
    this.errorWidget,
    required this.imageUrl,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(
      width: 50,
      height: 50,
      fit: BoxFit.cover,
      placeholder: placeHolder,
      errorWidget: errorWidget,
      imageUrl: imageUrl,
    );
  }
}
