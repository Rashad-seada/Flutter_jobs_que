import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';

class ReadMore extends StatelessWidget {
  String? text;

  ReadMore({
    this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      'Your role as the UI Designer is to use interactive components on various platforms (web, desktop and mobile). This will include producing high-fidelity mock-ups, iconography, UI illustrations/graphics, and other graphic elements. As the UI Designer, you will be supporting the wider design team with the internal Design System, tying together the visual language. You will with other UI and UX Designers, Product Managers, and Engineering teams in a highly customer-focused agile environment to help define the vision of the products.',
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
