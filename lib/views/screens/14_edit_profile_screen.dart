import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/views/widgets/custom_text_field.dart';
import 'package:jobs_que/views/widgets/main_back_button.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_theme.dart';
import '../components/apply_job/phone_number_field.dart';
import '../components/edit_profile/profile_image_picker.dart';
import '../widgets/custom_text.dart';
import '../widgets/main_button.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Space(height: AppConsts.appbarSpace.h,),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 3.5.w,right: 5.w),
              child: MainBackButton(label: AppStrings.editProfile),
            ),
          ),
          Space(height: 4.h,),

          ProfileImagePicker(),
          Space(height: 4.h,),


          SizedBox(
            width: 85.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                CustomText(
                  AppStrings.name+"*",
                  color: AppTheme.neutral900,
                  fontSize: AppConsts.textSize.sp ,
                  fontWeight: FontWeight.w500,
                ),
                Space(height: 1.h,),
                CustomTextField(
                  iconIsActive: false,
                  hintText: AppStrings.enterYourInfo,
                ),
                Space(height: 1.8.h,),


                CustomText(
                  AppStrings.bio+'*',
                  color: AppTheme.neutral900,
                  fontSize: AppConsts.textSize.sp ,
                  fontWeight: FontWeight.w500,
                ),
                Space(height: 1.h,),
                CustomTextField(
                  iconIsActive: false,
                  hintText: AppStrings.enterYourInfo,
                ),
                Space(height: 1.8.h,),


                CustomText(
                  AppStrings.address+'*',
                  color: AppTheme.neutral900,
                  fontSize: AppConsts.textSize.sp ,
                  fontWeight: FontWeight.w500,
                ),
                Space(height: 1.h,),
                CustomTextField(
                  iconIsActive: false,
                  hintText: AppStrings.enterYourInfo,
                ),
                Space(height: 1.8.h,),


                CustomText(
                  AppStrings.mobile+'*',
                  color: AppTheme.neutral900,
                  fontSize: AppConsts.textSize.sp ,
                  fontWeight: FontWeight.w500,
                ),
                Space(height: 1.h,),
                PhoneNumberField()

              ],
            ),
          ),


          Space(height: 12.h,),
          MainButton(
            height: 7.h,
            width: 85.w,
            child: CustomText(
              AppStrings.save,
              color: AppTheme.textClr,
              fontSize: AppConsts.textSize.sp,
            )
          )


        ],
      ),
    );
  }
}
