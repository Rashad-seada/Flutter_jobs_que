import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';
import '../widgets/read_more.dart';

class DescriptionPage extends StatelessWidget {
  const DescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 86.w,
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [

          Space(height: 4.h,),

          CustomText(
              AppStrings.jobDescription,
              color: AppTheme.neutral900,
              fontSize: AppConsts.textSize.sp,
              fontWeight: FontWeight.w600,
          ),
          Space(height: 1.5.h,),
          ReadMore(),
          Space(height: 3.h,),

          CustomText(
            AppStrings.skillRequired,
            color: AppTheme.neutral900,
            fontSize: AppConsts.textSize.sp,
            fontWeight: FontWeight.w600,
          ),

          Space(height: 1.5.h,),
          ReadMore(),
          Space(height: 6.h,),

        ],
      ),
    );
  }
}
