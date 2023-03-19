import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_theme.dart';
import '../../widgets/space.dart';

class HintCard extends StatelessWidget {
  String image;
  String hint;

  HintCard({
    required this.image,
    required this.hint,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          Container(
            width: 12.w,
            height: 12.w,
            padding: EdgeInsets.all(12),
            decoration: const BoxDecoration(
                color: AppTheme.primary100Clr,
                shape: BoxShape.circle
            ),
            child: SvgPicture.asset(image),
          ),
          Space(width: 3.w,),

          Flexible(
              child: CustomText(
                hint,color: AppTheme.neutral500,
                fontSize: AppConsts.subTextSize.sp,
                maxLines: 5,
              )
          )


        ],
      ),
    );
  }
}
