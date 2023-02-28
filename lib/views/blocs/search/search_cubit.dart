import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/bottom_sheet.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final TextEditingController searchController = TextEditingController();


  openBottomSheet(context){

      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context)=> MainBottomSheet(
            height: 90.h,
          ));


  }

  onTextChange() {
    if (searchController.text.trim().isEmpty) {
      getRecentSearch();
      emit(SearchGetRecentSearchs());
    } else {
      getSuggestion();
      emit(SearchGetSuggestions());
    }
    //emit(SearchInitial());
  }

  getSuggestion() {

  }

  getRecentSearch() {

  }

  getResult() {
    if (searchController.text.trim().isNotEmpty) {
      emit(SearchGetResults());

    }
  }

}