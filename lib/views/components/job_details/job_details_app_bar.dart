import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_images.dart';
import '../../../core/config/app_strings.dart';
import '../../widgets/main_back_button.dart';

class JobDetailsAppBar extends StatelessWidget {
  const JobDetailsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.w,right: 5.w),
      child: Stack(
        children: [
          MainBackButton(label: AppStrings.jobDetail,),
          Positioned(

            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppImages.savedNavIcon(active: false)),
            ),
          ),
        ],
      ),
    );
  }
}
