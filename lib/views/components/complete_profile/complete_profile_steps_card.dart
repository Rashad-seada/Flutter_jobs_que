import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/blocs/complete_profile/complete_profile_cubit.dart';
import 'package:jobs_que/views/widgets/custom_page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_const.dart';
import '../../../core/config/app_strings.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/space.dart';

class CompleteProfileStepsCard extends StatelessWidget {

  bool isCompleted;
  String headText;
  String subText;
  Widget? screenToGoTo;


  CompleteProfileStepsCard({
    required this.isCompleted,
    required this.headText,
    required this.subText,
    this.screenToGoTo,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(context.read<CompleteProfileCubit>().totalSteps);

        (screenToGoTo == null)?null : Navigator.push(context,CustomPageTransition(screenToGoTo!));
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: 7.w),
        padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),

        duration: const Duration(milliseconds: 400),
        width: 85.w,
        height: 11.5.h,
        decoration: BoxDecoration(
          color: (isCompleted)? AppTheme.primary100Clr : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: (isCompleted)? AppTheme.primary500Clr : AppTheme.neutral200 )
        ),
        child: Row(
          children: [

            SvgPicture.asset((isCompleted)?AppImages.circleTick : AppImages.circleTickGrey,width:7.w, height:7.w,),
            Space(width: 4.w,),

            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  CustomText(
                    headText,
                    color: AppTheme.neutral900,
                    fontSize: AppConsts.subHeadTextSize.sp - 9.sp,

                    maxLines: 6,
                  ),
                  Space(height: 1.h,),


                  CustomText(
                    subText,
                    color: AppTheme.neutral500,
                    fontSize: AppConsts.subTextSize.sp,
                    maxLines: 6,
                  ),
                ],
              ),
            ),

            Space(width: 3.w,),

            SvgPicture.asset(AppImages.rightArrow),

          ],
        ),
      ),
    );
  }
}
