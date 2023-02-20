import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';

class AuthDivider extends StatelessWidget {
  String text;
  AuthDivider({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppTheme.neutral500,)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomText(
            text,
            fontSize: AppConsts.subTextSize.sp,
            color: AppTheme.neutral500,
          ),
        ),
        Expanded(child: Divider(color: AppTheme.neutral500,)),

      ],
    );
  }
}
