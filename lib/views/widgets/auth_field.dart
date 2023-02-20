import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:sizer/sizer.dart';
import '../../core/config/app_const.dart';
import '../../core/config/app_images.dart';
import '../../core/config/enums.dart';

class AuthField extends StatefulWidget {
  String? hintText;
  String? labelText;
  Widget? prefixIcon;
  bool? iconIsActive;
  TextEditingController? controller;
  AuthIcons? iconType;
  bool isSecure;
  Function()? onChange;
  FormFieldValidator<String>? validator;
  Key? key;

  AuthField({
    this.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.controller,
    this.iconIsActive,
    this.iconType,
    this.isSecure = false,
    this.onChange,
    this.validator,
  }) : super(key: key);

  bool obscure = true;

  @override
  State<AuthField> createState() => _AuthFieldState();
}

class _AuthFieldState extends State<AuthField> {


  icon(AuthIcons? iconType,bool active){
    if(iconType == AuthIcons.userName) return AppImages.profileIcon(active: active);
    else if(iconType == AuthIcons.email) return AppImages.emailIcon(active: active);
    else if(iconType == AuthIcons.password) return AppImages.lockIcon(active: active);
  }

  @override
  Widget build(BuildContext context) {
    return FormField(

      builder: (FormFieldState<dynamic> formFieldState) {
        
        return Column(
          children: [
            
            TextFormField(
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
              cursorColor: AppTheme.primaryClr,
              decoration: InputDecoration(

                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(4.2.h, 4.2.h, 4.2.h, 0),

                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 14.5,top: 14.5,bottom: 14.5,right: 14.5),
                  child: SvgPicture.asset(icon(widget.iconType,(widget.controller?.text == '')? false: true)),
                ),

                suffixIcon: (widget.isSecure)? Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.obscure = !widget.obscure;
                      });
                    },
                    icon: SvgPicture.asset(AppImages.eyeIcon(active: !widget.obscure)),),
                )
                    :null,

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
                    borderSide: BorderSide(color: (widget.controller?.text == '')? AppTheme.neutral300: AppTheme.primaryClr,width:1),
                    borderRadius: BorderRadius.circular(8)
                ),

                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppTheme.primaryClr,width: 1),
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
            ),

          ],
        );
      },
    );
  }
}

//6.5.h
