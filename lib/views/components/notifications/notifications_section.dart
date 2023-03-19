import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_strings.dart';
import '../../widgets/space.dart';
import '../search/suggestions_header.dart';
import 'notification_card.dart';

class NotificationsSection extends StatelessWidget {
  const NotificationsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SuggestionsHeader(
          title: AppStrings.today,
        ),

        Space(height: 3.h,),

        SizedBox(
          width:85.w,
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            shrinkWrap: true,
            itemBuilder: (context,index){
              return NotificationCard();
            },
            separatorBuilder: (BuildContext context, int index) {
              return Space(height: 1.h,);
            },
          ),
        ),


      ],
    );
  }
}
