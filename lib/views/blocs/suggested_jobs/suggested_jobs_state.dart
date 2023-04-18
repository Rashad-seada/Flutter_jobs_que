part of 'suggested_jobs_cubit.dart';

abstract class SuggestedJobsState extends Equatable {
  const SuggestedJobsState();
}

class SuggestedJobsInitial extends SuggestedJobsState {
  @override
  List<Object> get props => [];
}

class SuggestedJobsIsLoading extends SuggestedJobsState {
  @override
  List<Object> get props => [];
}

class SuggestedJobsIsError extends SuggestedJobsState {
  static String message = '';

  SuggestedJobsIsError(String errorMessage){
    message = errorMessage;
  }
  @override
  List<Object> get props => [];
}

class SuggestedJobsIsSuccess extends SuggestedJobsState {

  static List<SuggestedJob>? jobs = [];

  SuggestedJobsIsSuccess(List<SuggestedJob>? suggestedJobs){
    jobs = suggestedJobs;
  }

  @override
  List<Object> get props => [];
}
