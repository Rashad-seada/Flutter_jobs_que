import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/domain/entities/auth/my_profile_entity.dart';

import '../../../core/network/network.dart';
import '../../../core/usecase/usecase_with_no_params.dart';
import '../../../data/data_source/local_data_source/auth/auth_local_data_source.dart';
import '../../../data/data_source/remote_data_source/auth/auth_remote_data_source.dart';
import '../../../data/repo/auth/auth_repo_impl.dart';
import '../../repo/auth/auth_repo.dart';

class GetMyProfileUsecase implements Usecase<MyProfileEntity> {
  final AuthRepo _authRepo = AuthRepoImpl(
      AuthRemoteDataSourceImpl(),
      AuthLocalDataSourceImpl(),
      NetworkInfoImpl());

  GetMyProfileUsecase();

  @override
  Future<Either<Failure, MyProfileEntity>> call() async {
    return await _authRepo.getMyProfile();
  }

}
