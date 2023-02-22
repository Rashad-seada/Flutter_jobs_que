import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/views/blocs/reset_password/reset_password_cubit.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_const.dart';
import '../../../core/config/app_strings.dart';
import '../../../core/config/app_theme.dart';
import '../../widgets/main_button.dart';
import '../../widgets/space.dart';

class CreateNewPasswordFooter extends StatelessWidget {
  const CreateNewPasswordFooter({Key? key}) : super(key: key);

  validate(context){
    if(context.read<ResetPasswordCubit>().isPassword8Char && context.read<ResetPasswordCubit>().isPasswordMatch){
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(

      listener: (context, state) {
      },

      builder: (context, state) {
        return Column(
          children: [

            MainButton(
              color: (context.read<ResetPasswordCubit>().isPassword8Char && context.read<ResetPasswordCubit>().isPasswordMatch)? AppTheme.primary500Clr : AppTheme.neutral300,
              width: 85.w, height: 6.5.h,
              child: CustomText(
                AppStrings.forgetPasswordFirstHeadText,
                fontSize: AppConsts.textSize.sp,
                color: (context.read<ResetPasswordCubit>().isPassword8Char && context.read<ResetPasswordCubit>().isPasswordMatch)? AppTheme.textClr : AppTheme.neutral500,
              ),
              onTap: () => context.read<ResetPasswordCubit>().onTapCreateNewPasswordButton(),
            ),

            Space(height: 3.h,),

          ],
        );
      },
    );
  }
}
