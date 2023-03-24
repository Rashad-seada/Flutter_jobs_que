import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit() : super(CompleteProfileInitial());

  int get totalSteps {
    return step1 + step2 + step3 + step4;
  }

  int step1 = 0;
  int step2 = 0;
  int step3 = 0;
  int step4 = 0;

  void step1Validate(BuildContext context){
    step1 = 1;
    emit(CompleteProfileValidate());
    emit(CompleteProfileInitial());
    Navigator.pop(context);
  }

  void step2Validate(BuildContext context){
    step2 = 1;
    emit(CompleteProfileValidate());
    emit(CompleteProfileInitial());
    Navigator.pop(context);
  }

  void step3Validate(BuildContext context){
    step3 = 1;
    emit(CompleteProfileValidate());
    emit(CompleteProfileInitial());
    Navigator.pop(context);
  }

  void step4Validate(BuildContext context){
    step4 = 1;
    emit(CompleteProfileValidate());
    emit(CompleteProfileInitial());
    Navigator.pop(context);
  }

}
