import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/cached_image.dart';
import 'package:sizer/sizer.dart';

class ProfileImage extends StatelessWidget {
  String imageUrl;

  ProfileImage({
    required this.imageUrl,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 5.5.w,
      backgroundColor: AppTheme.neutral100,
      child: CachedImage(
        placeHolder: (_,string)=> Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(AppImages.profile),
        ),
        errorWidget: (_,string,dynamic)=> Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(AppImages.profile),
        ),
        imageUrl: imageUrl,
      ),
    );
  }
}
