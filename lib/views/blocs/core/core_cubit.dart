import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/data_source/local_data_source/auth/auth_local_data_source.dart';
import '../../../data/data_source/local_data_source/jobs/jobs_local_data_source.dart';

part 'core_state.dart';

class CoreCubit extends Cubit<CoreState> {
  CoreCubit() : super(CoreInitial());

  static CoreCubit get instance => CoreCubit();

  appInit(){

  }

}
