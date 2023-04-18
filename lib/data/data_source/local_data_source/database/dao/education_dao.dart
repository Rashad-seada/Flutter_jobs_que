import 'package:floor/floor.dart';
import '../../../../../domain/entities/education/add_education_entity.dart';

@dao
abstract class EducationDao {
  @Query('SELECT * FROM Education')
  Future<List<Education>> getAllEducation();

  @Query('SELECT * FROM Education WHERE id = :id')
  Stream<Education?> getEducationById(int id);

  @insert
  Future<void> insertEducation(Education jobs);

  @Query('DELETE FROM Education')
  Future<void> deleteAllEducation();

  @update
  Future<void> updateJob(Education jobs);
}