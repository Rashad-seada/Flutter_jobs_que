import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/custom_page_transition.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

class SettingCard extends StatelessWidget {
  String title;
  String? image;
  Widget? screenToGo;

  SettingCard({
    required this.title,
    this.image,
    this.screenToGo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        (screenToGo == null)? null: Navigator.push(context, CustomPageTransition(screenToGo!));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 1.7.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                (image == null)? SizedBox():Container(
                  width: 12.w,
                  height: 12.w,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.primary100Clr,
                    shape: BoxShape.circle
                  ),
                  child: SvgPicture.asset(image!),
                ),
                Space(width:(image == null)?0: 3.5.w,),
                CustomText(title,color: AppTheme.neutral900,fontSize: AppConsts.subHeadTextSize.sp - 8.sp,)
              ],
            ),

            SvgPicture.asset(AppImages.rightArrow),
          ],
        ),
      ),
    );
  }
}
