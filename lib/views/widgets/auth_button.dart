import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';
import 'custom_text.dart';

class AuthButton extends StatelessWidget {
  String assetName;
  String authMethod;
  AuthButton({
    Key? key,
    required this.assetName,
    required this.authMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 6.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.neutral300,width: 1)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SvgPicture.asset(
            assetName,
            width: 2.w,
            height: 2.5.h,
          ),

          Space(
            width: 3.w,
          ),

          CustomText(
            authMethod,
            color: AppTheme.authTextClr,
            fontSize: AppConsts.subTextSize.sp,
          ),

        ],
      ),
    );
  }
}
