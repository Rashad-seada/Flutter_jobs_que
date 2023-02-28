import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';
import '../../core/config/app_strings.dart';
import '../../core/config/app_theme.dart';
import '../components/job_details/people_card.dart';
import '../widgets/custom_text.dart';
import '../widgets/space.dart';

class PeoplePage extends StatelessWidget {
  const PeoplePage({Key? key}) : super(key: key);

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
            AppStrings.employeesFor(10),
            color: AppTheme.neutral900,
            fontSize: AppConsts.textSize.sp,
            fontWeight: FontWeight.w600,
          ),
          Space(height: 1.h,),

          CustomText(
            "UI/UX Design",
            color: AppTheme.neutral400,
            fontSize: AppConsts.subTextSize.sp -1.sp,
          ),
          Space(height: 3.h,),

          Flexible(
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return PeopleCard(
                  username: "Dimas Adi Saputro",
                  expertIn: 'Senior UI/UX Designer at Twitter',
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Expanded(
                  child: Divider(
                    color: AppTheme.neutral200,
                    thickness: 0.5,
                  ),
                );
              },
              itemCount: 6,

            ),
          )

        ],
      ),
    );
  }
}