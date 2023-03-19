import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/blocs/profile/profile_cubit.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
            "Rashad Mohammed",
            color: AppTheme.neutral900,
            fontSize: AppConsts.subHeadTextSize.sp - 3.sp,
        ),
        Space(height: 0.2.h,),

        CustomText(
          "Software engineer",
          color: AppTheme.neutral500,
          fontSize: AppConsts.textSize.sp,
        ),
        Space(height: 3.5.h,),

        Container(
          padding: EdgeInsets.all(11),
          alignment: Alignment.center,
          width: 85.w,
          height: 8.h,
          decoration: BoxDecoration(
            color: Color(0xffFAFAFA),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                        context.read<ProfileCubit>().profileInfoTitles[index],
                      color: AppTheme.neutral500,
                      fontSize: AppConsts.subTextSize.sp,

                    ),
                    CustomText(
                        "40",
                      color: AppTheme.neutral900,
                      fontSize: AppConsts.subHeadTextSize.sp - 8.sp,
                    ),

                  ],
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                color: AppTheme.neutral300,
                height: 1.h,
                width: 0.3.w,
              );
            },
            itemCount: 3,
          ),

        )


      ],
    );
  }
}
