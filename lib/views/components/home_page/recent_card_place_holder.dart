import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_theme.dart';
import '../../widgets/custom_shimmer.dart';

class RecentCardPlaceHolder extends StatelessWidget {
  const RecentCardPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CustomShimmer(
      child: Container(
          width: 85.w,
          height: 14.h,
          decoration: BoxDecoration(
            color: AppTheme.neutral100,
            borderRadius: BorderRadius.circular(12),
          ),
      ),
    );
  }
}
