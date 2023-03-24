import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';
import '../../core/config/app_images.dart';
import '../../core/config/app_theme.dart';

class CustomTextField extends StatefulWidget {
  String? hintText;
  String? labelText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool? iconIsActive;
  TextEditingController? controller;
  bool isSecure;
  Function()? onChange;
  FormFieldValidator<String>? validator;
  Key? key;
  Function()? onTap;
  TextInputType? keyboardType;

  CustomTextField({
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.iconIsActive,
    this.controller,
    this.isSecure = false,
    this.onChange,
    this.validator,
    this.key,
    this.onTap,
    this.keyboardType,
    this.suffixIcon,
  });

  bool obscure = true;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      style: TextStyle(
        color: AppTheme.neutral900,
        fontSize: AppConsts.subTextSize.sp,
      ),

      onChanged: (text){
        setState(() {});
        widget.onChange!();
      },

      obscureText: widget.obscure && widget.isSecure,
      controller: widget.controller,
      cursorColor: AppTheme.primary500Clr,
      decoration: InputDecoration(

        isDense: true,
        contentPadding: EdgeInsets.fromLTRB(2.h, 4.2.h, 4.2.h, 0),

        prefixIcon: widget.prefixIcon,

        suffixIcon: (widget.isSecure && widget.suffixIcon == null)? Padding(
          padding: const EdgeInsets.only(right: 5),
          child: IconButton(
            onPressed: () {
              setState(() {
                widget.obscure = !widget.obscure;
              });
            },
            icon: SvgPicture.asset(AppImages.eyeIcon(active: !widget.obscure)),),
        )
            :widget.suffixIcon,

        hintText: widget.hintText,
        labelText: widget.labelText,
        errorStyle: GoogleFonts.lato(
          textStyle: TextStyle(height: 1,fontSize: AppConsts.subTextSize.sp),
        ),


        hintStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            color: AppTheme.neutral400,
            fontSize: AppConsts.subTextSize.sp,
            fontWeight: FontWeight.w400,
          ),
        ),

        labelStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            color: AppTheme.neutral400,
            fontSize: AppConsts.subTextSize.sp,
            fontWeight: FontWeight.w400,
          ),
        ),

        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: (widget.controller?.text == '')? AppTheme.neutral300: AppTheme.primary500Clr,width:1),
            borderRadius: BorderRadius.circular(8)
        ),

        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppTheme.primary500Clr,width: 1),
            borderRadius: BorderRadius.circular(8)
        ),

        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppTheme.error,width: 1),
            borderRadius: BorderRadius.circular(8)
        ),

        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppTheme.error,width: 1),
            borderRadius: BorderRadius.circular(8)
        ),

      ),
    );
  }
}
