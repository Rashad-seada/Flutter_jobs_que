import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/core/network/network.dart';
import 'package:jobs_que/data/data_source/local_data_source/auth/auth_local_data_source.dart';
import 'package:jobs_que/domain/repo/jobs/jobs_repo.dart';

import '../../../core/usecase/usecase_with_no_params.dart';
import '../../../data/data_source/local_data_source/jobs/jobs_local_data_source.dart';
import '../../../data/data_source/remote_data_source/jobs/jobs_remote_data_source.dart';
import '../../../data/repo/jobs/jobs_repo_impl.dart';
import '../../entities/jobs/recent_jobs_entity.dart';

class GetRecentJobsUsecase implements Usecase<RecentJobsEntity> {

  JobsRepo repo = JobsRepoImpl(
      jobsLocalDataSource: JobsLocalDataSourceImpl(),
      jobsRemoteDataSource: JobsRemoteDataSourceImpl(),
      networkInfo: NetworkInfoImpl(),
      authLocalDataSource: AuthLocalDataSourceImpl()
  );

  @override
  Future<Either<Failure, RecentJobsEntity>> call() async {
    return await repo.getRecentJobs();
  }

}