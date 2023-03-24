import 'package:floor/floor.dart';
import '../../../../../domain/entities/jobs/all_favorite_jobs_entity.dart';

@dao
abstract class FavoriteJobDao {
  @Query('SELECT * FROM FavoriteJob')
  Future<List<FavoriteJob>> getAllJobs();

  @Query('SELECT * FROM FavoriteJob WHERE id = :id')
  Stream<FavoriteJob?> getJobById(int id);

  @insert
  Future<void> insertJob(FavoriteJob jobs);

  @Query('DELETE FROM RecentJob')
  Future<void> deleteAllJobs();

  @update
  Future<void> updateJob(FavoriteJob jobs);
}