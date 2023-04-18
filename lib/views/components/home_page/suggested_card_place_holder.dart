import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/app_theme.dart';
import '../../widgets/custom_shimmer.dart';

class SuggestedCardPlaceHolder extends StatelessWidget {
  const SuggestedCardPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomShimmer(
      child: Container(
          width: 80.w,
          height: 23.h,
          padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppTheme.neutral100,
          borderRadius: BorderRadius.circular(12),
        )
      ),
    );
  }
}
