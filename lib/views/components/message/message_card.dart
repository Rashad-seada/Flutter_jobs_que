import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../../domain/entities/message_entity.dart';

class MessageCard extends StatelessWidget {
  MessageEntity message;

  MessageCard({
    required this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.7.h,horizontal: 5.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: (message.myMessage)? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: (message.myMessage)? Radius.circular(20): Radius.circular(0),
                  topRight: (message.myMessage)? Radius.circular(0): Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
              ),
              color: (message.myMessage)? AppTheme.primary500Clr: AppTheme.neutral200
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  message.message,
                  color: (message.myMessage)?Colors.white:AppTheme.neutral800,
                  fontSize: AppConsts.textSize.sp,
                ),
                Space(height: 1.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CustomText(
                      message.time,
                      color: (message.myMessage)? Colors.white:AppTheme.neutral500,
                      fontWeight: FontWeight.w400,
                      fontSize: AppConsts.subTextSize.sp,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

