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

import '../../widgets/company_image.dart';

class SuggestedCard extends StatelessWidget {
  int index;

  SuggestedCard({
    required this.index,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 23.h,
      padding: EdgeInsets.all(15),
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
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      CustomText(
                        "Product Designer",
                        color: (this.index == 0)? Colors.white : AppTheme.neutral900,
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                3,
                (index) => Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  decoration: BoxDecoration(
                    color: (this.index == 0)? Colors.white.withOpacity(0.12): AppTheme.primary100Clr,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: CustomText(
                      'remote',
                    color: (this.index == 0)? Colors.white : AppTheme.primary500Clr,
                  ),
                )

            )
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomText(
                    "\$75k",
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
              )


            ],
          )

        ],
      ),
    );
  }
}
