import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_theme.dart';

class CustomAnimatedText extends StatelessWidget {
  String text;

  CustomAnimatedText({
    required this.text,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          'CODE',
          speed: const Duration(milliseconds: 300),
          textStyle: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.neutral900
              )
          ),
        )
      ],
      repeatForever: true,
    );
  }
}
