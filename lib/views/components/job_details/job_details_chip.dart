import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class JobDetailsChip extends StatelessWidget {
  String title;

  JobDetailsChip({
    required this.title,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: AppTheme.primary100Clr,
        borderRadius: BorderRadius.circular(100)
      ),
      padding: EdgeInsets.symmetric(horizontal: 13,vertical: 6),
      child: CustomText(title,color: AppTheme.primary500Clr,fontSize: AppConsts.subTextSize.sp - 2.sp,),
    );
  }
}
