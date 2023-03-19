import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_strings.dart';
import '../../core/config/app_theme.dart';
import '../blocs/complete_profile/complete_profile_cubit.dart';
import '../components/complete_profile/complete_profile_steps_card.dart';
import '../components/complete_profile/complete_profile_steps_section.dart';
import '../widgets/circle_percent_indicator.dart';
import '../widgets/custom_text.dart';
import '../widgets/main_back_button.dart';
import '../widgets/space.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: ListView(
        shrinkWrap: true,
        children: [

          Space(height: AppConsts.appbarSpace.h,),

          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 3.5.w,right: 5.w),
              child: MainBackButton(label: AppStrings.completeProfile),
            ),
          ),
          Space(height: 3.h,),

          CirclePercentIndicator(
            radius: 15.w,
            lineWidth: 2.2.w,
            percent: context.read<CompleteProfileCubit>().totalSteps * 25,
            fontSize: 17.sp,
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: Column(
              children: [
                Space(height: 2.5.h,),

                CustomText(
                  AppStrings.stepsCompleted(context.read<CompleteProfileCubit>().totalSteps),
                  color: AppTheme.primary500Clr,
                  fontSize: AppConsts.subHeadTextSize.sp - 9.sp,
                  maxLines: 6,
                ),
                Space(height: 1.h,),

                CustomText(
                  AppStrings.completeYourProfile,
                  color: AppTheme.neutral500,
                  fontSize: AppConsts.subHeadTextSize.sp - 9.sp,
                  maxLines: 6,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Space(height: 3.5.h,),

          CompleteProfileStepsSection(
            steps: [
              CompleteProfileStepsCard(isCompleted: true, headText: AppStrings.step1Head, subText: AppStrings.step1SubText,),
              CompleteProfileStepsCard(isCompleted: false, headText: AppStrings.step2Head, subText: AppStrings.step2SubText,),
              CompleteProfileStepsCard(isCompleted: false, headText: AppStrings.step3Head, subText: AppStrings.step3SubText,),
              CompleteProfileStepsCard(isCompleted: false, headText: AppStrings.step4Head, subText: AppStrings.step4SubText,),
            ],
          )

        ],
      ),
    );
  }

}
