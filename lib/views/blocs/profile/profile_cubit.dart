import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobs_que/core/config/app_strings.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  List profileInfoTitles = [
    AppStrings.applied,
    AppStrings.reviewed,
    AppStrings.contacted,
  ];


}
