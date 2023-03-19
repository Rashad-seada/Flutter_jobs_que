import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';
import '../../core/config/app_strings.dart';
import '../../core/config/app_theme.dart';
import '../components/apply_job/cv_card.dart';
import '../components/apply_job/upload_file_card.dart';
import '../widgets/custom_text.dart';
import '../widgets/space.dart';

class UploadCVPage extends StatelessWidget {
  const UploadCVPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 85.w,
      child: ListView(

        children: [
          CustomText(
            AppStrings.uploadCv,
            color: AppTheme.neutral900,
            fontSize: AppConsts.subHeadTextSize.sp,
          ),
          Space(height: 0.3.h,),

          CustomText(
            AppStrings.pleaseUploadCv,
            color: AppTheme.neutral700,
            fontSize: AppConsts.subTextSize.sp,
          ),
          Space(height: 4.h,),

          CustomText(
            AppStrings.uploadedCv,
            color: AppTheme.neutral900,
            fontSize: AppConsts.textSize.sp ,
            fontWeight: FontWeight.w500,
          ),
          Space(height: 1.h,),

          CvCard(
            cvTitle: "UI/UX Rashad CV",
            cvFileName: "CV.pdf",
          ),
          Space(height: 2.5.h,),


          CustomText(
            AppStrings.otherFiles,
            color: AppTheme.neutral900,
            fontSize: AppConsts.textSize.sp ,
            fontWeight: FontWeight.w500,
          ),
          Space(height: 1.h,),

          UploadFileCard()


        ],
      ),
    );
  }
}
