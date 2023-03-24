import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jobs_que/domain/entities/jobs/suggested_jobs_entity.dart';
import 'package:jobs_que/domain/usecases/jobs/get_suggested_jobs_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get instance => HomeCubit();

  getRecentJobs(){

  }

  Future<List<SuggestedJob>?> getSuggestedJobs() async {
    List<SuggestedJob>? jobs = [];

    await GetSuggestedJobsUsecase().call().then(
      (value) => value.bimap(
        (error) {
          jobs = [];
        },
        (success) {
          jobs = success.data;
        }
      )
    );
    return jobs;
  }



}
