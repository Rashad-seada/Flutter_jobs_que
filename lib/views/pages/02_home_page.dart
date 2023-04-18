import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/blocs/home/home_cubit.dart';
import 'package:jobs_que/views/widgets/custom_page_transition.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import '../../core/config/app_const.dart';
import '../blocs/recent_jobs/recent_jobs_cubit.dart';
import '../blocs/suggested_jobs/suggested_jobs_cubit.dart';
import '../components/home_page/home_app_bar.dart';
import '../components/home_page/recent_section.dart';
import '../components/home_page/suggested_section.dart';
import '../screens/09_suggestion_screen.dart';
import '../widgets/search_bar.dart';
import '../widgets/space.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
        child: BlocConsumer<HomeCubit,HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            return LiquidPullToRefresh(
              backgroundColor: Colors.white,
              color: AppTheme.primary500Clr,
              springAnimationDurationInMilliseconds: 200,
              showChildOpacityTransition: false,
              animSpeedFactor: 1,
              onRefresh: () async {
                 context.read<SuggestedJobsCubit>().getSuggestedJobs(context);
                 context.read<RecentJobsCubit>().getRecentJobs(context);
              },
              child: ListView(
                shrinkWrap: true,
                children: [

                  Space(height: 4.h,),

                  HomeAppBar(),
                  Space(height: 4.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.w),
                    child: SearchBar(
                      onTap: () =>
                          Navigator.push(
                              context, CustomPageTransition(SuggestionScreen())),
                      keyboardType: TextInputType.none,
                    ),
                  ),
                  Space(height: 2.5.h),



                  SuggestedSection(),
                  Space(height: 2.h),

                  RecentSection(),


                ],
              ),
            );
          },
        )
    );
  }
}
