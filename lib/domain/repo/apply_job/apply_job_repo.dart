import 'package:dartz/dartz.dart';
import 'package:jobs_que/domain/entities/apply_job/apply_job_entity.dart';

import '../../../core/error/failure.dart';

abstract class ApplyJobRepo {

  Future<Either<Failure,ApplyJobEntity>> applyForJob({
    required String cvFile,
    required String name,
    required String email,
    required String mobile,
    required String workType,
    required String otherFile,
    required int jobId,
  });


}