import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_que/views/screens/10_job_details_screen.dart';
import 'package:jobs_que/views/widgets/custom_page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_const.dart';
import '../../../core/config/app_images.dart';
import '../../../core/config/app_strings.dart';
import '../../../core/config/app_theme.dart';
import '../../../domain/entities/jobs/recent_jobs_entity.dart';
import '../../widgets/company_image.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/space.dart';

class RecentCard extends StatelessWidget {
  Function()? onTap;
  RecentJob job;

  RecentCard({
    this.onTap,
    required this.job,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.push(context, CustomPageTransition(JobDetailsScreen(job: Right(job),))),
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
                          "${job.name}",
                          color:  AppTheme.neutral900,
                          fontSize:  AppConsts.textSize.sp ,
                        ),
                        Space(height: 1.5,),

                        CustomText(
                          "${job.compName} • ${job.location}",
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
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 15.w,
                        height: 4.h,
                        margin: EdgeInsets.only(right: 1.5.w),
                        padding: EdgeInsets.symmetric(vertical: 7,horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppTheme.primary100Clr,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: CustomText(
                          '${job.jobTimeType}',
                          color: AppTheme.primary500Clr,
                          fontSize: AppConsts.subTextSize.sp - 2.sp,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 15.w,
                        height: 4.h,
                        margin: EdgeInsets.only(right: 1.5.w),
                        padding: EdgeInsets.symmetric(vertical: 7,horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppTheme.primary100Clr,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: CustomText(
                          '${job.jobType}',
                          color: AppTheme.primary500Clr,
                          fontSize: AppConsts.subTextSize.sp - 2.sp,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 15.w,
                        height: 4.h,
                        margin: EdgeInsets.only(right: 1.5.w),
                        padding: EdgeInsets.symmetric(vertical: 7,horizontal: 6),
                        decoration: BoxDecoration(
                          color: AppTheme.primary100Clr,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: CustomText(
                          '${job.jobLevel}',
                          color: AppTheme.primary500Clr,
                          fontSize: AppConsts.subTextSize.sp - 2.sp,
                        ),
                      ),
                    ]
                ),

                Row(
                  children: [
                    CustomText(
                      "\$${job.salary}",
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
