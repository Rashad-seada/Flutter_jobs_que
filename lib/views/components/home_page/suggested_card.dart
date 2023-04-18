import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:jobs_que/views/widgets/main_button.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/entities/jobs/suggested_jobs_entity.dart';
import '../../screens/10_job_details_screen.dart';
import '../../widgets/company_image.dart';
import '../../widgets/custom_page_transition.dart';

class SuggestedCard extends StatelessWidget {
  int index;
  SuggestedJob job;

  SuggestedCard({
    required this.index,
    required this.job,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 23.h,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: (index == 0)? AppTheme.primary900Clr : AppTheme.neutral100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CompanyImage(
                height: 10.w,
                width: 10.w,
                imageUrl: job.image,
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      CustomText(
                        "${job.name}",
                        color: (index == 0)? Colors.white : AppTheme.neutral900,
                        fontSize:  AppConsts.textSize.sp + 2.sp,
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  decoration: BoxDecoration(
                    color: (index == 0)? Colors.white.withOpacity(0.12): AppTheme.primary100Clr,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CustomText(
                    "${job.jobTimeType}",
                    color: (index == 0)? Colors.white : AppTheme.primary500Clr,
                  ),
                ),
              ),
              Space(width: 3.w,),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  decoration: BoxDecoration(
                    color: (index == 0)? Colors.white.withOpacity(0.12): AppTheme.primary100Clr,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CustomText(
                    "${job.jobType}",
                    color: (index == 0)? Colors.white : AppTheme.primary500Clr,
                  ),
                ),
              ),
              Space(width: 3.w,),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  decoration: BoxDecoration(
                    color: (index == 0)? Colors.white.withOpacity(0.12): AppTheme.primary100Clr,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CustomText(
                    "${job.jobLevel}",
                    color: (index == 0)? Colors.white : AppTheme.primary500Clr,
                  ),
                ),
              ),
            ]
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomText(
                    "\$${job.salary}",
                    color: (index == 0)? Colors.white : AppTheme.success700,
                    fontSize: AppConsts.textSize.sp + 5.sp,
                  ),
                  CustomText(
                    AppStrings.month,
                    color: (index == 0)? Colors.white.withOpacity(0.5) : AppTheme.neutral500,
                    fontSize: AppConsts.subTextSize.sp,
                  ),
                ],
              ),

              MainButton(
                width: 26.w,
                height: 5.h,
                child: CustomText(
                  AppStrings.applyNow,
                  color: Colors.white,
                  fontSize: AppConsts.subTextSize.sp,
                ),
                onTap: ()=> Navigator.push(context, CustomPageTransition(JobDetailsScreen(job: Left(job),))),
              )


            ],
          )

        ],
      ),
    );
  }
}
