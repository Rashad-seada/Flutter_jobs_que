import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/core/usecase/usecase.dart';
import 'package:jobs_que/domain/entities/experiance/add_experiance_entity.dart';
import 'package:jobs_que/domain/repo/experiance/experience_repo.dart';

import '../../../core/network/network.dart';
import '../../../data/data_source/local_data_source/auth/auth_local_data_source.dart';
import '../../../data/data_source/local_data_source/experiance/experience_local_data_source.dart';
import '../../../data/data_source/remote_data_source/experiance/experience_remote_data_source.dart';
import '../../../data/repo/experiance/experience_repo_impl.dart';

class AddExperienceUsecase implements Usecase<AddExperienceEntity,AddExperienceParams> {

  final ExperienceRepo repo = ExperienceRepoImpl(
      experienceLocalDataSource: ExperienceLocalDataSourceImpl(),
      experienceRemoteDataSource: ExperienceRemoteDataSourceImpl(),
      networkInfo: NetworkInfoImpl(),
      authLocalDataSource: AuthLocalDataSourceImpl()
  );

  @override
  Future<Either<Failure, AddExperienceEntity>> call(AddExperienceParams params) {
    return repo.addExperience(
        postion: params.postion,
        typeWork: params.typeWork,
        compName: params.compName,
        location: params.location,
        start: params.start);
  }


}

class AddExperienceParams {
  String postion;
  String typeWork;
  String compName;
  String location;
  String start;

  AddExperienceParams({
    required this.postion,
    required this.typeWork,
    required this.compName,
    required this.location,
    required this.start
  });
}