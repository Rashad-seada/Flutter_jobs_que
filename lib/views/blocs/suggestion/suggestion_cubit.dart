import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/views/blocs/search/search_cubit.dart';

import '../../../domain/entities/jobs/recent_jobs_entity.dart';
import '../../../domain/usecases/jobs/get_search_jobs_usecase.dart';

part 'suggestion_state.dart';

class SuggestionCubit extends Cubit<SuggestionState> {
  SuggestionCubit() : super(SuggestionInitial());

  getSuggestion()async {

    if (SearchCubit.searchController.text.trim().isNotEmpty) {
      emit(SuggestionIsLoading());
      await GetSearchJobsUsecase().call(GetSearchParams(SearchCubit.searchController.text))
          .then((value) =>
          value.bimap(
                  (error) {
                    emit(SuggestionIsError());
                    return;

                  },
                  (success) {
                    emit(SuggestionIsSuccess(success.data));
                    return;
                  }
          )
      );
    }

  }

  void init() {
    emit(SuggestionInitial());
  }
}
