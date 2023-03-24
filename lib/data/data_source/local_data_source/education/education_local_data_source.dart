import 'package:jobs_que/domain/entities/education/add_education_entity.dart';

import '../../../../core/config/app_const.dart';
import '../../../models/education/get_education_model.dart';
import '../database/dao/education_dao.dart';
import '../database/database.dart';

abstract class EducationLocalDataSource {

  Future<GetEducationModel> showEducation();

  Future<void> clearEducation();

  Future<void> setEducation(List<Education>? educations);

}

class EducationLocalDataSourceImpl implements EducationLocalDataSource {
  late AppDatabase database;

  EducationLocalDataSourceImpl();

  initDB() async {
    database = await $FloorAppDatabase
        .databaseBuilder(AppConsts.sqfLiteDbName)
        .build();
  }

  EducationDao get educationDao => database.educationDao;

  @override
  Future<GetEducationModel> showEducation() async {
    var education = await educationDao.getAllEducation();
    GetEducationModel model = GetEducationModel(true, education);
    return model;
  }

  @override
  Future<void> clearEducation() async {
    educationDao.deleteAllEducation();
  }

  @override
  Future<void> setEducation(List<Education>? educations) async {
    if(educations == null) return ;
    for(int i = 0; i < educations.length ; ++i){
      educationDao.insertEducation(educations[i]);
    }
  }
}
