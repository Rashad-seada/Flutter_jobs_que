import 'package:flutter/material.dart';
import 'package:jobs_que/views/components/job_details/contact_card.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';
import '../../core/config/app_strings.dart';
import '../../core/config/app_theme.dart';
import '../widgets/custom_text.dart';
import '../widgets/read_more.dart';
import '../widgets/space.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 86.w,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [

          Space(height: 4.h,),

          CustomText(
            AppStrings.contactUs,
            color: AppTheme.neutral900,
            fontSize: AppConsts.textSize.sp,
            fontWeight: FontWeight.w600,
          ),
          Space(height: 1.5.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContactCard(contactMethod: AppStrings.email, contact: "rashadatef2@gmail.com"),
              ContactCard(contactMethod: AppStrings.website, contact: "https://twitter.com"),
            ],
          ),

          Space(height: 3.h,),

          CustomText(
            AppStrings.aboutCompany,
            color: AppTheme.neutral900,
            fontSize: AppConsts.textSize.sp,
            fontWeight: FontWeight.w600,
          ),

          Space(height: 1.5.h,),
          ReadMore(),
          Space(height: 6.h,),

        ],
      ),
    );
  }
}