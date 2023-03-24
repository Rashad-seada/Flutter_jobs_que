import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import 'custom_text.dart';

SnackBar customSnackBar(context,{required String message,required String iconImage}){
  return SnackBar(
    elevation: 0,
    dismissDirection: DismissDirection.up,
    behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
      ),
      backgroundColor: Colors.transparent,
      content: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        alignment: Alignment.centerLeft,
        width: 70.w,
        height: 6.h,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
        children: [
          Space(width: 4.w,),
          SvgPicture.asset(iconImage),
          Space(width: 2.w,),
          CustomText(message),
        ],
    ),
      )
  );
}

