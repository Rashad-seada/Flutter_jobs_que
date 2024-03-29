import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/domain/entities/jobs/recent_jobs_entity.dart';
import 'package:jobs_que/views/components/home_page/recent_card.dart';
import 'package:jobs_que/views/components/home_page/recent_card_place_holder.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_strings.dart';
import '../../../domain/entities/jobs/suggested_jobs_entity.dart';
import '../../blocs/home/home_cubit.dart';
import '../../blocs/recent_jobs/recent_jobs_cubit.dart';
import '../../widgets/section_header.dart';
import '../../widgets/space.dart';

class RecentSection extends StatefulWidget {
  bool withHeader;

  RecentSection({
    this.withHeader = true,
    Key? key
  }) : super(key: key);

  @override
  State<RecentSection> createState() => _RecentSectionState();
}

class _RecentSectionState extends State<RecentSection> {

  @override
  void initState() {
    context.read<RecentJobsCubit>().getRecentJobs(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        (widget.withHeader)?
        SectionHeader(sectionTitle: AppStrings.recentJobs)
            :SizedBox(),
        Space(height: 1.h,),

        SizedBox(
          width: 85.w,
          child: BlocConsumer<RecentJobsCubit, RecentJobsState>(
            listener: (context, state) {},
            builder: (context, state) {

              if(state is RecentJobsIsSuccess) {
                return ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return Column(
                        children: [

                          RecentCard(job: RecentJobsIsSuccess.jobs![index],),

                          Space(height: (index == RecentJobsIsSuccess.jobs!.length -1)? 10.h: 0),

                        ],
                      );
                    },
                    separatorBuilder: (context,index){
                      return  Expanded(child: Divider(color: AppTheme.neutral200,));
                    },
                    itemCount: RecentJobsIsSuccess.jobs!.length
                );

              }
              else if(state is RecentJobsIsError) {
                return SizedBox();
              }else {
                return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return Column(
                        children: [

                          RecentCardPlaceHolder(),

                          Space(height: (index == 2)? 10.h: 0),

                        ],
                      );
                    },
                    separatorBuilder: (context,index){
                      return  Expanded(child: Divider(color: AppTheme.neutral200,));
                    },
                    itemCount: 3
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
