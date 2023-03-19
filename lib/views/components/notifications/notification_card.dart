import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/custom_text.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.h),

      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            clipBehavior: Clip.hardEdge,
            width: 15.w,
            height: 15.w,
            decoration: BoxDecoration(
              color: AppTheme.neutral100,
              shape: BoxShape.circle,
            ),
          ),
          Space(width: 3.w,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Space(height: 0.25.h,),

              SizedBox(
                width: 65.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      "Welcome to Jobsque",
                      fontSize: AppConsts.textSize.sp,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.neutral900,
                    ),

                    Row(
                      children: [

                        Container(
                          width: 2.w,
                          height: 2.w,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle,
                          ),
                        ),

                        Space(width: 2.w,),

                        CustomText(
                          "10:00 AM",
                          fontSize: AppConsts.subTextSize.sp,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.neutral500,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Space(height: 1.h,),

              SizedBox(
                width: 65.w,
                child: CustomText(
                  "Hello Rafif Dian Axelingga, thank you for registering Jobsque. Enjoy the various features that....",
                  fontSize: AppConsts.subTextSize.sp,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.neutral500,
                  maxLines: 3,
                ),
              ),

            ],
          )


        ],
      ),
    );
  }
}
