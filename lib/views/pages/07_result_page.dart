import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/views/components/home_page/recent_section.dart';
import 'package:jobs_que/views/components/search/suggestions_header.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';
import '../components/home_page/search_section.dart';
import '../components/search/search_filter.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Space(height: .5.h,),

        SearchFilter(),
        Space(height: 1.h,),

        SuggestionsHeader(title: AppStrings.featuringJobs(120)),
        Space(height: 1.h,),

        SearchSection(withHeader: false,)
      ],
    );
  }
}
