import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_images.dart';
import '../../../core/config/app_theme.dart';
import '../../widgets/cached_image.dart';

class ProfileImagePicker extends StatelessWidget {
  const ProfileImagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          width: 25.w,
          height: 25.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.neutral100,
          ),
          child: CachedImage(
            width: 25.w,
            height: 25.w,
            imageUrl: 'https://i.redd.it/8fqzw8yxpkp11.jpg',
            errorWidget: (context,string,dynamic)=> SvgPicture.asset(AppImages.profile),
            placeHolder: (context,string)=> SvgPicture.asset(AppImages.profile),
          ),
        ),

        Container(
          padding: EdgeInsets.all(8.w),
          clipBehavior: Clip.hardEdge,
          width: 25.w,
          height: 25.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppTheme.neutral900.withOpacity(0.3),
          ),
          child: SvgPicture.asset(AppImages.cameraWhite),
        )
      ],
    );
  }
}
