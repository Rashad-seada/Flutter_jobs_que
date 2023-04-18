import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/domain/entities/jobs/recent_jobs_entity.dart';
import 'package:jobs_que/views/blocs/search/search_cubit.dart';
import 'package:jobs_que/views/components/home_page/recent_card.dart';
import 'package:jobs_que/views/components/home_page/recent_card_place_holder.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_strings.dart';
import '../../../domain/entities/jobs/suggested_jobs_entity.dart';
import '../../blocs/home/home_cubit.dart';
import '../../blocs/recent_jobs/recent_jobs_cubit.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/section_header.dart';
import '../../widgets/space.dart';

class SearchSection extends StatefulWidget {
  bool withHeader;

  SearchSection({
    this.withHeader = true,
    Key? key
  }) : super(key: key);

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {

  @override
  void initState() {
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
          child: BlocConsumer<SearchCubit, SearchState>(
            listener: (context, state) {},
            builder: (context, state) {

              if(state is SearchIsSuccess) {

                if(SearchIsSuccess.jobs!.isEmpty){
                  return Center(child:CustomText("Sorry, we couldn't find any results "));
                }else {
                  return ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return Column(
                        children: [

                          RecentCard(job: SearchIsSuccess.jobs![index],),

                          Space(height: (index == SearchIsSuccess.jobs!.length -1)? 10.h: 0),

                        ],
                      );
                    },
                    separatorBuilder: (context,index){
                      return  Expanded(child: Divider(color: AppTheme.neutral200,));
                    },
                    itemCount: SearchIsSuccess.jobs!.length
                );
                }

              }
              else if(state is SearchIsFaild) {
                return Center(child: CustomText("there was unknown error"),);
              }else if(state is SearchIsLoading){
                return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return Column(
                        children: [

                          RecentCardPlaceHolder(),

                          Space(height: (index == 4)? 10.h: 0),

                        ],
                      );
                    },
                    separatorBuilder: (context,index){
                      return  Expanded(child: Divider(color: AppTheme.neutral200,));
                    },
                    itemCount: 5
                );
              }else {
                return SizedBox();
              }
            },
          ),
        ),
      ],
    );
  }
}
