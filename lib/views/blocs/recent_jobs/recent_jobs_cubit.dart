import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_images.dart';
import '../../../domain/entities/jobs/recent_jobs_entity.dart';
import '../../../domain/usecases/jobs/get_recent_jobs_usecase.dart';
import '../../widgets/custom_snack_bar.dart';

part 'recent_jobs_state.dart';

class RecentJobsCubit extends Cubit<RecentJobsState> {
  RecentJobsCubit() : super(RecentJobsInitial());

  Future<void> getRecentJobs(BuildContext context) async {
    emit(RecentJobsIsLoading());

    await GetRecentJobsUsecase().call().then(
            (value) => value.bimap(
                (error) {
                  ScaffoldMessenger.of(context).showSnackBar(customSnackBar(context,message: error.message, iconImage: AppImages.error,));
                  emit(RecentJobsIsError());
                  return ;
                },
                (success) {

                  if(success.status == true){
                    emit(RecentJobsIsSuccess(success.data));
                    return ;
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(customSnackBar(context,message: "please sign in and try again", iconImage: AppImages.wrong,));
                    return ;
                  }
                }
        )
    );

  }

}
