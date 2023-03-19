import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/core/config/app_enums.dart';
import 'package:jobs_que/views/widgets/auth_field.dart';
import 'package:jobs_que/views/widgets/custom_page_transition.dart';
import 'package:jobs_que/views/widgets/main_button.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';
import '../../core/config/app_strings.dart';
import '../../core/config/app_theme.dart';
import '../components/apply_job/phone_number_field.dart';
import '../components/two_step_verification/hint_card.dart';
import '../widgets/custom_text.dart';
import '../widgets/main_back_button.dart';
import '../widgets/main_scaffold.dart';
import '../widgets/space.dart';
import '06_enter_pin_screen.dart';

class TwoStepVerificationConfirmScreen extends StatelessWidget {
  const TwoStepVerificationConfirmScreen({Key? key}) : super(key: key);

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
                  child: MainBackButton(label: AppStrings.twoStepVerification),
                ),
              ),
              Space(height: 5.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal:7.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    CustomText(
                      "${AppStrings.addPhoneNumber}*",
                      color: AppTheme.neutral900,
                      fontSize: AppConsts.subHeadTextSize.sp - 7.sp ,
                      fontWeight: FontWeight.w500,
                    ),
                    Space(height: .9.h,),
                    CustomText(
                      AppStrings.weWillSendVerification,
                      color: AppTheme.neutral500,
                      fontSize: AppConsts.subTextSize.sp,
                      fontWeight: FontWeight.w400,
                      maxLines: 5,
                    ),
                    Space(height: 1.h,),
                    PhoneNumberField(),
                    Space(height: 2.h,),


                    CustomText(
                      AppStrings.enterYour("${AppStrings.password}*"),
                      color: AppTheme.neutral900,
                      fontSize: AppConsts.subHeadTextSize.sp - 7.sp ,
                      fontWeight: FontWeight.w500,
                    ),
                    Space(height: 1.h,),
                    AuthField(
                      isSecure: true,
                      iconType: AuthIcons.password,
                      hintText: AppStrings.enterNewPass,
                    ),
                    Space(height: 2.2.h,),

                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 3.h),
            child: MainButton(
              onTap: ()=> Navigator.push(context, CustomPageTransition(EnterPinScreen())),
              width: 85.w,
              height: 7.h,
              child: CustomText(
                AppStrings.next,
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
