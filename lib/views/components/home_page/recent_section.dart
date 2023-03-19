import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/components/home_page/recent_card.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_strings.dart';
import '../../widgets/section_header.dart';
import '../../widgets/space.dart';

class RecentSection extends StatelessWidget {
  bool withHeader;

  RecentSection({
    this.withHeader = true,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        (withHeader)?
        SectionHeader(sectionTitle: AppStrings.recentJobs)
            :SizedBox(),
        Space(height: 1.h,),

        SizedBox(
          width: 85.w,
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,index){
                return Column(
                  children: [

                    RecentCard(),

                    Space(height: (index == 5)? 10.h: 0),

                  ],
                );
              },
              separatorBuilder: (context,index){
                return  Expanded(child: Divider(color: AppTheme.neutral200,));
              },
              itemCount: 6
          ),
        ),
      ],
    );
  }
}
