import 'package:dartz/dartz.dart';
import 'package:jobs_que/core/error/failure.dart';
import 'package:jobs_que/domain/entities/education/add_education_entity.dart';

import '../../entities/education/get_education_entity.dart';

abstract class EducationRepo {

  Future<Either<Failure,GetEducationEntity>> getAllEducation();

  Future<Either<Failure,AddEducationEntity>> addEducation({
    required String universty,
    required String title,
    required String start,
    required String end,

  });

}