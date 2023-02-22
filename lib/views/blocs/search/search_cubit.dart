import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final TextEditingController searchController = TextEditingController();

  onTextChange(){
    print('on change text');
    if(searchController.text.trim().isEmpty){
      getRecentSearch();
      emit(SearchGetRecentSearchs());

    }else{
      getSuggestion();
      emit(SearchGetSuggestions());

    }
    //emit(SearchInitial());
  }

  getSuggestion(){

  }

  getRecentSearch(){

  }

  getResult(){

  }

}
