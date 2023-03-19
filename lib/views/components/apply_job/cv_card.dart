import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_const.dart';
import '../../../core/config/app_strings.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/space.dart';

class CvCard extends StatelessWidget {
  String cvTitle;
  String cvFileName;

  CvCard({
    required this.cvTitle,
    required this.cvFileName,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.w,
      height: 9.h,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppTheme.primary500Clr),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [

          Row(
            children: [
              SvgPicture.asset(AppImages.file),

              Space(
                width:3.w
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    cvTitle,
                    color: AppTheme.neutral900,
                    fontSize: AppConsts.textSize.sp -1.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    cvFileName,
                    color: AppTheme.neutral500,
                    fontSize: AppConsts.subTextSize.sp -1.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              )
            ],
          ),

          Row(
            children: [
              InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: (){}, child: SvgPicture.asset(AppImages.edite)),
              Space(
                  width:2.w
              ),
              InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: (){}, child: SvgPicture.asset(AppImages.close)),

            ],
          )

        ],
      ),
    );
  }
}
