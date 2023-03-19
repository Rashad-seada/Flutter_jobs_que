import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/custom_page_transition.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_const.dart';
import '../../screens/23_complete_profile_screen.dart';
import '../../widgets/circle_percent_indicator.dart';
import '../../widgets/custom_text.dart';

class CompleteProfileCard extends StatelessWidget {
  double percent;

  CompleteProfileCard({
    required this.percent,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.push(context,CustomPageTransition(CompleteProfileScreen())),
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 7.w),
        width: 85.w,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: AppTheme.neutral200),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(
                  width: 48.w,
                  child: CustomText(
                    AppStrings.profilePercentCompleted(percent.toInt()),
                    color: AppTheme.neutral900,
                    fontSize: AppConsts.subHeadTextSize.sp - 8.sp,
                    maxLines: 6,
                  ),
                ),

                Space(height: 1.5.h,),


                SizedBox(
                  width: 48.w,
                  child: CustomText(
                    AppStrings.improveHiring,
                    color: AppTheme.neutral500,
                    fontSize: AppConsts.subTextSize.sp,
                    maxLines: 6,
                  ),
                ),
              ],
            ),
            CirclePercentIndicator(
              radius: 10.w,
              lineWidth: 1.5.w,
              percent: percent,
              fontSize: 13.sp,
            )
          ],
        ),
      ),
    );
  }
}
