import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  String text;
  Color? color;
  double? fontSize;
  int? maxLines;
  FontWeight? fontWeight;
  TextAlign? textAlign;

  CustomText(
  this.text,
  {
    Key? key,
    this.color,
    this.fontSize,
    this.maxLines,
    this.fontWeight,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: GoogleFonts.lato(
        textStyle: TextStyle(
            color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,

        ),
      ),
      maxLines: maxLines,
    );
  }
}


