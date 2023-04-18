import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/domain/entities/jobs/suggested_jobs_entity.dart';
import 'package:jobs_que/views/blocs/home/home_cubit.dart';
import 'package:jobs_que/views/components/home_page/suggested_card.dart';
import 'package:jobs_que/views/components/home_page/suggested_card_place_holder.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:jobs_que/views/widgets/section_header.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/entities/jobs/recent_jobs_entity.dart';
import '../../blocs/suggested_jobs/suggested_jobs_cubit.dart';

class SuggestedSection extends StatefulWidget {
  const SuggestedSection({Key? key}) : super(key: key);

  @override
  State<SuggestedSection> createState() => _SuggestedSectionState();
}

class _SuggestedSectionState extends State<SuggestedSection> {

  @override
  void initState() {
    context.read<SuggestedJobsCubit>().getSuggestedJobs(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SectionHeader(sectionTitle: AppStrings.suggestedJobs),
        Space(height: 1.5.h,),

        SizedBox(
          height: 25.h,
          width: 100.w,
          child: BlocConsumer<SuggestedJobsCubit,SuggestedJobsState>(
            listener: (context, state) {},
            builder: (context, state) {

              if (state is SuggestedJobsIsSuccess) {
                return ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Space(width: (index == 0) ? 7.w : 0,),
                        SuggestedCard(
                          index: index,
                          job: SuggestedJobsIsSuccess.jobs![index],
                        ),
                        Space(
                            width: (index == SuggestedJobsIsSuccess.jobs!.length - 1) ? 7
                                .w : 0),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Space(width: 5.w,);
                  },
                  itemCount: SuggestedJobsIsSuccess.jobs!.length,
                );
              }
              else if (state is SuggestedJobsIsError) {
                return Center(
                  child: CustomText(SuggestedJobsIsError.message),
                );

              } else {
                return ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Space(width: (index == 0) ? 7.w : 0,),
                        SuggestedCardPlaceHolder(),
                        Space(width: (index == 2) ? 7.w : 0),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Space(width: 5.w,);
                  },
                  itemCount: 3,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
