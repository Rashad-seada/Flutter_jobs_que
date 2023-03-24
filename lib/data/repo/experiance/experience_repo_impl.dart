import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/core/network/network.dart';
import 'package:jobs_que/data/data_source/local_data_source/auth/auth_local_data_source.dart';
import 'package:jobs_que/data/data_source/local_data_source/experiance/experience_local_data_source.dart';
import 'package:jobs_que/data/data_source/remote_data_source/education/education_remote_data_source.dart';
import 'package:jobs_que/data/data_source/remote_data_source/experiance/experience_remote_data_source.dart';
import 'package:jobs_que/domain/entities/education/add_education_entity.dart';
import 'package:jobs_que/domain/entities/experiance/add_experiance_entity.dart';
import 'package:jobs_que/domain/repo/experiance/experience_repo.dart';

import '../../../core/error/exception.dart';

class ExperienceRepoImpl implements ExperienceRepo {
  ExperienceLocalDataSource experienceLocalDataSource;
  ExperienceRemoteDataSource experienceRemoteDataSource;
  NetworkInfo networkInfo;
  AuthLocalDataSource authLocalDataSource;


  ExperienceRepoImpl({
    required this.experienceLocalDataSource,
    required this.experienceRemoteDataSource,
    required this.networkInfo,
    required this.authLocalDataSource
  });

  @override
  Future<Either<Failure, AddExperienceEntity>> addExperience({
    required String postion,
    required String typeWork,
    required String compName,
    required String location,
    required String start}) async {

    if(await networkInfo.isConnected){
      try{
        String? token = await authLocalDataSource.getToken;
        int? id = await authLocalDataSource.getId;

        if(token == null || id == null) return left(CacheFailure("there was unknown error"));

        AddExperienceEntity entity = await experienceRemoteDataSource.addExperience(
            userId: id,
            postion: postion,
            typeWork: typeWork,
            compName: compName,
            location: location,
            start: start,
            token: token);

        return right(entity);

      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }
    return left(NetworkFailure("Please check your internet connection"));
  }

}