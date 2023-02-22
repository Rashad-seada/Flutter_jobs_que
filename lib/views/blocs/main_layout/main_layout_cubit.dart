import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/views/pages/02_home_page.dart';
import 'package:jobs_que/views/pages/03_message_page.dart';
import '../../../core/config/app_images.dart';
import '../../pages/04_applied_page.dart';
import '../../pages/05_saved_page.dart';
import '../../pages/06_profile_page.dart';

part 'main_layout_state.dart';

class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit() : super(MainLayoutHome());

  void onTap(index){
    print(index);
    currentIndex = index;
    emit(states[index]);
  }

  int currentIndex = 0;


  List<String> navBarLabels = [
    AppStrings.home,
    AppStrings.messages,
    AppStrings.applied,
    AppStrings.saved,
    AppStrings.profile,

  ];

  List<Widget> pages = [
    HomePage(),
    MessagePage(),
    AppliedPage(),
    SavedPage(),
    ProfilePage(),
  ];

  List<MainLayoutState> states = [
    MainLayoutHome(),
    MainLayoutMessages(),
    MainLayoutApplied(),
    MainLayoutSaved(),
    MainLayoutProfile(),
  ];

}
