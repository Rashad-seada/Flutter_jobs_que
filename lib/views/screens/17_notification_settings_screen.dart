import 'package:flutter/material.dart';
import 'package:jobs_que/views/components/notification_settings/notification_setting_card.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';
import '../../core/config/app_strings.dart';
import '../components/notification_settings/notification_setting_section.dart';
import '../widgets/main_back_button.dart';
import '../widgets/space.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: ListView(
        children: [

          Space(height: AppConsts.appbarSpace.h,),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 3.5.w,right: 5.w),
              child: MainBackButton(label: AppStrings.notification),
            ),
          ),
          Space(height: 3.h,),

          NotificationSettingSection(
            sectionTitle: AppStrings.jobNotification,
            settings: [
              NotificationSettingsCard(setting: AppStrings.searchAlert),
              NotificationSettingsCard(setting: AppStrings.applicationUpdate),
              NotificationSettingsCard(setting: AppStrings.applicationReminder),
              NotificationSettingsCard(setting: AppStrings.interestedIn),
              NotificationSettingsCard(setting: AppStrings.seekerUpdates),
            ],
          ),
          Space(height: 4.h,),

          NotificationSettingSection(
            sectionTitle: AppStrings.otherNotification,
            settings: [
              NotificationSettingsCard(setting: AppStrings.showProfile),
              NotificationSettingsCard(setting: AppStrings.allMessages),
              NotificationSettingsCard(setting: AppStrings.messageNudges),
            ],
          ),
          Space(height: 5.h,),

        ],
      ),
    );
  }
}
