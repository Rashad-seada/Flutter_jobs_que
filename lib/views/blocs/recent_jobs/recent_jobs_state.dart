part of 'recent_jobs_cubit.dart';

abstract class RecentJobsState extends Equatable {
  const RecentJobsState();
}

class RecentJobsInitial extends RecentJobsState {
  @override
  List<Object> get props => [];
}

class RecentJobsIsLoading extends RecentJobsState {
  @override
  List<Object> get props => [];
}

class RecentJobsIsError extends RecentJobsState {
  @override
  List<Object> get props => [];
}

class RecentJobsIsSuccess extends RecentJobsState {

  static List<RecentJob>? jobs = [];
  RecentJobsIsSuccess(List<RecentJob>? recentJobs){
    jobs = recentJobs;
  }

  @override
  List<Object> get props => [];
}