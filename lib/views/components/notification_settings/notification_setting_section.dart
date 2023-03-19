import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_theme.dart';
import '../../widgets/space.dart';
import '../search/suggestions_header.dart';
import 'notification_setting_card.dart';

class NotificationSettingSection extends StatelessWidget {
  String sectionTitle;
  List<NotificationSettingsCard> settings;


  NotificationSettingSection({
    required this.sectionTitle,
    required this.settings,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SuggestionsHeader(title: sectionTitle,),
        Space(
          height: 1.h,
        ),
        ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context,index){
              return settings[index];
            },
            separatorBuilder: (context,index){
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: const Divider(color: AppTheme.neutral300,),
              );
            },
            itemCount: settings.length
        ),
      ],
    );
  }
}
