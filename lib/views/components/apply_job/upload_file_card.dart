import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_const.dart';
import '../../../core/config/app_strings.dart';
import '../../../core/config/app_theme.dart';
import '../../widgets/custom_text.dart';

class UploadFileCard extends StatelessWidget {
  const UploadFileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Flexible(
        child: Container(
            width: 85.w,
            height: 29.h,
            padding: EdgeInsets.symmetric(vertical: 3.h,),
        decoration: BoxDecoration(
        border: Border.all(color: AppTheme.primary500Clr),
        borderRadius: BorderRadius.circular(8),
          color: AppTheme.primary400Clr.withOpacity(0.12)
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              SvgPicture.asset(AppImages.fileUpload),

              Column(
                children: [
                  CustomText(
                    AppStrings.uploadYourOtherFile,
                    color: AppTheme.neutral900,
                    fontSize: AppConsts.textSize.sp + 2.sp,
                  ),
                  Space(height: 0.5.h,),

                  CustomText(
                    AppStrings.maxFileSize,
                    color: AppTheme.neutral500,
                    fontSize: AppConsts.subTextSize.sp - 1.sp,
                  ),
                ],
              ),



              Container(
                height: 5.6.h,
                width: 70.w,
                decoration: BoxDecoration(
                    border: Border.all(color: AppTheme.primary500Clr),
                    borderRadius: BorderRadius.circular(1000),
                    color: AppTheme.primary400Clr.withOpacity(0.12)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SvgPicture.asset(AppImages.upload),

                    Space(width: 2.w,),

                    CustomText(
                      AppStrings.addFile,
                      color: AppTheme.primary500Clr,
                      fontSize: AppConsts.textSize.sp,
                    ),

                  ],
                ),
              ),


            ],
          ),
      ),);
  }
}
