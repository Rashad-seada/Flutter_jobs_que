import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'complete_profile_state.dart';

class CompleteProfileCubit extends Cubit<CompleteProfileState> {
  CompleteProfileCubit() : super(CompleteProfileInitial());

  int get totalSteps {
    //return step1 + step2 + step3 + step4;
    return 2;
  }

  int step1 = 0;
  int step2 = 0;
  int step3 = 0;
  int step4 = 0;

}
