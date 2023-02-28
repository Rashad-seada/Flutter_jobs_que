import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_const.dart';
import '../../../core/config/app_strings.dart';
import '../../../core/config/app_theme.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/profile_image.dart';
import '../../widgets/space.dart';

class PeopleCard extends StatelessWidget {
  String username;
  String expertIn;

  PeopleCard({
    required this.username,
    required this.expertIn,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 86.w,
      height: 7.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [


          Row(

            children: [
              ProfileImage(imageUrl: '',),

              Space(width: 3.w,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(
                    username,
                    color: AppTheme.neutral900,
                    fontSize: AppConsts.subTextSize.sp ,
                  ),
                  Space(height: 0.5.h,),

                  CustomText(
                    expertIn,
                    color: AppTheme.neutral400,
                    fontSize: AppConsts.subTextSize.sp -1.sp,
                  ),
                ],
              ),

            ],
          ),


          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [

              CustomText(
                AppStrings.workDuring,
                color: AppTheme.neutral400,
                fontSize: AppConsts.subTextSize.sp -1.sp,
              ),

              Space(height: 0.5.h,),

              CustomText(
                AppStrings.years(3),
                color: AppTheme.primary500Clr,
                fontSize: AppConsts.subTextSize.sp ,
              ),
            ],
          ),


        ],
      ),
    );
  }
}
