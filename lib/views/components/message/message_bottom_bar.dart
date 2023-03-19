import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/circle_button.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_const.dart';

class MessageBottomBar extends StatelessWidget {
  const MessageBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 7.w),
            alignment: Alignment.centerLeft,
            width: 72.w,
            height: 7.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000),
              border: Border.all(color: AppTheme.neutral300),
              color: Colors.white,
            ),
            child: TextField(
              cursorColor: AppTheme.primary500Clr,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: AppStrings.writeMessage,
                  hintStyle: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: AppTheme.neutral400,
                      fontSize: AppConsts.textSize.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
              ),
            ),
          ),
          InkWell(
              onTap: (){},
              borderRadius: BorderRadius.circular(100.w),
              child: SvgPicture.asset(AppImages.send,width: 7.h,height: 7.h,)),
        ],
      ),
    );
  }
}
