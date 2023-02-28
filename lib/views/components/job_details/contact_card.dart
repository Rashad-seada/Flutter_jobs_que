import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

class ContactCard extends StatelessWidget {
  String contactMethod;
  String contact;

  ContactCard({
    required this.contactMethod,
    required this.contact,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      width: 42.w,
      height: 6.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.neutral200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            contactMethod,
            color: AppTheme.neutral400,
            fontSize: AppConsts.subTextSize.sp -1.sp,
          ),
          Space(width: 2.h,),

          CustomText(
            contact,
            color: AppTheme.neutral900,
            fontSize: AppConsts.subTextSize.sp ,
          ),

        ],
      ),
    );
  }
}
