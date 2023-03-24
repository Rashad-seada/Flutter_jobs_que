import 'dart:async';
import 'package:floor/floor.dart';
import 'package:jobs_que/domain/entities/education/add_education_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../../../domain/entities/jobs/recent_jobs_entity.dart';
import '../../../../../domain/entities/jobs/suggested_jobs_entity.dart';
import '../../../../domain/entities/jobs/all_favorite_jobs_entity.dart';
import 'dao/education_dao.dart';
import 'dao/favorite_job_dao.dart';
import 'dao/recent_job_dao.dart';
import 'dao/suggested_job_dao.dart';


part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [RecentJob,SuggestedJob,FavoriteJob,Education])
abstract class AppDatabase extends FloorDatabase {
  RecentJobDao get recentJobDao;
  SuggestedJobDao get suggestedJobDao;
  FavoriteJobDao get favoriteJobDao;
  EducationDao get educationDao;

}
