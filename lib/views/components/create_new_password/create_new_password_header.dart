import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_const.dart';
import '../../../core/config/app_strings.dart';
import '../../../core/config/app_theme.dart';
import '../../../core/config/enums.dart';
import '../../blocs/reset_password/reset_password_cubit.dart';
import '../../widgets/auth_field.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/main_back_button.dart';
import '../../widgets/space.dart';
import '../../widgets/validation_field.dart';

class CreateNewPasswordHeader extends StatelessWidget {
  CreateNewPasswordHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                children: [

                  Space(height: 3.h,),

                  CustomText(
                    AppStrings.forgetPasswordThirdHeadText,
                    fontSize: AppConsts.subHeadTextSize.sp,
                    color: AppTheme.neutral900,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                  Space(height: 1.5.h,),

                  CustomText(

                    AppStrings.forgetPasswordThirdBodyText1,
                    fontSize: AppConsts.subTextSize.sp,
                    color: AppTheme.neutral500,
                    maxLines: 4,

                    textAlign: TextAlign.start,
                  ),
                  Space(height: 4.h,),

                  Form(
                    key: context.read<ResetPasswordCubit>().newPasswordFormKey,
                     child: Column(
                       children: [
                         AuthField(
                           validator: (text)=> context.read<ResetPasswordCubit>().validateIsPassword8Char(),
                           onChange: () => context.read<ResetPasswordCubit>().validateAllPasswords(),
                           isSecure: true,
                           controller: context.read<ResetPasswordCubit>().newPasswordController,
                           hintText: AppStrings.forgetPasswordThirdBodyText2,
                           iconType: AuthIcons.password,
                         ),
                         Space(height: 1.5.h,),

                         AuthField(
                           validator: (text)=> context.read<ResetPasswordCubit>().validateIsPasswordMatch(),
                           onChange: () => context.read<ResetPasswordCubit>().validateAllPasswords(),
                           isSecure: true,
                           controller: context.read<ResetPasswordCubit>().renterNewPasswordController,
                           hintText: AppStrings.forgetPasswordThirdBodyText4,
                           iconType: AuthIcons.password,
                         ),
                       ],
                     ),
                  ),

                  Space(height: 2.h,),

                  ValidationField(
                    text: AppStrings.forgetPasswordThirdBodyText3,
                    isValid: context.read<ResetPasswordCubit>().isPassword8Char,
                  ),
                  Space(height: 1.5.h,),

                  ValidationField(
                    text: AppStrings.forgetPasswordThirdBodyText7,
                    isValid: context.read<ResetPasswordCubit>().isPasswordMatch,
                  ),

                ],
              ),
            ),



          ],
        );
      },
    );
  }
}
