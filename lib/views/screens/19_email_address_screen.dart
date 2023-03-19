import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_enums.dart';
import 'package:jobs_que/views/widgets/auth_field.dart';
import 'package:jobs_que/views/widgets/main_button.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';
import '../../core/config/app_strings.dart';
import '../../core/config/app_theme.dart';
import '../widgets/custom_text.dart';
import '../widgets/main_back_button.dart';
import '../widgets/main_scaffold.dart';
import '../widgets/space.dart';

class EmailAddressScreen extends StatelessWidget {
  const EmailAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            children: [

              Space(height: AppConsts.appbarSpace.h,),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 3.5.w,right: 5.w),
                  child: MainBackButton(label: AppStrings.emailAddress),
                ),
              ),
              Space(height: 5.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal:7.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      '${AppStrings.mainEmailAddress}*',
                      color: AppTheme.neutral900,
                      fontSize: AppConsts.textSize.sp ,
                      fontWeight: FontWeight.w500,
                    ),
                    Space(height: 1.h,),
                    AuthField(
                      iconType: AuthIcons.email,
                      hintText: AppStrings.enterEmail,
                    ),
                    Space(height: 1.8.h,),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 3.h),
            child: MainButton(
              width: 85.w,
              height: 7.h,
              child: CustomText(
                AppStrings.save,
                color: AppTheme.textClr,
                fontSize: AppConsts.textSize.sp,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
