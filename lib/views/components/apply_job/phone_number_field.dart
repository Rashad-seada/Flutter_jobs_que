import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:sizer/sizer.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 85.w,
          height: 7.h,
          padding: EdgeInsets.only(left: 4.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppTheme.primary500Clr)
          ),
          child: InternationalPhoneNumberInput(
            initialValue: PhoneNumber(isoCode: 'US'),
            onInputChanged: (text){},
              selectorButtonOnErrorPadding:50,
              spaceBetweenSelectorAndTextField:5,
              cursorColor: AppTheme.primary500Clr,
              formatInput: false,
              selectorConfig: SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET
              ),
              inputDecoration: InputDecoration(
                border: InputBorder.none,
                hintText: AppStrings.enterPhone,
                hintStyle: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: AppTheme.neutral400,
                    fontSize: AppConsts.subTextSize.sp,
                  ),
                ),
              ),
          ),
        ),

        Positioned(
          top: 2.1.h,
          left: 26.w,
          child: Container(
            color: AppTheme.neutral300,
            height: 3.h,
            width: 1,
          ),
        )
      ],
    );
  }
}
