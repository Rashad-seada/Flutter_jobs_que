part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchGetRecentSearchs extends SearchState {
  @override
  List<Object> get props => [];
}


class SearchGetResults extends SearchState {
  @override
  List<Object> get props => [];
}


class SearchIsLoading extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchIsSuccess extends SearchState {
  static List<RecentJob>? jobs = [];

  SearchIsSuccess(List<RecentJob>? searchedJobs){
    jobs = searchedJobs;
  }

  @override
  List<Object> get props => [];
}

class SearchIsFaild extends SearchState {
  @override
  List<Object> get props => [];
}