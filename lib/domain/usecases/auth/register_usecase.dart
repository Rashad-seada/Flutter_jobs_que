import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/core/usecase/usecase.dart';
import 'package:jobs_que/domain/entities/auth/registration_entity.dart';

import '../../../core/network/network.dart';
import '../../../data/data_source/local_data_source/auth/auth_local_data_source.dart';
import '../../../data/data_source/remote_data_source/auth/auth_remote_data_source.dart';
import '../../../data/repo/auth/auth_repo_impl.dart';
import '../../repo/auth/auth_repo.dart';

class RegisterUsecase implements Usecase<RegistrationEntity,RegistrationParams> {
  final AuthRepo _authRepo = AuthRepoImpl(
      AuthRemoteDataSourceImpl(),
      AuthLocalDataSourceImpl(),
      NetworkInfoImpl());

  RegisterUsecase();

  @override
  Future<Either<Failure, RegistrationEntity>> call(RegistrationParams params) async {
    return await _authRepo.register(name: params.name, email: params.email, password: params.password);
  }

}

class RegistrationParams {
  String name;
  String email;
  String password;

  RegistrationParams({
    required this.name,
    required this.email,
    required this.password
  });
}