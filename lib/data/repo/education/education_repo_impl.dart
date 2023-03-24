import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/core/network/network.dart';
import 'package:jobs_que/data/data_source/local_data_source/auth/auth_local_data_source.dart';
import 'package:jobs_que/data/data_source/local_data_source/education/education_local_data_source.dart';
import 'package:jobs_que/data/data_source/remote_data_source/education/education_remote_data_source.dart';
import 'package:jobs_que/domain/entities/education/add_education_entity.dart';
import 'package:jobs_que/domain/entities/education/get_education_entity.dart';

import '../../../core/error/exception.dart';
import '../../../domain/repo/education/education_repo.dart';

class EducationRepoImpl implements EducationRepo {
  EducationRemoteDataSource educationRemoteDataSource;
  EducationLocalDataSource educationLocalDataSource;
  NetworkInfo networkInfo;
  AuthLocalDataSource authLocalDataSource;

  EducationRepoImpl({
    required this.educationRemoteDataSource,
    required this.educationLocalDataSource,
    required this.networkInfo,
    required this.authLocalDataSource
  });

  @override
  Future<Either<Failure, AddEducationEntity>> addEducation({
    required String universty,
    required String title,
    required String start,
    required String end}) async {

    if(await networkInfo.isConnected){
      try{
        String? token = await authLocalDataSource.getToken;
        int? id = await authLocalDataSource.getId;

        if(token == null || id == null) return left(CacheFailure("there was unknown error"));

        AddEducationEntity entity = await educationRemoteDataSource.addEducation(
            universty: universty,
            title: title,
            start: start,
            end: end,
            userId: id,
            token: token);

        return right(entity);

      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }
    return left(NetworkFailure("Please check your internet connection"));
  }

  @override
  Future<Either<Failure, GetEducationEntity>> getAllEducation() async {

    if(await networkInfo.isConnected){
      try{
        String? token = await authLocalDataSource.getToken;
        int? id = await authLocalDataSource.getId;

        if(token == null || id == null) return left(CacheFailure("there was unknown error"));

        GetEducationEntity entity = await educationRemoteDataSource.showEducation(
            userId: id,
            token: token);

        educationLocalDataSource.setEducation(entity.data);

        return right(entity);

      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }
    GetEducationEntity entity = await educationLocalDataSource.showEducation();
    if(entity.data == null || entity.data!.isEmpty) return left(NetworkFailure("Please check your internet connection"));
    return right(entity);
  }

}