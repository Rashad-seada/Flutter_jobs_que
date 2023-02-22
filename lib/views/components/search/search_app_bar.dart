import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_images.dart';
import '../../blocs/search/search_cubit.dart';
import '../../widgets/search_bar.dart';

class SearchAppBar extends StatelessWidget {

  SearchAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.5.w,right: 7.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [


          IconButton(
            onPressed: ()=> Navigator.pop(context,),
            icon: SvgPicture.asset(AppImages.arrow),
          ),

          SearchBar(
            onChanged: (text)=> context.read<SearchCubit>().onTextChange(),
            onSubmitted: (text)=> context.read<SearchCubit>().getResult(),
            controller: context.read<SearchCubit>().searchController,
            width: 76.5.w,
          ),


        ],
      ),
    );
  }
}
