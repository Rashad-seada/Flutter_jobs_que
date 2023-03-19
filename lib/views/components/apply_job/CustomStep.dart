import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_text.dart';

class CustomStep extends StatelessWidget {
  int number;
  bool isVerified;
  bool isFocused;
  Function()? onTap;
  
  CustomStep({
    required this.number,
    required this.isVerified,
    required this.isFocused,
    this.onTap,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: onTap,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: (isVerified)
            ? SvgPicture.asset(
                AppImages.circleTick,
                width: 13.w,
                height: 13.w,
              )
            :AnimatedContainer(
              alignment: Alignment.center,
              width: 13.w,
              height: 13.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border:  Border.all(color: (isFocused)? AppTheme.primary500Clr:  AppTheme.neutral400)
              ),
              duration: const Duration(milliseconds: 500),
              child: CustomText(
                number.toString(),
                color: (isFocused)? AppTheme.primary500Clr:  AppTheme.neutral400,
                fontSize: 13.sp,
              ),
        ),
      ),
    );
  }
}
