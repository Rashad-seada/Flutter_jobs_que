import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/views/widgets/clickable_text.dart';
import 'package:jobs_que/views/widgets/custom_page_transition.dart';
import 'package:jobs_que/views/widgets/main_check_box.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_const.dart';
import '../../../core/config/app_strings.dart';
import '../../../core/config/app_theme.dart';
import '../../../core/config/enums.dart';
import '../../blocs/auth/auth_cubit.dart';
import '../../screens/05_reset_password_screen.dart';
import '../../widgets/auth_field.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/main_back_button.dart';
import '../../widgets/space.dart';

class AuthBody extends StatelessWidget {
  AuthOptions option;

  AuthBody({
    required this.option,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Space(
          height: AppConsts.appbarSpace.h,
        ),
        Padding(
          padding: EdgeInsets.only(right: 7.5.w, left: 3.w),
          child: MainBackButton(
            hasLogo: true,
          ),
        ),
        SizedBox(
          width: 85.w,
          child: Column(
            children: [
              Space(
                height: 4.h,
              ),
              Row(
                children: [
                  CustomText(
                    (option == AuthOptions.signUp)
                        ? AppStrings.createAccountFirstHeadText
                        : AppStrings.login,
                    fontSize: AppConsts.subHeadTextSize.sp,
                    color: AppTheme.neutral900,
                  ),
                ],
              ),
              Space(
                height: 1.2.h,
              ),
              Row(
                children: [
                  CustomText(
                    (option == AuthOptions.signUp)
                        ? AppStrings.createAccountFirstBodyText1
                        : AppStrings.signInBodyText1,
                    fontSize: AppConsts.textSize.sp,
                    color: AppTheme.neutral500,
                  ),
                ],
              ),

              Space(
                height: (option == AuthOptions.signUp) ? 5.h : 3.5.h,
              ),

              Form(
                  key: context.read<AuthCubit>().getFormKey(option),
                  child: Column(
                    children: [
                      (option == AuthOptions.signUp)
                      ? AuthField(
                          onChange: () => context.read<AuthCubit>().isUsernameValid(),
                          validator: (text) => context.read<AuthCubit>().isUsernameValid(),
                          controller: context.read<AuthCubit>().userNameController,
                          iconType: AuthIcons.userName,
                          hintText: AppStrings.username,
                        )
                      : const SizedBox(),
                      Space(
                        height: 1.5.h,
                      ),

                      AuthField(
                        onChange: () => context.read<AuthCubit>().isEmailValid(),
                        validator: (text) => context.read<AuthCubit>().isEmailValid(),
                        controller: context.read<AuthCubit>().emailController,
                        iconType: AuthIcons.email,
                        hintText: AppStrings.email,
                      ),
                      Space(
                        height: 1.5.h,
                      ),

                      AuthField(
                        onChange: () => context.read<AuthCubit>().isPasswordValid(),
                        validator: (text) => context.read<AuthCubit>().isPasswordValid(),
                        controller: context.read<AuthCubit>().passwordController,
                        iconType: AuthIcons.password,
                        hintText: AppStrings.password,
                        isSecure: true,
                      ),

                    ],
                  )),
              Space(
                height: (option == AuthOptions.signUp) ? 2.h : 2.h,
              ),


              (option == AuthOptions.signIn)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        MainCheckBox(
                          isChecked: true,
                          onChanged: (isChecked) => context.read<AuthCubit>().isChecked = isChecked!,
                        ),
                        Space(
                          width: 1.5.w,
                        ),
                        CustomText(
                          AppStrings.signInBodyText2,
                          color: AppTheme.neutral800,
                        ),
                      ],
                    ),
                    ClickableText(
                      text: '',
                      clickableText: AppStrings.signInBodyText3,
                      onTap: () {
                        Navigator.push(context, CustomPageTransition(const ResetPasswordScreen()));
                      },
                    )
                  ],
                )
              : const SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
