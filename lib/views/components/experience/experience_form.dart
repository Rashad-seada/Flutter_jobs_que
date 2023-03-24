import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_const.dart';
import '../../../core/config/app_strings.dart';
import '../../../core/config/app_theme.dart';
import '../../blocs/complete_profile/complete_profile_cubit.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/date_picker.dart';
import '../../widgets/loaction_picker.dart';
import '../../widgets/main_button.dart';
import '../../widgets/space.dart';

class ExperienceForm extends StatelessWidget {
  const ExperienceForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7.w),
      padding: EdgeInsets.symmetric(vertical: 2.h,horizontal: 3.w),
      decoration: BoxDecoration(
          border: Border.all(color: AppTheme.neutral200),
          borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CustomText(
            AppStrings.position+"*",
            color: AppTheme.neutral500,
            fontSize: AppConsts.textSize.sp ,
            fontWeight: FontWeight.w500,
          ),
          Space(height: .5.h,),
          CustomTextField(
            iconIsActive: false,
            hintText: AppStrings.enterYourInfo,
          ),
          Space(height: 1.8.h,),


          CustomText(
            AppStrings.typeOfWork+'*',
            color: AppTheme.neutral500,
            fontSize: AppConsts.textSize.sp ,
            fontWeight: FontWeight.w500,
          ),
          Space(height: 0.5.h,),
          CustomTextField(
            iconIsActive: false,
            hintText: AppStrings.enterYourInfo,
          ),
          Space(height: 1.8.h,),

          CustomText(
            AppStrings.companyName+'*',
            color: AppTheme.neutral500,
            fontSize: AppConsts.textSize.sp ,
            fontWeight: FontWeight.w500,
          ),
          Space(height: 0.5.h,),
          CustomTextField(
            iconIsActive: false,
            hintText: AppStrings.enterYourInfo,
          ),
          Space(height: 1.8.h,),

          CustomText(
            AppStrings.location+'*',
            color: AppTheme.neutral500,
            fontSize: AppConsts.textSize.sp ,
            fontWeight: FontWeight.w500,
          ),
          Space(height: 0.5.h,),
          LocationPicker(
            controller: TextEditingController(),
          ),
          Space(height: 1.8.h,),


          CustomText(
            AppStrings.startYear+'*',
            color: AppTheme.neutral500,
            fontSize: AppConsts.textSize.sp ,
            fontWeight: FontWeight.w500,
          ),
          Space(height: 0.5.h,),
          DatePicker(context: context, controller: TextEditingController(),hintText: AppStrings.enterYourInfo,),
          Space(height: 1.8.h,),


          Space(height: 4.h,),


          MainButton(
              onTap: ()=> context.read<CompleteProfileCubit>().step3Validate(context),
              height: 7.h,
              width: 85.w,
              child: CustomText(
                AppStrings.save,
                color: AppTheme.textClr,
                fontSize: AppConsts.textSize.sp,
              )
          ),


        ],
      ),
    );
  }
}
