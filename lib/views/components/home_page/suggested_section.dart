import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/views/components/home_page/suggested_card.dart';
import 'package:jobs_que/views/widgets/section_header.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

class SuggestedSection extends StatelessWidget {
  const SuggestedSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SectionHeader(sectionTitle: AppStrings.suggestedJobs),
        Space(height: 1.5.h,),

        SizedBox(
          height: 25.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return Row(

                  children: [
                    Space(width: (index == 0)? 7.w: 0,),

                    SuggestedCard(index: index,),

                    Space(width: (index == 2)? 7.w: 0),

                  ],
                );
              },
              separatorBuilder: (context,index){
                return Space(width: 5.w,);
              },
              itemCount: 3,
          ),
        ),
      ],
    );
  }
}
