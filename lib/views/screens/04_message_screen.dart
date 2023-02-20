import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/views/widgets/custom_image_with_text.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:jobs_que/views/widgets/main_button.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

class MessageScreen extends StatelessWidget {
  String image;
  String headText;
  String subText;
  String buttonLable;
  Function()? onTap;

  MessageScreen({
    required this.image,
    required this.headText,
    required this.subText,
    required this.buttonLable,
    this.onTap,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            CustomImageWithText(
                image: image,
                headText: headText,
                subText: subText
            ),
            Space(height: 27.h,),

            MainButton(
              width: 85.w,
              height: 6.5.h,
              child: CustomText(
                buttonLable,
                fontSize: AppConsts.textSize.sp,
                color: Colors.white,
                textAlign: TextAlign.center,
              ),
              onTap: (){
                onTap!();
              },
            ),
            Space(height: 3.h,),

          ],
        ),
      ),
    );
  }
}
