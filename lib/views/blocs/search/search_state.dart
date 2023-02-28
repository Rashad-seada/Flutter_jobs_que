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

class SearchGetSuggestions extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchGetResults extends SearchState {
  @override
  List<Object> get props => [];
}