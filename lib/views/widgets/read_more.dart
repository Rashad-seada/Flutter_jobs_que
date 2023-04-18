import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';

class ReadMore extends StatelessWidget {
  String text;

  ReadMore({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: 6,
      style: TextStyle(fontSize: AppConsts.subTextSize.sp,color: AppTheme.neutral600),
      colorClickableText: AppTheme.primary500Clr,
      trimMode: TrimMode.Line,
      trimCollapsedText: AppStrings.showMore,
      trimExpandedText: AppStrings.showLess,
      moreStyle: TextStyle(fontSize: AppConsts.subTextSize.sp,fontWeight: FontWeight.bold,color: AppTheme.primary500Clr),
      lessStyle: TextStyle(fontSize: AppConsts.subTextSize.sp, fontWeight: FontWeight.bold,color: AppTheme.primary500Clr),

    );
  }
}
