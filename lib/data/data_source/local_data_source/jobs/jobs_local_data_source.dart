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
  Future<AppDatabase> get database async => await dbInit();

  JobsLocalDataSourceImpl();

  Future<AppDatabase> dbInit() async {
    return await $FloorAppDatabase
        .databaseBuilder(AppConsts.sqfLiteDbName)
        .build();
  }

  Future<RecentJobDao> get recentJobDao => database.then((value) => value.recentJobDao);

  Future<SuggestedJobDao> get suggestedJobDao => database.then((value) => value.suggestedJobDao);

  Future<FavoriteJobDao> get favoriteJobDao => database.then((value) => value.favoriteJobDao);

  @override
  Future<RecentJobsModel> getRecentJobs() async {
    var recentJobs = await recentJobDao.then((value) => value.getAllJobs());
    RecentJobsModel model = RecentJobsModel(true, recentJobs);
    return model;
  }

  @override
  Future<SuggestedJobsModel> getSuggestedJobs() async {
    var suggestedJob = await suggestedJobDao.then((value) => value.getAllJobs());
    SuggestedJobsModel model = SuggestedJobsModel(true, suggestedJob);
    return model;
  }

  @override
  Future<void> setRecentJobs(List<RecentJob>? jobs) async {
    if(jobs == null) return ;
    for (int i = 0; i < jobs.length; ++i) {
      await recentJobDao.then((value) => value.insertJob(jobs[i]));
    }
  }

  @override
  Future<void> setSuggestedJobs(List<SuggestedJob>? jobs) async {
    if(jobs == null) return ;
    for (int i = 0; i < jobs.length; ++i) {
      await suggestedJobDao.then((value) => value.insertJob(jobs[i]));
    }
  }

  @override
  Future<void> clearRecentJobs() async {
    recentJobDao.then((value) => value.deleteAllJobs());
  }

  @override
  Future<void> clearSuggestedJobs() async {
    suggestedJobDao.then((value) => value.deleteAllJobs());
  }

  @override
  Future<void> clearFavoriteJobs() async {
    favoriteJobDao.then((value) => value.deleteAllJobs());
  }

  @override
  Future<AllFavoriteJobsModel> getFavoriteJobs() async {
    var favoriteJobs = await favoriteJobDao.then((value) => value.getAllJobs());
    AllFavoriteJobsModel model = AllFavoriteJobsModel(true, favoriteJobs);
    return model;
  }

  @override
  Future<void> setFavoriteJobs(List<FavoriteJob>? jobs) async {
    if(jobs == null) return ;
    for (int i = 0; i < jobs.length; ++i) {
      await favoriteJobDao.then((value) => value.insertJob(jobs[i]));
    }
  }
}
