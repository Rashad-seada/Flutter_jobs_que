import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/core/network/network.dart';
import 'package:jobs_que/core/usecase/usecase.dart';
import 'package:jobs_que/data/data_source/local_data_source/auth/auth_local_data_source.dart';
import 'package:jobs_que/domain/entities/jobs/add_favorite_entity.dart';
import 'package:jobs_que/domain/repo/jobs/jobs_repo.dart';

import '../../../data/data_source/local_data_source/jobs/jobs_local_data_source.dart';
import '../../../data/data_source/remote_data_source/jobs/jobs_remote_data_source.dart';
import '../../../data/repo/jobs/jobs_repo_impl.dart';

class AddFavorateJobUsecase implements Usecase<AddFavoriteJobEntity,AddFavorateParams> {

  JobsRepo repo = JobsRepoImpl(
      jobsLocalDataSource: JobsLocalDataSourceImpl(),
      jobsRemoteDataSource: JobsRemoteDataSourceImpl(),
      networkInfo: NetworkInfoImpl(),
      authLocalDataSource: AuthLocalDataSourceImpl()
  );

  @override
  Future<Either<Failure, AddFavoriteJobEntity>> call(AddFavorateParams params) async {
   return await repo.addFavoriteJobs(jobId: params.jobId);
  }
}

class AddFavorateParams {
  int jobId;
  AddFavorateParams(this.jobId);
}