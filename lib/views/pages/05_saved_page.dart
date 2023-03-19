import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../components/saved/saved_jobs_section.dart';
import '../components/search/suggestions_header.dart';
import '../widgets/custom_text.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: ListView(
        children: [

          Space(
            height: AppConsts.appbarSpace.h,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                AppStrings.saved,
                fontSize: 17.5.sp,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          Space(
            height: 2.h,
          ),

          SuggestionsHeader(
            title: "11 " + AppStrings.jobSaved,
            alignment: Alignment.center,
          ),

          SavedJobsSection(),

        ],
      ),
    );
  }
}
