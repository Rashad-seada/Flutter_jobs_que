import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class SuggestionsHeader extends StatelessWidget {
  String title;

  SuggestionsHeader({
    required this.title,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 7.w),
      width: 100.w,
      height: 5.h,
      decoration: BoxDecoration(
        color: AppTheme.neutral100,
        border: Border.all(color: AppTheme.neutral200)
      ),
      child: CustomText(
        title,
        color: AppTheme.neutral500,
        fontSize: AppConsts.subTextSize.sp,
      ),
    );
  }
}
