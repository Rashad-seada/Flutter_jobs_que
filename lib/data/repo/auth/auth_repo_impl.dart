import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/data/data_source/remote_data_source/auth/auth_remote_data_source.dart';
import 'package:jobs_que/domain/entities/auth/login_entity.dart';
import 'package:jobs_que/domain/entities/auth/my_profile_entity.dart';
import 'package:jobs_que/domain/entities/auth/otp_entity.dart';
import 'package:jobs_que/domain/entities/auth/profile_entity.dart';
import 'package:jobs_que/domain/entities/auth/registration_entity.dart';
import 'package:jobs_que/domain/repo/auth/auth_repo.dart';
import '../../../core/error/exception.dart';
import '../../../core/network/network.dart';
import '../../data_source/local_data_source/auth/auth_local_data_source.dart';


class AuthRepoImpl implements AuthRepo {

  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  AuthRepoImpl(
      this._remoteDataSource,
      this._localDataSource,
      this._networkInfo,
      );

  storeUserInfo({
    required String? name,
    required String? email,
    required int? userId,
    required String? token,
  }) {
      _localDataSource.setUserName(name);
      _localDataSource.setEmail(email);
      _localDataSource.setId(userId);
      _localDataSource.setToken(token);
  }

  @override
  Future<Either<Failure, RegistrationEntity>> register({
    required String name,
    required String email,
    required String password
  }) async {

    if(await _networkInfo.isConnected){
      try{
        RegistrationEntity entity = await _remoteDataSource.register(name: name, email: email,password: password);
        await storeUserInfo(
          email: entity.profile?.email,
          name: entity.profile?.name,
          userId: entity.profile?.userId,
          token: entity.token,
        );
        return right(entity);
      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }
    return left(NetworkFailure("Please check your internet connection"));

  }

  @override
  Future<Either<Failure, LoginEntity>> login({
    required String email,
    required String password
  }) async{
    if(await _networkInfo.isConnected){
      try{
        LoginEntity entity = await _remoteDataSource.login(email: email,password: password);
        await storeUserInfo(
          email: entity.user?.email,
          name: entity.user?.name,
          userId: entity.user?.id,
          token: entity.token,
        );
        return right(entity);
      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }
    return left(NetworkFailure("Please check your internet connection"));
  }

  @override
  Future<Either<Failure, OtpEntity>> getOtp() async {
    if(await _networkInfo.isConnected){
      try{
        String? token = await _localDataSource.getToken;
        String? email = await _localDataSource.getEmail;

        if(token == null || email == null) return left(CacheFailure("there was unknown error"));

        OtpEntity entity = await _remoteDataSource.getOtp(email: email,token: token);
        _localDataSource.setOtp(int.parse(entity.data!));
        return right(entity);

      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }
    return left(NetworkFailure("Please check your internet connection"));
  }

  @override
  Future<Either<Failure, MyProfileEntity>> getMyProfile() async {
    if(await _networkInfo.isConnected){
      try{

        int? id = await _localDataSource.getId;
        String? token = await _localDataSource.getToken;

        if(id == null || token == null) return left(CacheFailure("there was an unknown error"));

        MyProfileEntity entity = await _remoteDataSource.getMyProfile(id: id, token: token);
        return right(entity);

      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }
    return left(NetworkFailure("Please check your internet connection"));
  }

  @override
  Future<Either<Failure, ProfileEntity>> getUserProfile() async {
    if(await _networkInfo.isConnected){
      try{

        int? id = await _localDataSource.getId;
        String? token = await _localDataSource.getToken;

        if(id == null || token == null) return left(CacheFailure("there was an unknown error"));

        ProfileEntity entity = await _remoteDataSource.getUserProfile(id: id, token: token);
        return right(entity);

      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }
    return left(NetworkFailure("Please check your internet connection"));
  }


}