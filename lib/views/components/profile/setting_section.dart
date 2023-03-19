import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/components/profile/setting_card.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';
import '../search/suggestions_header.dart';

class SettingSection extends StatelessWidget {
  String title;
  List<SettingCard> settingsCards;

  SettingSection({
    required this.title,
    required this.settingsCards,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SuggestionsHeader(title: title,),
        Space(height: 1.h,),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: settingsCards.length,
          shrinkWrap: true,
            itemBuilder: (context,index){
              return settingsCards[index];
            },
          separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w),
                child: const Divider(color: AppTheme.neutral200,),
              );
          },
        ),
      ],
    );
  }
}
