import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  Widget child;
  Color baseColor;
  Color highlightColor;
  CustomShimmer({
    Key? key,
    required this.child,
    this.baseColor =  AppTheme.neutral100,
    this.highlightColor = AppTheme.neutral300,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        baseColor: baseColor,
        highlightColor: highlightColor.withOpacity(0.5),
        child: child
    );
  }
}
