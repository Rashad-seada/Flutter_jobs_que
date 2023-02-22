import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:sizer/sizer.dart';

class CircleButton extends StatelessWidget {
  Function()? onTap;
  Widget? icon;

  CircleButton({
    this.onTap,
    this.icon,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(1000),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(13),
        width: 13.w,
        height: 13.w,
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.neutral300,width: 1),
          shape: BoxShape.circle
        ),
        child: icon,
      ),
    );
  }
}
