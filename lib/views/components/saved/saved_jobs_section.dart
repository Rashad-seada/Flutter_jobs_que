import 'package:flutter/material.dart';
import 'package:jobs_que/views/components/saved/saved_job_card.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_theme.dart';
import '../../widgets/space.dart';

class SavedJobsSection extends StatelessWidget {
  const SavedJobsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (contxt, index) {
            return Column(
              children: [
                Space(
                  height: (index == 0) ? 1.h : 0,
                ),
                SavedJobCard(),
                Space(
                  height: (index == 5) ? 10.h : 0,
                )
              ],
            );
          },
          separatorBuilder: (contxt, index) {
            return const Divider(
              color: AppTheme.neutral200,
            );
          },
          itemCount: 6
      ),
    );
  }
}
