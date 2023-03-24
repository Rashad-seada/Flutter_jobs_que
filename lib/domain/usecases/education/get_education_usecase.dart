import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/core/network/network.dart';
import 'package:jobs_que/core/usecase/usecase_with_no_params.dart';
import 'package:jobs_que/domain/entities/education/get_education_entity.dart';

import '../../../data/data_source/local_data_source/auth/auth_local_data_source.dart';
import '../../../data/data_source/local_data_source/education/education_local_data_source.dart';
import '../../../data/data_source/remote_data_source/education/education_remote_data_source.dart';
import '../../../data/repo/education/education_repo_impl.dart';
import '../../repo/education/education_repo.dart';

class GetEducationUsecase implements Usecase<GetEducationEntity> {
  final EducationRepo repo = EducationRepoImpl(
    educationRemoteDataSource: EducationRemoteDataSourceImpl(),
    educationLocalDataSource: EducationLocalDataSourceImpl(),
    networkInfo: NetworkInfoImpl(),
    authLocalDataSource: AuthLocalDataSourceImpl(),
  );

  GetEducationUsecase();

  @override
  Future<Either<Failure, GetEducationEntity>> call()
  async {
    return await repo.getAllEducation();
  }

}

