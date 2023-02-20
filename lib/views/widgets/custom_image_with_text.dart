import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';
import '../../core/config/app_theme.dart';
import 'custom_text.dart';

class CustomImageWithText extends StatelessWidget {
  String image;
  String headText;
  String subText;

  CustomImageWithText({
    required this.image,
    required this.headText,
    required this.subText,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimationConfiguration.staggeredList(
          position: 1,
          child: FadeInAnimation(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: const Duration(milliseconds: 300),
            child: ScaleAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              duration: const Duration(milliseconds: 300),
              child: SvgPicture.asset(image),
            ),
          ),
        ),
        Space(height: 40,),

        CustomText(
          headText,
          fontSize: AppConsts.subHeadTextSize.sp,
          color: AppTheme.neutral900,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
        Space(height: 8,),

        CustomText(
          subText,
          fontSize: AppConsts.subTextSize.sp,
          color: AppTheme.neutral500,
          maxLines: 3,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
