import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_images.dart';
import '../../../domain/entities/jobs/suggested_jobs_entity.dart';
import '../../../domain/usecases/jobs/get_suggested_jobs_usecase.dart';
import '../../widgets/custom_snack_bar.dart';

part 'suggested_jobs_state.dart';

class SuggestedJobsCubit extends Cubit<SuggestedJobsState> {
  SuggestedJobsCubit() : super(SuggestedJobsInitial());

  Future<void> getSuggestedJobs(BuildContext context) async {
    emit(SuggestedJobsIsLoading());
    await GetSuggestedJobsUsecase().call().then(
            (value) => value.bimap(
                (error) {
                  ScaffoldMessenger.of(context).showSnackBar(customSnackBar(context,message: error.message, iconImage: AppImages.error,));
                  emit(SuggestedJobsIsError(error.message));
                  return ;
                },
                (success) {
                  if(success.status == true){
                    emit(SuggestedJobsIsSuccess(success.data));
                    return ;
                  }else {
                    ScaffoldMessenger.of(context).showSnackBar(customSnackBar(context,message: "please sign in and try again", iconImage: AppImages.wrong,));
                    return ;
                  }
            }
        )
    );
  }


}
