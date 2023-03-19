import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_enums.dart';
import 'package:jobs_que/views/blocs/reset_password/reset_password_cubit.dart';
import 'package:jobs_que/views/screens/02_auth_screen.dart';
import 'package:jobs_que/views/widgets/custom_page_transition.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_const.dart';
import '../../../core/config/app_images.dart';
import '../../../core/config/app_strings.dart';
import '../../../core/config/app_theme.dart';
import '../../screens/04_message_screen.dart';
import '../../screens/07_create_new_password_screen.dart';
import '../../widgets/clickable_text.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/main_button.dart';
import '../../widgets/space.dart';

class ResetPasswordFooter extends StatelessWidget {
  const ResetPasswordFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [



          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClickableText(
                  text: AppStrings.forgetPasswordFirstBodyText3,
                  clickableText: AppStrings.login,
                  onTap: () => context.read<ResetPasswordCubit>().onTapResetPasswordText(context)

              ),
            ],
          ),
          Space(height: 3.h,),

          BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return MainButton(
                      width: 85.w,height: 6.5.h,
                      color: (context.read<ResetPasswordCubit>().isEmailValid)? AppTheme.primary500Clr : AppTheme.neutral300,
                      child: CustomText(
                        AppStrings.forgetPasswordFirstBodyText4,
                        fontSize: AppConsts.textSize.sp,
                        color: (context.read<ResetPasswordCubit>().isEmailValid)? AppTheme.textClr : AppTheme.neutral500,
                      ),
                      onTap: () => context.read<ResetPasswordCubit>().onTapResetPasswordButton(context),
                    );
            },
          ),
          Space(height: 3.h,),

        ],
      ),
    );
  }
}