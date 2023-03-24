import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/domain/entities/profile/profile_bio_entity.dart';
import 'package:jobs_que/domain/entities/profile/profile_intersted_work_entity.dart';
import 'package:jobs_que/domain/entities/profile/profile_language_entity.dart';

abstract class ProfileRepo {

  Future<Either<Failure,ProfileInterstedWorkEntity>> editProfileInterstedWork({
    required String interstedWork,
    required String offlinePlace,
    required String remotePlace,
  });

  Future<Either<Failure,ProfileBioEntity>> editProfileBio({
    required String bio,
    required String address,
    required String mobile,
  });

  Future<Either<Failure,ProfileLanguageEntity>> editProfileLanguage({
    required String language,
  });

}