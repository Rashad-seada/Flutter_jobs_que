import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/data/data_source/local_data_source/auth/auth_local_data_source.dart';
import 'package:jobs_que/data/data_source/remote_data_source/profile/profile_remote_data_source.dart';
import 'package:jobs_que/domain/entities/profile/profile_intersted_work_entity.dart';

import '../../../core/network/network.dart';
import '../../../core/usecase/usecase.dart';
import '../../../data/data_source/local_data_source/profile/profile_local_data_source.dart';
import '../../../data/repo/profile/profile_repo_impl.dart';
import '../../repo/profile/profile_repo.dart';

class EditProfileInterstedWorkUsecase implements Usecase<ProfileInterstedWorkEntity,ProfileInterstedWorkParams> {
  ProfileRepo repo = ProfileRepoImpl(
      profileRemoteDataSource: ProfileRemoteDataSourceImpl(),
      profileLocalDataSource: ProfileLocalDataSourceImpl(),
      networkInfo: NetworkInfoImpl(),
      authLocalDataSource: AuthLocalDataSourceImpl()
  );

  @override
  Future<Either<Failure, ProfileInterstedWorkEntity>> call(ProfileInterstedWorkParams params) async {
    return await repo.editProfileInterstedWork(interstedWork: params.interstedWork, offlinePlace: params.offlinePlace, remotePlace: params.remotePlace);
  }

}

class ProfileInterstedWorkParams {
  String interstedWork;
  String offlinePlace;
  String remotePlace;

  ProfileInterstedWorkParams(
      {required this.interstedWork,required this.offlinePlace,required this.remotePlace});
}
