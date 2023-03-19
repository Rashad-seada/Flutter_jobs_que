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
import '../components/two_step_verification/hint_card.dart';
import '../widgets/custom_text.dart';
import '../widgets/main_back_button.dart';
import '../widgets/main_scaffold.dart';
import '../widgets/space.dart';
import '22_two_step_verification_confirm_screen.dart';

class TwoStepVerificationScreen extends StatelessWidget {
  const TwoStepVerificationScreen({Key? key}) : super(key: key);

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    SvgPicture.asset(AppImages.security,width: 85.w,height: 25.h,),
                    Space(height: 5.h,),

                    HintCard(image: AppImages.loginAndSecurityBlue, hint: AppStrings.hint1,),
                    Space(height: 2.h,),

                    HintCard(image: AppImages.book, hint: AppStrings.hint2,)
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 3.h),
            child: MainButton(
              onTap: ()=> Navigator.push(context,CustomPageTransition(TwoStepVerificationConfirmScreen())),
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
