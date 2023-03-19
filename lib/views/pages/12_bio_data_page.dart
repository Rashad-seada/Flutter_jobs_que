import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/core/config/app_enums.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';
import '../../core/config/app_theme.dart';
import '../components/apply_job/phone_number_field.dart';
import '../widgets/auth_field.dart';
import '../widgets/custom_text.dart';
import '../widgets/space.dart';

class BioDataPage extends StatelessWidget {
  const BioDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          CustomText(
            AppStrings.bioData,
            color: AppTheme.neutral900,
            fontSize: AppConsts.subHeadTextSize.sp ,
          ),
          Space(height: 0.3.h,),

          CustomText(
            AppStrings.fillYourBio,
            color: AppTheme.neutral700,
            fontSize: AppConsts.subTextSize.sp,
          ),
          Space(height: 4.h,),

          CustomText(
            AppStrings.fullName,
            color: AppTheme.neutral900,
            fontSize: AppConsts.textSize.sp ,
            fontWeight: FontWeight.w500,
          ),
          Space(height: 1.h,),
          AuthField(
            iconIsActive: false,
            iconType: AuthIcons.userName,
            hintText: AppStrings.enterFullName,
          ),
          Space(height: 2.5.h,),

          CustomText(
            AppStrings.email+'*',
            color: AppTheme.neutral900,
            fontSize: AppConsts.textSize.sp ,
            fontWeight: FontWeight.w500,
          ),
          Space(height: 1.h,),
          AuthField(
            iconIsActive: true,
            iconType: AuthIcons.email,
            hintText: AppStrings.enterEmail,
          ),
          Space(height: 2.5.h,),

          CustomText(
            AppStrings.phone,
            color: AppTheme.neutral900,
            fontSize: AppConsts.textSize.sp ,
            fontWeight: FontWeight.w500,
          ),
          Space(height: 1.h,),
          PhoneNumberField()



        ],
      ),
    );
  }
}
