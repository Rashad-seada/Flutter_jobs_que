import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/cached_image.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_strings.dart';
import '../../widgets/custom_text.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          alignment: Alignment.topCenter,
          width: 100.w,
          height: 17.h,
          color: AppTheme.primary100Clr,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: AppConsts.appbarSpace.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Space(width: 7.w,),

                CustomText(
                  AppStrings.profile,
                  fontSize: 17.5.sp,
                  fontWeight: FontWeight.w500,
                ),

                SvgPicture.asset(AppImages.logout,width: 7.w,height: 7.w,),


              ],
            ),
          ),
        ),

        Positioned(
          bottom: -7.h,
          right: 0,
          left: 0,
          child: Container(
            alignment: Alignment.center,
            clipBehavior: Clip.hardEdge,
            width: 28.w,
            height: 28.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Container(
              alignment: Alignment.center,
              clipBehavior: Clip.hardEdge,
              width: 26.w,
              height: 26.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: CachedImage(
                width: 26.w,
                height: 26.w,
                imageUrl: 'https://i.redd.it/8fqzw8yxpkp11.jpg',
                errorWidget: (context,string,dynamic)=> Padding(
                  padding: const EdgeInsets.all(25),
                  child: SvgPicture.asset(AppImages.profile),
                ),
                placeHolder: (context,string)=> Padding(
                  padding: const EdgeInsets.all(25),
                  child: SvgPicture.asset(AppImages.profile),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
