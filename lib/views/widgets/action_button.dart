import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';
import 'custom_text.dart';

class ActionButton extends StatelessWidget {
  String action;
  String? actionImages;
  Function()? onTap;

  ActionButton({
    required this.action,
    this.actionImages,
    this.onTap,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> onTap!(),
      borderRadius: BorderRadius.circular(1000),
      child: Container(
        margin: EdgeInsets.only(bottom: 1.5.h),
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        width: 85.w,
        height: 6.5.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(1000),
          border: Border.all(color: AppTheme.neutral300),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [

            Row(
              children: [
                (actionImages == null)?SizedBox():SvgPicture.asset(actionImages!),
                Space(width: 3.w,),
                CustomText(
                  action,
                  color: AppTheme.neutral900,
                  fontSize:  AppConsts.textSize.sp ,
                ),
              ],
            ),

            SvgPicture.asset(AppImages.rightArrow),

          ],
        ),
      ),
    );
  }
}
