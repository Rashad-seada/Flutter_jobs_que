import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_const.dart';
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
      child: ListView(

        children: [

          Space(height: AppConsts.appbarSpace.h,),

          SearchAppBar(),

          Space(height: AppConsts.appbarSpace.h,),

          BlocConsumer<SearchCubit, SearchState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return SuggestionsPage();
            },
          ),


        ],
      ),
    );
  }
}
