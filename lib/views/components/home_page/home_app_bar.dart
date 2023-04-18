import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/data/data_source/local_data_source/auth/auth_local_data_source.dart';
import 'package:jobs_que/views/screens/12_notification_screen.dart';
import 'package:jobs_que/views/widgets/custom_page_transition.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/circle_button.dart';
import '../../widgets/space.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: AuthLocalDataSourceImpl().getUserName,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return CustomText(
                    AppStrings.homePageAppBarHead(" ${snapshot.data}"),
                    fontSize: AppConsts.subHeadTextSize.sp,
                    color: AppTheme.neutral900,
                  );
                },
              ),
              Space(
                height: 0.5.h,
              ),
              CustomText(
                  AppStrings.homePageAppBarSubHead,
                  color: AppTheme.neutral500,
                  fontSize: AppConsts.subTextSize.sp,
              ),
            ],
          ),

          CircleButton(
            icon: SvgPicture.asset(AppImages.notification),
            onTap: () => Navigator.push(context, CustomPageTransition(NotificationScreen())),
          )
        ],
      ),
    );
  }
}
