import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_enums.dart';
import '../../widgets/custom_text.dart';

class SuggestionCard extends StatelessWidget {
  Search suggestionType;
  String suggest;
  Function()? onTap;
  SuggestionCard({
    this.onTap,
    required this.suggestionType,
    required this.suggest,
    Key? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 7.w,right: 7.w,bottom: 2.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Row(
              children: [
                SvgPicture.asset((suggestionType == Search.recent)? AppImages.clock : AppImages.suggestions),
                Space(width: 3.w,),
                CustomText(
                  suggest,
                  fontSize: AppConsts.subTextSize.sp,
                  color: AppTheme.neutral900,
                ),
              ],
            ),

            SvgPicture.asset((suggestionType == Search.recent)? AppImages.delete : AppImages.enter),

          ],
        ),
      ),
    );
  }
}
