import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:jobs_que/views/components/create_account/create_account_header.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';
import '../../core/config/app_const.dart';
import '../../core/config/app_theme.dart';
import '../widgets/main_scaffold.dart';
import '../widgets/space.dart';

class CreateAccountPage extends StatelessWidget {
  String headText;
  String subText;
  Widget body;
  CreateAccountPage({
    required this.headText,
    required this.subText,
    required this.body,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Column(
        children: [

          Space(height: 5.h,),

          CreateAccountHeader(
              title: headText,
              subTitle: subText
          ),

          Space(height: 4.5.h,),

          SizedBox(
              width: 85.w,
              height: 69.5.h,
              child: body),
        ],
      ),
    );
  }
}