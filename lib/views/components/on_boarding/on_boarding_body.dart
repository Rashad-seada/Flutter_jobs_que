import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/views/blocs/on_boarding/on_boarding_cubit.dart';
import '../../../core/config/app_images.dart';
import '../../../core/config/app_strings.dart';
import '../../pages/00_on_boarding_page.dart';

class OnBoardingBody extends StatefulWidget {

  OnBoardingBody({Key? key,}) : super(key: key);

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (index){
        context.read<OnBoardingCubit>().index = index;
        setState(() {});
      },
      controller: context.read<OnBoardingCubit>().controller,
      children: [

        OnboardingPage(
          image: AppImages.firstOnBoardingBackground,
          headString: AppStrings.onBoardingFirstHeadText,
          subString: AppStrings.onBoardingFirstBodyText,
          highlightedWords: 'start building',
        ),

        OnboardingPage(
          image: AppImages.secondOnBoardingBackground,
          headString: AppStrings.onBoardingSecondHeadText,
          subString: AppStrings.onBoardingSecondBodyText,
          highlightedWords: 'join together',
        ),

        OnboardingPage(
          image: AppImages.thirdOnBoardingBackground,
          headString: AppStrings.onBoardingThirdHeadText,
          subString: AppStrings.onBoardingThirdBodyText,
          highlightedWords: 'choice for the job',
        ),
      ],
    );
  }
}
