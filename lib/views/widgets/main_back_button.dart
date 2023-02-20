import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:sizer/sizer.dart';
import '../../core/config/app_images.dart';

class MainBackButton extends StatelessWidget {
  String label;
  bool hasLogo;
  EdgeInsets padding;
  MainBackButton({
    this.label = '',
    this.hasLogo = false,
    this.padding = const EdgeInsets.all(0),
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          IconButton(
              onPressed: ()=> Navigator.pop(context,),
              icon: SvgPicture.asset(AppImages.arrow)
          ),

          CustomText(label,fontSize: 17.5.sp,fontWeight: FontWeight.w500,),


          (hasLogo)?

          SvgPicture.asset(AppImages.logo,width: 25.w,):
          SizedBox(width: 10.w,),

        ],
      ),
    );
  }
}
