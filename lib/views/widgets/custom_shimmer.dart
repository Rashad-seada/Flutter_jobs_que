import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  Widget child;
  Color baseColor;
  Color highlightColor;
  CustomShimmer({
    Key? key,
    required this.child,
    this.baseColor = const Color(0xfff3f3f3),
    this.highlightColor = const Color(0xfff3f3f3),
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
