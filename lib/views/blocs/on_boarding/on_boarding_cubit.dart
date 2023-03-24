import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/views/blocs/auth/auth_cubit.dart';

import '../../../core/config/app_enums.dart';
import '../../screens/02_auth_screen.dart';
import '../../widgets/custom_page_transition.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  PageController controller = PageController();

  int index = 0;

  void onTapSkip(context){
    Navigator.push(context, CustomPageTransition(AuthScreen(option: AuthOptions.signUp,)));
  }

  void onTapButton(BuildContext context){
    if(index == 2){
      Navigator.push(context, CustomPageTransition(AuthScreen(option: context.read<AuthCubit>().authOptions,)));
    }else{
      controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
    }
  }

}
