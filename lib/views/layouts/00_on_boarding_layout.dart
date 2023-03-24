import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/custom_page_transition.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';
import '../../core/config/app_const.dart';
import '../../core/config/app_enums.dart';
import '../blocs/auth/auth_cubit.dart';
import '../blocs/on_boarding/on_boarding_cubit.dart';
import '../screens/02_auth_screen.dart';
import '../widgets/custom_indicator.dart';
import '../widgets/main_button.dart';

class OnBoardingLayout extends StatelessWidget {


  OnBoardingLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        Column(
          children: [
            Space(height: AppConsts.appbarSpace.h,),
            SizedBox(
              width: 85.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  SvgPicture.asset(AppImages.logo,width: 25.w,),

                  IconButton(
                      onPressed: ()=> context.read<OnBoardingCubit>().onTapSkip(context),
                      icon: CustomText(AppStrings.skip,fontSize: AppConsts.textSize.sp,color: AppTheme.neutral500))

                ],
              ),
            ),
          ],
        ),

        Column(
          children: [

            CustomIndicator(
              controller: context.read<OnBoardingCubit>().controller, count: 3,),

            Space(height: 3 .h ,),

            MainButton(
              width: 85.w,
              height: 6.5.h,
              child: CustomText(
                (context.read<OnBoardingCubit>().index == 2)
                    ? AppStrings.getStarted
                    : AppStrings.next,
                color: AppTheme.textClr,
                fontSize: AppConsts.textSize.sp,
              ),
              onTap: () => context.read<OnBoardingCubit>().onTapButton(context),
            ),

            Space(height: 3.h ,),

          ],
        )
      ],
    );
  }
}
