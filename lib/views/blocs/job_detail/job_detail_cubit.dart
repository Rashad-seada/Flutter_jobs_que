import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jobs_que/views/screens/11_apply_job_screen.dart';
import 'package:jobs_que/views/widgets/custom_page_transition.dart';

import '../../pages/09_description_page.dart';
import '../../pages/10_company_page.dart';
import '../../pages/11_people_page.dart';

part 'job_detail_state.dart';

class JobDetailCubit extends Cubit<JobDetailState> {
  JobDetailCubit() : super(JobDetailDescriptionPage());

  int currentIndex = 0;

  List<Widget> pages = [
    DescriptionPage(),
    CompanyPage(),
    PeoplePage(),
  ];

  List<JobDetailState> states = [
    JobDetailDescriptionPage(),
    JobDetailCompanyPage(),
    JobDetailPeoplePage(),
  ];

  onPageChange(int index){
    currentIndex = index;
    emit(states[index]);
  }

  onTap(BuildContext context){
    Navigator.push(context, CustomPageTransition(ApplyJobScreen()));
  }

}
