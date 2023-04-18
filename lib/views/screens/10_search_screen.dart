import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/views/pages/07_result_page.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';
import '../components/search/search_app_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child:
      ListView(
        children: [

          Space(height: AppConsts.appbarSpace.h,),

          SearchAppBar(
              keyboardType: TextInputType.none,
              onTap: ()=> Navigator.pop(context
              )
          ),

          Space(height: 1.h,),

          ResultPage(),


        ],
      ),


    );
  }
}