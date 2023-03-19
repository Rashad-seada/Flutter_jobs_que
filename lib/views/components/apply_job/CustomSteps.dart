import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_const.dart';
import '../../../core/config/app_strings.dart';
import '../../../core/config/app_theme.dart';
import '../../widgets/custom_text.dart';
import 'CustomStep.dart';

class CustomSteps extends StatelessWidget {
  int itemCount;
  int focusedIndex;
  List<bool> verifiedSteps;
  List<String> stepsTitles;
  ValueChanged<int>? onStepTap;

  CustomSteps({
    required this.itemCount,
    this.focusedIndex = 0,
    required this.verifiedSteps,
    required this.stepsTitles,
    this.onStepTap,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.w,
      child: Flexible(
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,

            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [

                  CustomStep(
                    onTap: (){
                      onStepTap;
                      onStepTap?.call(index);
                    },
                    number: index + 1,
                    isVerified: verifiedSteps[index],
                    isFocused: (focusedIndex == index)? true : false,
                  ),

                  Space(height: 0.75.h,),
                  CustomText(
                    "${stepsTitles[index]}",
                    color: (focusedIndex == index)? AppTheme.primary500Clr :AppTheme.neutral700,
                    fontSize: AppConsts.subTextSize.sp,
                  ),
                ],
              );
            },

            separatorBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 0),
                child: SvgPicture.asset(AppImages.line,),
              );
            },

            itemCount: itemCount,
        ),
      ),
    );
  }
}


