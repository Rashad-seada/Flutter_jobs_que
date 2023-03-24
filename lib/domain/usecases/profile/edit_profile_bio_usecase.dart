import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/data/data_source/local_data_source/auth/auth_local_data_source.dart';
import 'package:jobs_que/data/data_source/remote_data_source/profile/profile_remote_data_source.dart';
import 'package:jobs_que/domain/entities/profile/profile_bio_entity.dart';

import '../../../core/network/network.dart';
import '../../../core/usecase/usecase.dart';
import '../../../data/data_source/local_data_source/profile/profile_local_data_source.dart';
import '../../../data/repo/profile/profile_repo_impl.dart';
import '../../repo/profile/profile_repo.dart';

class EditProfileBioUsecase implements Usecase<ProfileBioEntity,ProfileBioParams> {
  ProfileRepo repo = ProfileRepoImpl(
      profileRemoteDataSource: ProfileRemoteDataSourceImpl(),
      profileLocalDataSource: ProfileLocalDataSourceImpl(),
      networkInfo: NetworkInfoImpl(),
      authLocalDataSource: AuthLocalDataSourceImpl()
  );

  @override
  Future<Either<Failure, ProfileBioEntity>> call(ProfileBioParams params) async {
    return await repo.editProfileBio(bio: params.bio, address: params.address, mobile: params.mobile);
  }

}

class ProfileBioParams {
  String bio;
  String address;
  String mobile;

  ProfileBioParams({required this.bio,required this.address,required this.mobile});
}
