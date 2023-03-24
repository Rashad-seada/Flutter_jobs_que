import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/core/network/network.dart';
import 'package:jobs_que/data/data_source/local_data_source/jobs/jobs_local_data_source.dart';
import 'package:jobs_que/data/data_source/remote_data_source/jobs/jobs_remote_data_source.dart';
import 'package:jobs_que/domain/entities/jobs/add_favorite_entity.dart';
import 'package:jobs_que/domain/entities/jobs/all_favorite_jobs_entity.dart';
import 'package:jobs_que/domain/entities/jobs/recent_jobs_entity.dart';
import 'package:jobs_que/domain/entities/jobs/search_jobs_entity.dart';
import 'package:jobs_que/domain/entities/jobs/suggested_jobs_entity.dart';
import 'package:jobs_que/domain/repo/jobs/jobs_repo.dart';

import '../../../core/error/exception.dart';
import '../../data_source/local_data_source/auth/auth_local_data_source.dart';

class JobsRepoImpl extends JobsRepo {

  JobsLocalDataSource jobsLocalDataSource;
  JobsRemoteDataSource jobsRemoteDataSource;
  NetworkInfo networkInfo;
  AuthLocalDataSource authLocalDataSource;

  JobsRepoImpl({
    required this.jobsLocalDataSource,
    required this.jobsRemoteDataSource,
    required this.networkInfo,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, RecentJobsEntity>> getRecentJobs() async {
    if(await networkInfo.isConnected){
      try{
        String? token = await authLocalDataSource.getToken;

        if(token == null) return left(CacheFailure("there was unknown error"));

        RecentJobsEntity entity = await jobsRemoteDataSource.getRecentJobs(token: token);

        jobsLocalDataSource.clearRecentJobs();
        jobsLocalDataSource.setRecentJobs(entity.data);

        return right(entity);

      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }else{
      RecentJobsEntity? entity = await jobsLocalDataSource.getRecentJobs();
      if(entity.data == null || entity.data!.isEmpty) return left(NetworkFailure("Please check your internet connection"));
      return right(entity);

    }
  }

  @override
  Future<Either<Failure, SuggestedJobsEntity>> getSuggestedJobs() async {
    if(await networkInfo.isConnected){
      try{
        String? token = await authLocalDataSource.getToken;
        int? id = await authLocalDataSource.getId;

        if(token == null || id == null) return left(CacheFailure("there was unknown error"));

        SuggestedJobsEntity entity = await jobsRemoteDataSource.getSuggestedJobs(token: token, id: id);

        jobsLocalDataSource.clearSuggestedJobs();
        jobsLocalDataSource.setSuggestedJobs(entity.data);

        return right(entity);

      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }else{
      SuggestedJobsEntity? entity = await jobsLocalDataSource.getSuggestedJobs();
      if(entity.data == null || entity.data!.isEmpty) return left(NetworkFailure("Please check your internet connection"));
      return right(entity);

    }
  }

  @override
  Future<Either<Failure, SearchJobsEntity>> getSearchJobs({required String search}) async {
    if(await networkInfo.isConnected){
      try{
        String? token = await authLocalDataSource.getToken;

        if(token == null) return left(CacheFailure("there was unknown error"));

        SearchJobsEntity entity = await jobsRemoteDataSource.getSearchJobs(token: token,search: search);

        return right(entity);

      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }
    return left(NetworkFailure("Please check your internet connection"));
  }

  @override
  Future<Either<Failure, AddFavoriteJobEntity>> addFavoriteJobs({required int jobId}) async {
    if(await networkInfo.isConnected){
      try{
        String? token = await authLocalDataSource.getToken;
        int? id = await authLocalDataSource.getId;

        if(token == null || id == null) return left(CacheFailure("there was unknown error"));

        AddFavoriteJobEntity entity = await jobsRemoteDataSource.addFavoriteJob(userId: id, jobId: jobId, token: token);

        return right(entity);

      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }
    return left(NetworkFailure("Please check your internet connection"));
  }

  @override
  Future<Either<Failure, AllFavoriteJobsEntity>> getFavoriteJobs() async {

    if(await networkInfo.isConnected){
      try{
        String? token = await authLocalDataSource.getToken;
        int? id = await authLocalDataSource.getId;

        if(token == null || id == null) return left(CacheFailure("there was unknown error"));

        AllFavoriteJobsEntity entity = await jobsRemoteDataSource.getAllFavoriteJobs(id: id, token: token);

        jobsLocalDataSource.clearFavoriteJobs();
        jobsLocalDataSource.setFavoriteJobs(entity.data);

        return right(entity);

      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }else{
      AllFavoriteJobsEntity? entity = await jobsLocalDataSource.getFavoriteJobs();
      if(entity.data == null || entity.data!.isEmpty) return left(NetworkFailure("Please check your internet connection"));
      return right(entity);

    }
  }

}