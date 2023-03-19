import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/views/blocs/saved/saved_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_const.dart';
import '../../../core/config/app_theme.dart';
import '../../widgets/company_image.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/space.dart';

class SavedJobCard extends StatelessWidget {
  const SavedJobCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h,bottom: 1.h),
      child: SizedBox(
        height: 9.8.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    CompanyImage(
                      height: 12.w,
                      width: 12.w,
                    ),
                    Space(width: 4.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          "Product Designer",
                          color: AppTheme.neutral900,
                          fontSize:  AppConsts.textSize.sp ,
                        ),
                        Space(height: 1.5,),

                        CustomText(
                          "Apple • United States",
                          color: AppTheme.neutral400,
                          fontSize: AppConsts.subTextSize.sp,

                        ),
                      ],
                    ),
                  ],
                ),

                InkWell(
                  onTap: () => context.read<SavedCubit>().openBottomSheet(context),
                  borderRadius: BorderRadius.circular(1000),
                  child: SvgPicture.asset(AppImages.more),
                ),

              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                CustomText(
                  AppStrings.postDaysAgo(2),
                  color: AppTheme.neutral400,
                  fontSize: AppConsts.subTextSize.sp,
                ),

                Row(
                  children: [

                    SvgPicture.asset(AppImages.early),
                    Space(width: 1.5.w,),
                    CustomText(
                      AppStrings.beAnEarly,
                      color: AppTheme.neutral400,
                      fontSize: AppConsts.subTextSize.sp,
                    ),

                  ],
                )

              ],
            ),

          ],
        ),
      ),
    );
  }
}
