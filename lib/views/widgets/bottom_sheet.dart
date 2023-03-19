import 'package:flutter/material.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_theme.dart';

class MainBottomSheet extends StatelessWidget {
  double height;
  Widget? child;

  MainBottomSheet({
    required this.height,
    this.child,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: height,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20),),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Space(height: 1.5.h,),
          Container(
            width: 20.w,
            height: 0.5.h,
            decoration: BoxDecoration(
              color: AppTheme.neutral800,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          (child == null)? SizedBox(): child!,
        ],
      ),
    );
  }
}
