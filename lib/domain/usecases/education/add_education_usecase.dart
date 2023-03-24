import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/core/network/network.dart';
import 'package:jobs_que/core/usecase/usecase.dart';
import 'package:jobs_que/domain/entities/education/add_education_entity.dart';

import '../../../data/data_source/local_data_source/auth/auth_local_data_source.dart';
import '../../../data/data_source/local_data_source/education/education_local_data_source.dart';
import '../../../data/data_source/remote_data_source/education/education_remote_data_source.dart';
import '../../../data/repo/education/education_repo_impl.dart';
import '../../repo/education/education_repo.dart';

class AddEducationUsecase implements Usecase<AddEducationEntity,AddEducationParams> {
  final EducationRepo repo = EducationRepoImpl(
      educationRemoteDataSource: EducationRemoteDataSourceImpl(),
      educationLocalDataSource: EducationLocalDataSourceImpl(),
      networkInfo: NetworkInfoImpl(),
      authLocalDataSource: AuthLocalDataSourceImpl(),
  );

  AddEducationUsecase();

  @override
  Future<Either<Failure, AddEducationEntity>> call(AddEducationParams params)
  async {
    return await repo.addEducation(universty: params.universty, title: params.title, start: params.start, end: params.end);
  }

}


class AddEducationParams {
  String universty;
  String title;
  String start;
  String end;

  AddEducationParams({
    required this.universty,
    required this.title,
    required this.start,
    required this.end
  });


}
