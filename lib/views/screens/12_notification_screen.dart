import 'package:flutter/material.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';
import '../../core/config/app_strings.dart';
import '../components/notifications/notifications_section.dart';
import '../widgets/main_back_button.dart';
import '../widgets/space.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: ListView(
        children: [

          Space(height: AppConsts.appbarSpace.h,),

          Padding(
            padding: EdgeInsets.only(left: 3.5.w,right: 5.w),
            child: MainBackButton(
              label: AppStrings.notification,
            ),
          ),

          Space(height: 2.h,),

          ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,index){
                return NotificationsSection();
              },
              separatorBuilder: (context,index){
                return Space(height: 3.h,);
              },
              itemCount: 2,
          ),
          Space(height: 5.h,),

        ],
      ),
    );
  }
}
