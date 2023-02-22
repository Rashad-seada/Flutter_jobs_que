import 'package:flutter/material.dart';
import 'package:jobs_que/views/widgets/custom_page_transition.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:sizer/sizer.dart';
import '../../core/config/app_const.dart';
import '../components/home_page/home_app_bar.dart';
import '../components/home_page/recent_section.dart';
import '../components/home_page/suggested_section.dart';
import '../screens/09_search_screen.dart';
import '../widgets/search_bar.dart';
import '../widgets/space.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: ListView(
        children: [

          Space(height: AppConsts.appbarSpace.h,),

          HomeAppBar(),
          Space(height: 3.h,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w),
            child: SearchBar(
              onTap: ()=>Navigator.push(context, CustomPageTransition(SearchScreen())),
              keyboardType: TextInputType.none,
            ),
          ),
          Space(height: 2.5.h,),

          SuggestedSection(),
          Space(height: 2.h,),

          RecentSection()

        ],
      )
    );
  }
}
