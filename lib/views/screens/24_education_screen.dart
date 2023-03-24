import 'package:flutter/material.dart';
import 'package:jobs_que/views/components/education/education_form.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';
import '../../core/config/app_strings.dart';
import '../widgets/main_back_button.dart';
import '../widgets/space.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: ListView(
        shrinkWrap: true,
        children: [

          Space(height: AppConsts.appbarSpace.h,),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 3.5.w,right: 5.w),
              child: MainBackButton(label: AppStrings.education),
            ),
          ),
          Space(height: 5.h,),
          EducationForm()
        ],
      ),
    );
  }
}
