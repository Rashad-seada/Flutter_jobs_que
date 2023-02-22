import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/clickable_text.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class SectionHeader extends StatelessWidget {
  String sectionTitle;
  Function()? onTap;

  SectionHeader({
    required this.sectionTitle,
    this.onTap,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          CustomText(
            sectionTitle,
            fontSize: AppConsts.textSize.sp + 3.sp,
            color: AppTheme.neutral900,
            fontWeight: FontWeight.w500,
          ),

          ClickableText(
            text: '',
            clickableText:AppStrings.viewAll,
            onTap: onTap,
          ),

        ],
      ),
    );
  }
}
