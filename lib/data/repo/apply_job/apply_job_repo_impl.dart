import 'package:dartz/dartz.dart';

import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/core/network/network.dart';
import 'package:jobs_que/data/data_source/local_data_source/apply_job/apply_local_data_source.dart';
import 'package:jobs_que/data/data_source/local_data_source/auth/auth_local_data_source.dart';
import 'package:jobs_que/data/data_source/remote_data_source/apply_job/apply_remote_data_source.dart';

import 'package:jobs_que/domain/entities/apply_job/apply_job_entity.dart';

import '../../../core/error/exception.dart';
import '../../../domain/repo/apply_job/apply_job_repo.dart';

class ApplyJobRepoImpl implements ApplyJobRepo{

  ApplyLocalDataSource applyLocalDataSource;
  AuthLocalDataSource authLocalDataSource;
  ApplyRemoteDataSource applyRemoteDataSource;
  NetworkInfo networkInfo;

  ApplyJobRepoImpl({
    required this.applyLocalDataSource,
    required this.authLocalDataSource,
    required this.applyRemoteDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, ApplyJobEntity>> applyForJob({
    required String cvFile,
    required String name,
    required String email,
    required String mobile,
    required String workType,
    required String otherFile,
    required int jobId}) async {

    if(await networkInfo.isConnected){
      try{
        String? token = await authLocalDataSource.getToken;
        int? id = await authLocalDataSource.getId;

        if(token == null || id == null) return left(CacheFailure("there was unknown error"));

        ApplyJobEntity entity = await applyRemoteDataSource.applyForJob(
            cvFile: cvFile,
            name: name,
            email: email,
            mobile: mobile,
            workType: workType,
            otherFile: otherFile,
            jobId: jobId,
            userId: id,
            token: token);

        return right(entity);

      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }
    return left(NetworkFailure("Please check your internet connection"));

  }


}