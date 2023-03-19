import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_strings.dart';
import '../components/apply_job/cv_card.dart';
import '../components/apply_job/upload_file_card.dart';
import '../components/portfolio/cv_section.dart';
import '../widgets/main_back_button.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Column(
        children: [

          Space(height: AppConsts.appbarSpace.h,),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 3.5.w,right: 5.w),
              child: MainBackButton(label: AppStrings.portfolio),
            ),
          ),
          Space(height: 3.h,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal:7.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                  AppStrings.addPortfolioHere,
                  color: AppTheme.neutral900,
                  fontSize: AppConsts.subHeadTextSize.sp - 6.sp,
                ),
              ],
            ),
          ),
          Space(height: 2.h,),


          UploadFileCard(),

          Padding(
            padding: EdgeInsets.all(7.w),
            child: CvSection(cvs: [
              CvCard(
                cvTitle: "UI/UX Rashad CV",
                cvFileName: "CV.pdf",
              ),
              CvCard(
                cvTitle: "UI/UX Rashad CV",
                cvFileName: "CV.pdf",
              ),
              CvCard(
                cvTitle: "UI/UX Rashad CV",
                cvFileName: "CV.pdf",
              ),
            ],),
          )


        ],
      ),
    );
  }
}
