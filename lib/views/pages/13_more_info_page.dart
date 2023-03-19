import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';
import '../../core/config/app_strings.dart';
import '../../core/config/app_theme.dart';
import '../widgets/custom_text.dart';
import '../widgets/space.dart';

class MoreInfoPage extends StatelessWidget {
  const MoreInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          CustomText(
            AppStrings.answerFewQuestion,
            color: AppTheme.neutral900,
            fontSize: AppConsts.subHeadTextSize.sp ,
          ),
          Space(height: 0.3.h,),

          CustomText(
            AppStrings.answerCorrectly,
            color: AppTheme.neutral700,
            fontSize: AppConsts.subTextSize.sp,
          ),


        ],
      ),
    );
  }
}