import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_que/views/screens/10_job_details_screen.dart';
import 'package:jobs_que/views/widgets/custom_page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_const.dart';
import '../../../core/config/app_images.dart';
import '../../../core/config/app_strings.dart';
import '../../../core/config/app_theme.dart';
import '../../widgets/company_image.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/space.dart';

class RecentCard extends StatelessWidget {
  Function()? onTap;
  
  RecentCard({
    this.onTap,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.push(context, CustomPageTransition(JobDetailsScreen())),
      child: Container(
        width: 85.w,
        height: 14.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Space(height: 1.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CompanyImage(
                  width: 10.w,
                  height: 10.w,
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        CustomText(
                          "Product Designer",
                          color:  AppTheme.neutral900,
                          fontSize:  AppConsts.textSize.sp ,
                        ),
                        Space(height: 1.5,),

                        CustomText(
                          "Zoom • United States",
                          color: AppTheme.neutral400,
                          fontSize: AppConsts.subTextSize.sp,

                        ),


                      ],
                    ),
                  ),
                ),

                SvgPicture.asset(AppImages.savedNavIcon(active: false)),

              ],
            ),
            Space(height: 2.h,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        3,
                            (index) => Container(
                              margin: EdgeInsets.only(right: 1.5.w),
                          padding: EdgeInsets.symmetric(vertical: 7,horizontal: 14),
                          decoration: BoxDecoration(
                            color: AppTheme.primary100Clr,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: CustomText(
                            'Remote',
                            color: AppTheme.primary500Clr,
                            fontSize: AppConsts.subTextSize.sp - 1.sp,
                          ),
                        )

                    )
                ),

                Row(
                  children: [
                    CustomText(
                      "\$75k",
                      color: AppTheme.success700,
                      fontSize: AppConsts.textSize.sp + 4.sp,
                    ),
                    CustomText(
                      AppStrings.month,
                      color: AppTheme.neutral500,
                      fontSize: AppConsts.subTextSize.sp,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
