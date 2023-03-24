import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:sizer/sizer.dart';

import 'complete_profile_steps_card.dart';

class CompleteProfileStepsSection extends StatelessWidget {
  List<CompleteProfileStepsCard> steps;

  CompleteProfileStepsSection({
    required this.steps,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.separated(
          physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context,index){
              return steps[index];
            },
            separatorBuilder: (context,index){
              return Center(
                child: Container(
                  height: 3.h,
                  width: .3.w,
                  color: AppTheme.neutral200,
                ),
              );
            },

            itemCount: steps.length,
        )
    );
  }
}
