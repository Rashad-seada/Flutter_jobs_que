import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/views/widgets/custom_page_transition.dart';
import 'package:sizer/sizer.dart';
import '01_on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {


  @override
  void initState() {
    Timer(const Duration(seconds: 4), ()=> Navigator.pushAndRemoveUntil(context, CustomPageTransition(OnBoardingScreen()), (route) => false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [


            AnimationConfiguration.staggeredList(
              position: 0,
              duration: const Duration(milliseconds: 4000),
              child: FadeInAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                  child: SvgPicture.asset(AppImages.splashBackground,width: 100.w,height: 100.h,),
              ),
            ),

            AnimationConfiguration.staggeredList(
              position: 1,
              duration: const Duration(milliseconds: 7000),
              child: FadeInAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                child:  SvgPicture.asset(AppImages.logo,),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
