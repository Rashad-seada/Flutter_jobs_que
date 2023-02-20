import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';

class ClickableText extends StatelessWidget {
  String text;
  String clickableText;
  Function()? onTap;

  ClickableText({
    Key? key,
    required this.text,
    required this.clickableText,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
        children: [
          TextSpan(text: text,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: AppConsts.subTextSize.sp,
                color: AppTheme.neutral500,

              ),
            ),
          ),

          TextSpan(
            text: ' '
          ),

          TextSpan(text: clickableText,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                color: AppTheme.primaryClr,
                fontSize: AppConsts.subTextSize.sp,
              ),
            ),
            recognizer: TapGestureRecognizer()..onTap = () {
              print('object');
              onTap!();
            },
          ),
        ]
    ));
  }
}
