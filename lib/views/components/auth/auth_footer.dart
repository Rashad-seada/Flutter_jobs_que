import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/views/blocs/auth/auth_cubit.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_const.dart';
import '../../../core/config/app_images.dart';
import '../../../core/config/app_strings.dart';
import '../../../core/config/app_theme.dart';
import '../../../core/config/app_enums.dart';
import '../../widgets/auth_button.dart';
import '../../widgets/auth_divider.dart';
import '../../widgets/clickable_text.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/main_button.dart';
import '../../widgets/space.dart';

class AuthFooter extends StatelessWidget {

  AuthFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        print(state);
      },
      builder: (context, state) {
        return SizedBox(
          width: 85.w,
          child: Column(
            children: [

              ClickableText(
                text:
                (context.read<AuthCubit>().authOptions == AuthOptions.signUp) ?
                AppStrings.createAccountFirstBodyText4 :
                AppStrings.signInBodyText4,
                clickableText:
                (context.read<AuthCubit>().authOptions == AuthOptions.signUp) ?
                AppStrings.login :
                AppStrings.signUp,
                onTap: () => context.read<AuthCubit>().onTextTap(),
              ),

              Space(height: 4.h,),

              MainButton(
                width: 90.w,
                height: 6.5.h,
                color: (context.read<AuthCubit>().isAllValid(option: context.read<AuthCubit>().authOptions))? AppTheme.primary500Clr: AppTheme.neutral300 ,
                isLoading : (state is AuthLoading)? true: false,
                child: CustomText(
                  (context.read<AuthCubit>().authOptions == AuthOptions.signUp)? AppStrings.signUp: AppStrings.login,
                  color: (context.read<AuthCubit>().isAllValid(option: context.read<AuthCubit>().authOptions))?  AppTheme.textClr : AppTheme.neutral500,
                  fontSize: AppConsts.textSize.sp,
                ),
                onTap: () => context.read<AuthCubit>().onButtonTap(context,context.read<AuthCubit>().authOptions),
              ),
              Space(height: 3.h,),

              AuthDivider(text: (context.read<AuthCubit>().authOptions == AuthOptions.signUp)?AppStrings.createAccountFirstBodyText3:AppStrings.signInBodyText5,),
              Space(height: 3.h,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AuthButton(assetName: AppImages.google, authMethod: AppStrings.google),
                  AuthButton(assetName: AppImages.facebook, authMethod: AppStrings.facebook),
                ],
              ),
              Space(height: 4.h,),

            ],
          ),
        );
      },
    );
  }
}
