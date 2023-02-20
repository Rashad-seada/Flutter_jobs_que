import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_const.dart';
import '../../../core/config/app_theme.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/space.dart';

class CreateAccountHeader extends StatelessWidget {
  String title;
  String subTitle;

  CreateAccountHeader({
    required this.title,
    required this.subTitle,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 85.w,
          child: CustomText(
            title,
            fontSize: AppConsts.subHeadTextSize.sp,
            color: AppTheme.neutral900,
            maxLines: 2,
          ),
        ),

        Space(height: 1.5.h,),

        SizedBox(
          width: 85.w,
          child: CustomText(
            subTitle,
            fontSize: AppConsts.textSize.sp,
            color: AppTheme.greyClr,
            fontWeight: FontWeight.w400,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
