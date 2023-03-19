import 'package:flutter/material.dart';
import 'package:jobs_que/views/widgets/main_switch.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_const.dart';
import '../../../core/config/app_theme.dart';
import '../../widgets/custom_text.dart';

class NotificationSettingsCard extends StatelessWidget {
  String setting;
  bool isSettingOn;

  NotificationSettingsCard({
    required this.setting,
    this.isSettingOn = false,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 7.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(setting,color: AppTheme.neutral900,fontSize: AppConsts.subHeadTextSize.sp - 9.sp,),


          MainSwitch(isOn: isSettingOn)
        ],
      ),
    );
  }
}
