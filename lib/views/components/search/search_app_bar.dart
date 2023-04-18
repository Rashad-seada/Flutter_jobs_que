import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_images.dart';
import '../../blocs/search/search_cubit.dart';
import '../../widgets/search_bar.dart';

class SearchAppBar extends StatelessWidget {

  Function()? onTap;
  Function()? onSubmitted;
  Function()? onChanged;
  TextInputType? keyboardType;

  SearchAppBar({
    this.onTap,
    this.onSubmitted,
    this.onChanged,
    this.keyboardType,
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
            onPressed: () {
              SearchCubit.searchController.clear();
              Navigator.pop(context,);
            },
            icon: SvgPicture.asset(AppImages.arrow),
          ),

          SearchBar(
            keyboardType: keyboardType,
            onTap: ()=> onTap!(),
            onChanged: (value) => onChanged!(),
            onSubmitted: (value) => onSubmitted!(),
            controller: SearchCubit.searchController,
            width: 76.5.w,
          ),


        ],
      ),
    );
  }
}
