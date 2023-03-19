import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/views/layouts/01_main_layout.dart';
import 'package:jobs_que/views/pages/12_bio_data_page.dart';
import 'package:jobs_que/views/pages/13_more_info_page.dart';
import 'package:jobs_que/views/pages/14_upload_cv_page.dart';
import 'package:jobs_que/views/screens/04_message_screen.dart';

import '../../../core/config/app_strings.dart';
import '../../screens/08_main_screen.dart';
import '../../widgets/custom_page_transition.dart';

part 'apply_job_state.dart';

class ApplyJobCubit extends Cubit<ApplyJobState> {
  ApplyJobCubit() : super(ApplyJobInitial());

  int currentStep = 0;
  List<bool> steps = List.generate(3, (index) => false);
  List<String> stepsTitles = [
    AppStrings.bioData,
    AppStrings.question,
    AppStrings.uploadCv,
  ];
  List<Widget> pages = const [
    BioDataPage(),
    MoreInfoPage(),
    UploadCVPage(),
  ];

  void onTap(BuildContext context) {
    if (currentStep < 2) {
      steps[currentStep] = true;
      currentStep += 1;
    }else{
      Navigator.push(context,CustomPageTransition(
          MessageScreen(
              image: AppImages.done,
              headText: AppStrings.doneText,
              subText: AppStrings.doneBodyText,
              buttonLable: AppStrings.done,
              onTap: ()=>  Navigator.push(context, CustomPageTransition(MainScreen())),
          )) );
    }
    emit(ApplyJobStepChanged());
    emit(ApplyJobInitial());
  }

  onStepTap(int index) {
    currentStep = index;
    emit(ApplyJobStepChanged());
    emit(ApplyJobInitial());
  }

  onDispose() {
    for (int i = 0; i < steps.length; ++i) {
      steps[i] = false;
    }
    currentStep = 0;
  }

}
