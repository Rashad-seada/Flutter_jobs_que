import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/core/usecase/usecase.dart';
import 'package:jobs_que/data/data_source/local_data_source/auth/auth_local_data_source.dart';
import 'package:jobs_que/data/repo/apply_job/apply_job_repo_impl.dart';
import 'package:jobs_que/domain/entities/apply_job/apply_job_entity.dart';
import 'package:jobs_que/domain/repo/apply_job/apply_job_repo.dart';

import '../../../core/network/network.dart';
import '../../../data/data_source/local_data_source/apply_job/apply_local_data_source.dart';
import '../../../data/data_source/remote_data_source/apply_job/apply_remote_data_source.dart';

class ApplyJobUsecase implements Usecase<ApplyJobEntity,ApplyJobParams> {
  final ApplyJobRepo repo = ApplyJobRepoImpl(
      applyLocalDataSource: ApplyLocalDataSourceImpl(),
      authLocalDataSource: AuthLocalDataSourceImpl(),
      applyRemoteDataSource: ApplyRemoteDataSourceImpl(),
      networkInfo: NetworkInfoImpl());

  @override
  Future<Either<Failure, ApplyJobEntity>> call(ApplyJobParams params) async {
    return await repo.applyForJob(
        cvFile: params.cvFile,
        name: params.name,
        email: params.email,
        mobile: params.mobile,
        workType: params.workType,
        otherFile: params.otherFile,
        jobId: params.jobId);
  }
}

class ApplyJobParams {
  String cvFile;
  String name;
  String email;
  String mobile;
  String workType;
  String otherFile;
  int jobId;

  ApplyJobParams({
    required this.cvFile,
    required this.name,
    required this.email,
    required this.mobile,
    required this.workType,
    required this.otherFile,
    required this.jobId
  });

}