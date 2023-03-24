import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';

import '../../../core/network/network.dart';
import '../../../core/usecase/usecase_with_no_params.dart';
import '../../../data/data_source/local_data_source/auth/auth_local_data_source.dart';
import '../../../data/data_source/remote_data_source/auth/auth_remote_data_source.dart';
import '../../../data/repo/auth/auth_repo_impl.dart';
import '../../entities/auth/otp_entity.dart';
import '../../repo/auth/auth_repo.dart';

class GetOtpUsecase implements Usecase<OtpEntity> {
  final AuthRepo _authRepo = AuthRepoImpl(
      AuthRemoteDataSourceImpl(),
      AuthLocalDataSourceImpl(),
      NetworkInfoImpl());

  GetOtpUsecase();

  @override
  Future<Either<Failure, OtpEntity>> call() async {
    return await _authRepo.getOtp();
  }

}