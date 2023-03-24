
import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/core/usecase/usecase.dart';
import 'package:jobs_que/data/data_source/local_data_source/auth/auth_local_data_source.dart';
import 'package:jobs_que/data/repo/auth/auth_repo_impl.dart';
import 'package:jobs_que/domain/entities/auth/login_entity.dart';
import 'package:jobs_que/domain/repo/auth/auth_repo.dart';

import '../../../core/network/network.dart';
import '../../../data/data_source/remote_data_source/auth/auth_remote_data_source.dart';

class LoginUsecase implements Usecase<LoginEntity,LoginParams> {
  final AuthRepo _authRepo = AuthRepoImpl(
      AuthRemoteDataSourceImpl(),
      AuthLocalDataSourceImpl(),
      NetworkInfoImpl());

  LoginUsecase();

  @override
  Future<Either<Failure, LoginEntity>> call(LoginParams params)
  async {
    return await _authRepo.login(
        email: params.email,
        password: params.password
    );
  }

}

class LoginParams {
  String email;
  String password;

  LoginParams({required this.email,required this.password});
}


void main() async {

  await LoginUsecase().call(
      LoginParams(
          email: "rashadatef2@gmail.com",
          password: "8291917Mn"
      )).then((value) => value.bimap(
          (l) => l.message,
          (r) => r.user
      )
  );

}