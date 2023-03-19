import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/views/blocs/reset_password/reset_password_cubit.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_const.dart';
import '../../../core/config/app_strings.dart';
import '../../../core/config/app_theme.dart';
import '../../../core/config/app_enums.dart';
import '../../widgets/auth_field.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/main_back_button.dart';
import '../../widgets/space.dart';

class ResetPasswordHeader extends StatelessWidget {
  const ResetPasswordHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Padding(
            padding: EdgeInsets.only(right: 7.5.w,left: 3.9.w,top: 2.h),
            child: MainBackButton(
              hasLogo: true,
            ),
          ),

          SizedBox(
            width: 85.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                Space(height: 3.h,),

                CustomText(
                  AppStrings.forgetPasswordFirstHeadText,
                  fontSize: AppConsts.subHeadTextSize.sp,
                  color: AppTheme.neutral900,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
                Space(height: 1.5.h,),

                CustomText(
                  AppStrings.forgetPasswordFirstBodyText1,
                  fontSize: AppConsts.subTextSize.sp,
                  color: AppTheme.neutral500,
                  maxLines: 4,
                  textAlign: TextAlign.start,
                ),
                Space(height: 4.h,),

                Form(
                  key: context.read<ResetPasswordCubit>().emailFormKey,
                  child: AuthField(
                    onChange: ()=> context.read<ResetPasswordCubit>().validateIsEmail(),
                    validator: (text)=> context.read<ResetPasswordCubit>().validateIsEmail(),
                    controller: context.read<ResetPasswordCubit>().emailController,
                    hintText: AppStrings.forgetPasswordFirstBodyText2,
                    iconType: AuthIcons.email,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
