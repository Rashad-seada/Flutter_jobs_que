import 'package:flutter/material.dart';
import 'package:jobs_que/views/widgets/custom_page_transition.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_const.dart';
import '../../../core/config/app_theme.dart';
import '../../screens/13_chat_room_screen.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/space.dart';

class ChatCard extends StatelessWidget {

  const ChatCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Navigator.push(context, CustomPageTransition(ChatRoomScreen())),
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 1.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 13.w,
                  height: 13.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.neutral100
                  ),
                ),

                Space(width: 3.w,),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    CustomText(
                      "Apple",
                      color: AppTheme.neutral900,
                      fontSize:  AppConsts.textSize.sp ,
                    ),
                    Space(height: .5.h,),

                    CustomText(
                      "Let’s keep in touch.",
                      color: AppTheme.neutral400,
                      fontSize: AppConsts.subTextSize.sp,
                      maxLines: 1,
                    ),

                  ],
                ),
              ],
            ),


            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomText(
                  "10:00 AM",
                  color: AppTheme.primary500Clr,
                  fontSize: AppConsts.subTextSize.sp,
                ),


                Container(
                  padding: EdgeInsets.all(2.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.primary400Clr
                  ),
                  child: CustomText("1", color: Colors.white,fontSize: 8.sp,)
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
