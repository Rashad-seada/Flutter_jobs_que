import 'package:flutter/material.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';
import '../../core/config/app_strings.dart';
import '../components/experience/experience_form.dart';
import '../widgets/main_back_button.dart';
import '../widgets/space.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({Key? key}) : super(key: key);

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
              child: MainBackButton(label: AppStrings.experience),
            ),
          ),
          Space(height: 5.h,),

          ExperienceForm()

        ],
      ),
    );
  }
}
