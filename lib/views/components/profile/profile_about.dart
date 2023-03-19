import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_const.dart';
import '../../../core/config/app_strings.dart';
import '../../../core/config/app_strings.dart';
import '../../../core/config/app_strings.dart';
import '../../../core/config/app_theme.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/space.dart';

class ProfileAbout extends StatelessWidget {
  const ProfileAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Padding(
          padding: EdgeInsets.only(right: 4.7.w,left: 7.7.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                AppStrings.about,
                color: AppTheme.neutral500,
                fontSize: AppConsts.textSize.sp + 1.sp,

              ),

              IconButton(
                onPressed: (){},
                icon: CustomText(
                  AppStrings.edit,
                  color: AppTheme.primary500Clr,
                  fontSize: AppConsts.textSize.sp,

                ),
              ),
            ],
          ),
        ),

        Space(height: 1.h,),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.7.w),
          child: CustomText(
            "I'm Rafif Dian Axelingga, I’m UI/UX Designer, I have experience designing UI Design for approximately 1 year. I am currently joining the Vektora studio team based in Surakarta, Indonesia.I am a person who has a high spirit and likes to work to achieve what I dream of.",
            color: AppTheme.neutral500,
            fontSize: AppConsts.subTextSize.sp,
            maxLines: 6,
          ),
        ),




        

      ],
    );
  }
}
