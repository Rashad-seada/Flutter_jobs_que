import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/config/app_const.dart';
import '../../../../domain/entities/profile/profile_intersted_work_entity.dart';

abstract class ProfileLocalDataSource {

  Future<void> setProfile(Profile? profile);

  Future<Profile> get getProfile;
}

class ProfileLocalDataSourceImpl extends ProfileLocalDataSource{

  ProfileLocalDataSourceImpl();

  dbInit() async {
    await Hive.initFlutter();
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);

    if(Hive.isBoxOpen(AppConsts.prefDbName) == false){
      Box db = await Hive.openBox(AppConsts.prefDbName);
    }
  }

  Box get _instance {
    dbInit();
    return Hive.box(AppConsts.prefDbName);
  }

  @override
  Future<Profile> get getProfile  => _instance.get(AppConsts.profileKey);


  @override
  Future<void> setProfile(Profile? profile) {
    return _instance.put(AppConsts.profileKey, profile);
  }

}