import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jobs_que/views/screens/10_search_screen.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/app_images.dart';
import '../../../domain/entities/jobs/recent_jobs_entity.dart';
import '../../../domain/usecases/jobs/get_search_jobs_usecase.dart';
import '../../screens/09_suggestion_screen.dart';
import '../../widgets/bottom_sheet.dart';
import '../../widgets/custom_page_transition.dart';
import '../../widgets/custom_snack_bar.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  static final TextEditingController searchController = TextEditingController();

  openBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) =>
            MainBottomSheet(
              height: 90.h,
            ));
  }

  Future<void> getSearchResult(BuildContext context) async {
    Navigator.push(context, CustomPageTransition(SearchScreen()));

    emit(SearchIsLoading());

    if (searchController.text
        .trim()
        .isNotEmpty) {
      await GetSearchJobsUsecase().call(GetSearchParams(searchController.text))
          .then((value) =>
          value.bimap(
                  (error) {
                ScaffoldMessenger.of(context).showSnackBar(customSnackBar(
                  context, message: error.message,
                  iconImage: AppImages.wrong,));
                emit(SearchIsFaild());
              },
                  (success) {
                emit(SearchIsSuccess(success.data));
              }
          )
      );
    }
  }


  getFilterResult() {
    emit(SearchIsLoading());
    if (searchController.text
        .trim()
        .isNotEmpty) {

    }
  }

}
