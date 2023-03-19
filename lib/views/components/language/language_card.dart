import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_theme.dart';

class LanguageCard extends StatelessWidget {
  String? flagImage;
  String language;
  bool isSelected;
  Function()? onTap;

  LanguageCard({
    this.flagImage,
    required this.language,
    this.isSelected = false,
    this.onTap,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap!();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.8.h,horizontal: 7.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 12.w,
                  height: 3.5.h,
                  decoration: BoxDecoration(
                    color: AppTheme.neutral100,
                    borderRadius: BorderRadius.circular(4)
                  ),
                  child:(flagImage == null)? const SizedBox(): SvgPicture.asset(flagImage!),
                ),
                Space(width: 5.w,),
                CustomText(language,color: AppTheme.neutral900,fontSize: AppConsts.subHeadTextSize.sp - 7.sp,)
              ],
            ),


            AnimatedContainer(
              alignment: Alignment.center,
              padding: EdgeInsets.all(4),
              width: 5.w,
              height: 5.w,
              decoration: BoxDecoration(
                border: Border.all(color: (isSelected)? AppTheme.primary500Clr :AppTheme.neutral400),
                shape: BoxShape.circle
              ),
              duration: Duration(milliseconds: 200),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                alignment: Alignment.center,
                  padding: EdgeInsets.all(5),
                  width: 6.w,
                  height: 6.w,
                  decoration: BoxDecoration(
                      color: (isSelected)? AppTheme.primary500Clr :Colors.white,
                      shape: BoxShape.circle
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
