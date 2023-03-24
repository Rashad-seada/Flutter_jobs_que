import 'package:jobs_que/data/data_source/local_data_source/database/database.dart';
import 'package:jobs_que/data/models/jobs/all_favorite_model.dart';
import 'package:jobs_que/data/models/jobs/recent_jobs_model.dart';
import 'package:jobs_que/data/models/jobs/suggested_jobs_model.dart';
import 'package:jobs_que/domain/entities/jobs/all_favorite_jobs_entity.dart';
import 'package:jobs_que/domain/entities/jobs/recent_jobs_entity.dart';

import '../../../../core/config/app_const.dart';
import '../../../../domain/entities/jobs/suggested_jobs_entity.dart';
import '../database/dao/favorite_job_dao.dart';
import '../database/dao/recent_job_dao.dart';
import '../database/dao/suggested_job_dao.dart';

abstract class JobsLocalDataSource {
  Future<RecentJobsModel> getRecentJobs();

  Future<void> clearRecentJobs();

  Future<void> setRecentJobs(List<RecentJob>? jobs);

  Future<SuggestedJobsModel> getSuggestedJobs();

  Future<void> clearSuggestedJobs();

  Future<void> setSuggestedJobs(List<SuggestedJob>? jobs);

  Future<AllFavoriteJobsModel> getFavoriteJobs();

  Future<void> clearFavoriteJobs();

  Future<void> setFavoriteJobs(List<FavoriteJob>? jobs);
}

class JobsLocalDataSourceImpl extends JobsLocalDataSource {
  late AppDatabase database;

  JobsLocalDataSourceImpl();

  dbInit() async {
    database = await $FloorAppDatabase
        .databaseBuilder(AppConsts.sqfLiteDbName)
        .build();
  }

  RecentJobDao get recentJobDao => database.recentJobDao;

  SuggestedJobDao get suggestedJobDao => database.suggestedJobDao;

  FavoriteJobDao get favoriteJobDao => database.favoriteJobDao;

  @override
  Future<RecentJobsModel> getRecentJobs() async {
    var recentJobs = await recentJobDao.getAllJobs();
    RecentJobsModel model = RecentJobsModel(true, recentJobs);
    return model;
  }

  @override
  Future<SuggestedJobsModel> getSuggestedJobs() async {
    var suggestedJob = await suggestedJobDao.getAllJobs();
    SuggestedJobsModel model = SuggestedJobsModel(true, suggestedJob);
    return model;
  }

  @override
  Future<void> setRecentJobs(List<RecentJob>? jobs) async {
    if(jobs == null) return ;
    for (int i = 0; i < jobs.length; ++i) {
      await recentJobDao.insertJob(jobs[i]);
    }
  }

  @override
  Future<void> setSuggestedJobs(List<SuggestedJob>? jobs) async {
    if(jobs == null) return ;
    for (int i = 0; i < jobs.length; ++i) {
      await suggestedJobDao.insertJob(jobs[i]);
    }
  }

  @override
  Future<void> clearRecentJobs() async {
    recentJobDao.deleteAllJobs();
  }

  @override
  Future<void> clearSuggestedJobs() async {
    suggestedJobDao.deleteAllJobs();
  }

  @override
  Future<void> clearFavoriteJobs() async {
    favoriteJobDao.deleteAllJobs();
  }

  @override
  Future<AllFavoriteJobsModel> getFavoriteJobs() async {
    var favoriteJobs = await favoriteJobDao.getAllJobs();
    AllFavoriteJobsModel model = AllFavoriteJobsModel(true, favoriteJobs);
    return model;
  }

  @override
  Future<void> setFavoriteJobs(List<FavoriteJob>? jobs) async {
    if(jobs == null) return ;
    for (int i = 0; i < jobs.length; ++i) {
      await favoriteJobDao.insertJob(jobs[i]);
    }
  }
}
