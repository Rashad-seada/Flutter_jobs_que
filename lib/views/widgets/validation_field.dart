import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';
import '../../core/config/app_const.dart';

class ValidationField extends StatelessWidget {
  bool isValid;
  String text;
  double radius;

  ValidationField({
    this.isValid = true,
    required this.text,
    this.radius = 4.2,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        AnimatedContainer(
          width: radius.w,
          height: radius.w,
          duration: const Duration(seconds: 2),
          curve: Curves.fastLinearToSlowEaseIn,
          decoration: BoxDecoration(

            shape: BoxShape.circle,
            color: (isValid)? AppTheme.success: Colors.white,
            border: Border.all(
              color: (isValid)? AppTheme.success: AppTheme.neutral400,
              width: 0.5.w,
            ),
          ),
          child: Icon(
            Icons.done_rounded,
            color: Colors.white,
            size: radius.w - 1.5.w,
          ),
        ),

        Space(width: 2.w,),

        CustomText(
          text,
          fontSize: AppConsts.subTextSize.sp,
          color: AppTheme.neutral400,
          maxLines: 4,
          textAlign: TextAlign.start,
        ),


      ],
    );
  }
}
