import 'package:dartz/dartz.dart';
import 'package:jobs_que/domain/entities/jobs/add_favorite_entity.dart';
import 'package:jobs_que/domain/entities/jobs/all_favorite_jobs_entity.dart';
import 'package:jobs_que/domain/entities/jobs/recent_jobs_entity.dart';
import 'package:jobs_que/domain/entities/jobs/suggested_jobs_entity.dart';

import '../../../core/error/failure.dart';
import '../../entities/jobs/search_jobs_entity.dart';

abstract class JobsRepo {

  Future<Either<Failure,RecentJobsEntity>> getRecentJobs();

  Future<Either<Failure,SuggestedJobsEntity>> getSuggestedJobs();

  Future<Either<Failure,SearchJobsEntity>> getSearchJobs({required String search});

  Future<Either<Failure,AddFavoriteJobEntity>> addFavoriteJobs({required int jobId});

  Future<Either<Failure,AllFavoriteJobsEntity>> getFavoriteJobs();

}