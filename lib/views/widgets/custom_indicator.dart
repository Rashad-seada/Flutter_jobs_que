import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/config/app_theme.dart';

class CustomIndicator extends StatelessWidget {
  PageController controller;
  int count;

  CustomIndicator({
    required this.controller,
    required this.count,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,  // PageController
      count:  count,
      effect:  WormEffect(
          dotWidth:  1.h,
          dotHeight: 1.h,
          dotColor:  AppTheme.primary500Clr.withOpacity(0.2),
          activeDotColor:  AppTheme.primary500Clr
      ),
    );
  }
}
