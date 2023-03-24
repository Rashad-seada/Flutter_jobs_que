import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/data/data_source/local_data_source/auth/auth_local_data_source.dart';
import 'package:jobs_que/domain/entities/profile/profile_bio_entity.dart';
import 'package:jobs_que/domain/entities/profile/profile_intersted_work_entity.dart';
import 'package:jobs_que/domain/entities/profile/profile_language_entity.dart';
import 'package:jobs_que/domain/repo/profile/profile_repo.dart';

import '../../../core/error/exception.dart';
import '../../../core/network/network.dart';
import '../../data_source/local_data_source/profile/profile_local_data_source.dart';
import '../../data_source/remote_data_source/profile/profile_remote_data_source.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final ProfileLocalDataSource profileLocalDataSource;
  final NetworkInfo networkInfo;
  final AuthLocalDataSource authLocalDataSource;

  ProfileRepoImpl({
    required this.profileRemoteDataSource,
    required this.profileLocalDataSource,
    required this.networkInfo,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, ProfileInterstedWorkEntity>> editProfileInterstedWork({
    required String interstedWork,
    required String offlinePlace,
    required String remotePlace
  }) async {

    if (await networkInfo.isConnected) {
      try {
        int? id = await authLocalDataSource.getId;
        String? token = await authLocalDataSource.getToken;

        if (id == null || token == null) return left(CacheFailure("there was unknown error"));

        ProfileInterstedWorkEntity entity = await profileRemoteDataSource.editProfileInterstedWork(
          id: id,
          token: token,
          interstedWork: interstedWork,
          offlinePlace: offlinePlace,
          remotePlace: remotePlace,
        );

        profileLocalDataSource.setProfile(entity.data);

        return right(entity);
      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }
    return left(NetworkFailure("Please check your internet connection"));
  }

  @override
  Future<Either<Failure, ProfileBioEntity>> editProfileBio({
    String? bio = "",
    String? address = "",
    String? mobile = ""}) async {


    if (await networkInfo.isConnected) {
      try {
        int? id = await authLocalDataSource.getId;
        String? token = await authLocalDataSource.getToken;

        if (id == null || token == null) return left(CacheFailure("there was unknown error"));

        ProfileBioEntity entity = await profileRemoteDataSource.editProfileBio(
            id: id,
            token: token,
            bio: bio,
            address: address,
            mobile: mobile
        );

        profileLocalDataSource.setProfile(entity.data);

        return right(entity);
      } on ServerException {
        return left(
            ServerFailure("There was a server error, please try again later!"));
      }
    }
    return left(NetworkFailure("Please check your internet connection"));
  }

  @override
  Future<Either<Failure, ProfileLanguageEntity>> editProfileLanguage({
    String? language = ""}) async {

    if (await networkInfo.isConnected) {
      try {
        int? id = await authLocalDataSource.getId;
        String? token = await authLocalDataSource.getToken;

        if (id == null || token == null) return left(CacheFailure("there was unknown error"));

        ProfileLanguageEntity entity = await profileRemoteDataSource.editProfileLanguage(
            id: id,
            token: token,
            language: language
        );

        profileLocalDataSource.setProfile(entity.data);

        return right(entity);
      } on ServerException {
        return left(
            ServerFailure("There was a server error, please try again later!"));
      }
    }
    return left(NetworkFailure("Please check your internet connection"));
  }


}
