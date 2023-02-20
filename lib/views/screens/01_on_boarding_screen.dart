import 'package:flutter/material.dart';
import 'package:jobs_que/views/blocs/on_boarding/on_boarding_cubit.dart';
import '../components/on_boarding/on_boarding_body.dart';
import '../layouts/00_on_boarding_layout.dart';
import '../widgets/main_scaffold.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  OnBoardingCubit cubit = OnBoardingCubit();

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Stack(
        alignment: Alignment.center,
        children: [

          OnBoardingBody(),

          OnBoardingLayout(),
        ],
      ),
    );
  }
}