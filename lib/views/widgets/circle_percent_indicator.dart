import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';

class CirclePercentIndicator extends StatelessWidget {
  double percent;
  double radius;
  double lineWidth;
  double fontSize;

  CirclePercentIndicator({
    this.percent = 90,
    required this.radius,
    required this.lineWidth,
    required this.fontSize,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      circularStrokeCap: CircularStrokeCap.round,
      radius: radius,
      lineWidth: lineWidth,
      percent: percent * .01,
      center: CustomText("${percent.toInt()}%",fontSize: fontSize,color: AppTheme.primary500Clr,),
      backgroundColor: AppTheme.neutral200,
      progressColor: AppTheme.primary500Clr,
    );
  }
}
