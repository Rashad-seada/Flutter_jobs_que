part of 'suggestion_cubit.dart';

abstract class SuggestionState extends Equatable {
  const SuggestionState();
}

class SuggestionInitial extends SuggestionState {
  @override
  List<Object> get props => [];
}

class SuggestionIsLoading extends SuggestionState {
  @override
  List<Object> get props => [];
}

class SuggestionIsSuccess extends SuggestionState {
  static List<RecentJob>? jobs = [];

  SuggestionIsSuccess(List<RecentJob>? searchedJobs){
    jobs = searchedJobs;
  }

  @override
  List<Object> get props => [];
}

class SuggestionIsError extends SuggestionState {
  @override
  List<Object> get props => [];
}