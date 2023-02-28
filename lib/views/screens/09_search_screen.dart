import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/views/pages/07_result_page.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';
import '../blocs/search/search_cubit.dart';
import '../components/search/search_app_bar.dart';
import '../pages/08_suggestions_page.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Scaffold(
        body: ListView(
          children: [

            Space(height: AppConsts.appbarSpace.h,),

            SearchAppBar(),

            Space(height: 1.h,),

            BlocConsumer<SearchCubit, SearchState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if(state is SearchGetResults)
                  return ResultPage();

                else
                  return SuggestionsPage();


              },
            ),


          ],
        ),

      ),
    );
  }
}
