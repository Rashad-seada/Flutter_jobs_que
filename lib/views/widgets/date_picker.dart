import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:jobs_que/core/config/app_images.dart';
import '../../core/config/app_theme.dart';
import 'custom_text_field.dart';

class DatePicker extends StatelessWidget {
  BuildContext context;
  TextEditingController controller;
  DateTime? selectedDate;
  String? hintText;

  DatePicker({
    required this.context,
    required this.controller,
    this.hintText,
    Key? key}) : super(key: key);

  showMyDatePicker(context){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppTheme.primary500Clr, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: AppTheme.neutral900, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppTheme.primary500Clr, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    ).then((value) {
      controller.text = DateFormat.yMMMd().format(value!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return  CustomTextField(
        controller: controller,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset(AppImages.calendar),
        ),
        hintText: hintText,
        keyboardType: TextInputType.none,
        onTap: () => showMyDatePicker(context),
      );
  }
}




