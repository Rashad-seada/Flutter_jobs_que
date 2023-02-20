import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_const.dart';
import '../../../core/config/app_strings.dart';
import '../../../core/config/app_theme.dart';
import '../../blocs/reset_password/reset_password_cubit.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/main_button.dart';
import '../../widgets/space.dart';

class PinFooter extends StatelessWidget {
  const PinFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MainButton(
                    width: 85.w,height: 6.5.h,
                    color: (context.read<ResetPasswordCubit>().isPinValid)? AppTheme.primaryClr : AppTheme.neutral300,
                    child: CustomText(
                      AppStrings.next,
                      fontSize: AppConsts.textSize.sp,
                      color: (context.read<ResetPasswordCubit>().isPinValid)? AppTheme.textClr : AppTheme.neutral500,
                    ),
                    onTap: () => context.read<ResetPasswordCubit>().onTapEnterPinButton(context),
                  );
          },
        ),

        Space(height: 3.h,),

      ],
    );
  }
}
