import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/blocs/reset_password/reset_password_cubit.dart';
import 'package:jobs_que/views/widgets/clickable_text.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_const.dart';
import '../../../core/config/app_strings.dart';
import '../../widgets/custom_animated_text.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/main_back_button.dart';
import '../../widgets/pin_code_field.dart';
import '../../widgets/space.dart';

class PinHeader extends StatelessWidget {
  const PinHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            children: [

              Space(
                height: 6.h
              ),

              CustomAnimatedText(
                text: AppStrings.code,
              ),

              Space(
                  height: 4.h
              ),


              CustomText(
                AppStrings.pinHeadText,
                fontSize: AppConsts.subHeadTextSize.sp,
                color: AppTheme.neutral900,
              ),

              Space(
                  height: 1.h
              ),


              SizedBox(
                width: 85.w,
                child: CustomText(
                    AppStrings.pinSubText(context.read<ResetPasswordCubit>().emailController.text.trim()),
                    fontSize: AppConsts.textSize.sp,
                    color: AppTheme.neutral500,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                ),
              ),

              Space(
                  height: 5.h
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ClickableText(
                      text: AppStrings.didntReciveIt,
                      clickableText: AppStrings.resendCode,
                      onTap: () => context.read<ResetPasswordCubit>().onTapEnterPinText(context),
                  ),
                ],
              ),
              Space(
                  height: 1.h
              ),

              PinCodeField(
                onChange: (value) => context.read<ResetPasswordCubit>().validatePin(),
                controller: context.read<ResetPasswordCubit>().pinController,
                validator: (value) => context.read<ResetPasswordCubit>().validatePin(),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
