part of 'apply_job_cubit.dart';

abstract class ApplyJobState extends Equatable {
  const ApplyJobState();
}

class ApplyJobInitial extends ApplyJobState {
  @override
  List<Object> get props => [];
}

class ApplyJobStepChanged extends ApplyJobState {
  @override
  List<Object> get props => [];
}