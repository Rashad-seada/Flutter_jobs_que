import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';
import '../../core/config/app_theme.dart';


class LocationPicker extends StatelessWidget {
  TextEditingController controller;
  String? currentCountry;
  String? currentState;
  String? currentCity;

  LocationPicker({
    required this.controller,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CSCPicker(

      selectedItemStyle: GoogleFonts.lato(
        textStyle: TextStyle(
          color: AppTheme.neutral900,
          fontSize: AppConsts.subTextSize.sp,
        ),
      ),
      dropdownHeadingStyle: GoogleFonts.lato(
        textStyle: TextStyle(
          color: AppTheme.neutral900,
          fontSize: AppConsts.subTextSize.sp,
        ),
      ),
      dropdownItemStyle: GoogleFonts.lato(
        textStyle: TextStyle(
          color: AppTheme.neutral900,
          fontSize: AppConsts.subTextSize.sp,
        ),
      ),

      onCountryChanged: (country){
        currentCountry = country;
      },
      onStateChanged: (state){
        currentState = state;
      },
      onCityChanged: (city){
       currentCity = city;
      },

      currentCountry: currentCountry,
      currentState: currentState,
      currentCity: currentCity,

      dropdownDecoration: BoxDecoration(
          border: Border.all(color: AppTheme.primary400Clr),
          borderRadius: BorderRadius.circular(8)
      ),
      disabledDropdownDecoration: BoxDecoration(
          border: Border.all(color: AppTheme.neutral200),
          borderRadius: BorderRadius.circular(8)
      ),

    );
  }

}
