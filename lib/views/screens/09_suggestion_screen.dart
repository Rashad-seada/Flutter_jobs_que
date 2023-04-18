import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';
import '../blocs/search/search_cubit.dart';
import '../blocs/suggestion/suggestion_cubit.dart';
import '../components/search/search_app_bar.dart';
import '../pages/08_suggestions_page.dart';

class SuggestionScreen extends StatelessWidget {
  const SuggestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child:
      ListView(
          children: [

            Space(height: AppConsts.appbarSpace.h,),

            SearchAppBar(
              onChanged: () {
                context.read<SuggestionCubit>().getSuggestion();
              },
              onSubmitted: () {
                context.read<SearchCubit>().getSearchResult(context);
              },
            ),

            Space(height: 1.h,),

            SuggestionsPage(),


          ],
        ),


    );
  }
}
