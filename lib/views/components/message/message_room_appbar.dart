import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_images.dart';
import '../../../core/config/app_theme.dart';

class MessageRoomAppbar extends StatelessWidget {
  const MessageRoomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppTheme.neutral500.withOpacity(0.1),
            offset: Offset(0, 1),
            blurRadius: 5
          )
        ]
      ),
      width: 100.w,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 7.w,vertical: AppConsts.appbarSpace.h),
        child: InkWell(
          borderRadius: BorderRadius.circular(1000),
          onTap: ()=> Navigator.pop(context),
          child: Row(
            children: [

              SvgPicture.asset(AppImages.arrow),
              Space(width: 3.w,),

              Container(
                width: 13.w,
                height: 13.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.neutral200
                ),
              ),

              Space(width: 3.w,),
              CustomText("Apple",fontSize: AppConsts.textSize.sp + 4.sp,color: AppTheme.neutral900,)

            ],
          ),
        ),
      ),
    );
  }
}
