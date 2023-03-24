import 'package:dartz/dartz.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:dio/dio.dart';
import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/data/data_source/remote_data_source/auth/auth_remote_data_source.dart';
import 'package:jobs_que/domain/entities/auth/login_entity.dart';
import 'package:jobs_que/domain/entities/auth/my_profile_entity.dart';
import 'package:jobs_que/domain/entities/auth/otp_entity.dart';
import 'package:jobs_que/domain/entities/auth/profile_entity.dart';
import 'package:jobs_que/domain/entities/auth/registration_entity.dart';
import 'package:jobs_que/domain/repo/auth/auth_repo.dart';
import '../../../core/config/app_const.dart';
import '../../../core/error/exception.dart';
import '../../../core/network/network.dart';
import '../../data_source/local_data_source/auth/auth_local_data_source.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  var shared = await SharedPreferences.getInstance();
  AuthRepoImpl repoImpl = AuthRepoImpl(
    AuthRemoteDataSourceImpl(client: Dio(), baseUrl: AppConsts.baseUrl),
    AuthLocalDataSourceImpl(shared),
    NetworkInfoImpl(DataConnectionChecker()),
  );

  var r = await repoImpl.login(email: "rashadatef2@gmail.com", password: "8291917Mn");

  print(r.map((r) => print(r.status)));
}

class AuthRepoImpl implements AuthRepo {

  AuthRemoteDataSource _remoteDataSource;
  AuthLocalDataSource _localDataSource;
  NetworkInfo _networkInfo;

  AuthRepoImpl(
      this._remoteDataSource,
      this._localDataSource,
      this._networkInfo,
      );

  Either<CacheFailure,void> storeUserInfo({
    required String name,
    required String email,
    required int otp,
    required int userId,
    required String token,
  }) {

    try {
      _localDataSource.setUserName(name);
      _localDataSource.setEmail(email);
      _localDataSource.setOtp(otp);
      _localDataSource.setId(userId);
      _localDataSource.setToken(token);
      return right(null);

    } on CacheException {
      return left(CacheFailure(""));
    }
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
        storeUserInfo(
          email: entity.profile!.email!,
          name: entity.profile!.name!,
          otp: entity.data!.otp!,
          userId: entity.profile!.userId!,
          token: entity.token!,
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
        storeUserInfo(
          email: entity.user!.email!,
          name: entity.user!.name!,
          otp: int.parse(entity.user!.otp!),
          userId: entity.user!.id!,
          token: entity.token!,
        );
        return right(entity);
      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }
    return left(NetworkFailure("Please check your internet connection"));
  }

  @override
  Future<Either<Failure, OtpEntity>> getOtp({
    required String email,
    required String token
  }) async {
    if(await _networkInfo.isConnected){
      try{
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
  Future<Either<Failure, ProfileEntity>> getUserProfile({
    required int id,
    required String token}) async {
    if(await _networkInfo.isConnected){
      try{

      } on ServerException {
        return left(ServerFailure("There was a server error, please try again later!"));
      }
    }
    return left(NetworkFailure("Please check your internet connection"));
  }


}