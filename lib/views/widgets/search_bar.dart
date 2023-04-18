import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:sizer/sizer.dart';
import '../../core/config/app_strings.dart';
import '../../core/config/app_theme.dart';

class SearchBar extends StatelessWidget {
  TextEditingController? controller;
  Function()? onTap;
  void Function(String)? onChanged;
  void Function(String)? onSubmitted;
  void Function()? onEditingComplete;
  TextInputType? keyboardType;
  double? width;

  SearchBar({
    this.controller,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.keyboardType,
    this.width ,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: width,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          border: Border.all(color: AppTheme.neutral300,width: 1),
      ),
      child: TextField(
        autofocus: false,
        keyboardType: keyboardType,
        onTap: onTap,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        onEditingComplete: onEditingComplete,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 1.h),
            prefixIcon: InkWell(
              borderRadius: BorderRadius.circular(100),
              //onTap: onSubmitted,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: SvgPicture.asset(AppImages.search),
          ),
            ),
          suffixIcon: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              controller?.clear();
            },
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: SvgPicture.asset(AppImages.clear) ,
            ),
          ),
          hintText: AppStrings.search,
          hintStyle: GoogleFonts.lato(
            textStyle: TextStyle(
              color: AppTheme.neutral400,
              fontSize: AppConsts.subTextSize.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide.none
          ),
        ),
      ),
    );
  }
}
