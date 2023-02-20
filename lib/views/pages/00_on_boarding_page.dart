import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';
import '../../core/config/app_const.dart';

class OnboardingPage extends StatelessWidget {
  String image;
  String highlightedWords;
  String headString;
  String subString;

  OnboardingPage({
    Key? key,
    required this.highlightedWords,
    required this.image,
    required this.headString,
    required this.subString,
  }) : super(key: key);

  bool findHighlightedWords(String highlightedWord,String word,){
    List highlightedWords = highlightedWord.split(" ");

    for(highlightedWord in highlightedWords){
      if(highlightedWord == word){
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {

    List<String> head = headString.split(" ");


    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          AnimationConfiguration.staggeredList(
            position: 0,
            child: SlideAnimation(
                duration: Duration(milliseconds: 500),
                curve: Curves.fastLinearToSlowEaseIn,
                child: FadeInAnimation(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: SvgPicture.asset(
                      image,
                      width: 100.w,
                      height: 52.h,
                      fit: BoxFit.fitWidth,
                    )
                )
            ),
          ),

          Space(height: 2.h,),

          SizedBox(
            width: 85.w,
            child: RichText(
              text: TextSpan(
                children: List.generate(
                    head.length,
                    (index) => TextSpan(
                        text: "${head[index]} ",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: (findHighlightedWords(highlightedWords,head[index]))? AppTheme.primaryClr:AppTheme.neutral900,
                            fontSize: AppConsts.headTextSize.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                    )
                )
              ),
            )
          ),

          Space(height: 13,),

          SizedBox(
            width: 85.w,
            child: CustomText(
              subString,
              fontSize: AppConsts.textSize.sp,
              color: AppTheme.neutral500,
              fontWeight: FontWeight.w400,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
