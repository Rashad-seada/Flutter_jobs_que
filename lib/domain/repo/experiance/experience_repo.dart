import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';

import '../../entities/experiance/add_experiance_entity.dart';

abstract class ExperienceRepo {

  Future<Either<Failure,AddExperienceEntity>> addExperience({
    required String postion,
    required String typeWork,
    required String compName,
    required String location,
    required String start,
  });

}