import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/domain/entities/jobs/suggested_jobs_entity.dart';
import 'package:jobs_que/views/blocs/home/home_cubit.dart';
import 'package:jobs_que/views/components/home_page/suggested_card.dart';
import 'package:jobs_que/views/widgets/section_header.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/entities/jobs/recent_jobs_entity.dart';

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
          width: 100.w,
          child: FutureBuilder(
            future: HomeCubit.instance.getSuggestedJobs(),
            builder: (BuildContext context, AsyncSnapshot<List<SuggestedJob>?> snapshot) {

              if(snapshot.hasData) {
                return ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return Row(

                    children: [
                      Space(width: (index == 0)? 7.w: 0,),

                      SuggestedCard(
                        index: index,
                        job: snapshot.data![index],
                      ),

                      Space(width: (index == 2)? 7.w: 0),

                    ],
                  );
                },
                separatorBuilder: (context,index){
                  return Space(width: 5.w,);
                },
                itemCount: 3,
              );
              }else if(snapshot.hasError) {
                return SizedBox();
              }else{
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ],
    );
  }
}
