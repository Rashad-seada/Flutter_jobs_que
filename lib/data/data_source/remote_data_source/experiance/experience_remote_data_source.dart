import 'package:dio/dio.dart';
import 'package:jobs_que/data/models/experiance/add_experiance_model.dart';

import '../../../../core/config/app_const.dart';
import '../../../../domain/entities/experiance/add_experiance_entity.dart';

abstract class ExperienceRemoteDataSource {

  Future<AddExperienceModel> addExperience({
    required int userId,
    required String postion,
    required String typeWork,
    required String compName,
    required String location,
    required String start,
    required String token,
  });

}

class ExperienceRemoteDataSourceImpl implements ExperienceRemoteDataSource {

  final Dio _client = Dio();
  final String _baseUrl = AppConsts.baseUrl;

  @override
  Future<AddExperienceModel> addExperience({
    required int userId,
    required String postion,
    required String typeWork,
    required String compName,
    required String location,
    required String start,
    required String token,
  }) async {

    Map<String,dynamic> data = {
      "user_id":userId,
      "postion":postion,
      "type_work":typeWork,
      "comp_name":compName,
      "location":location,
      "start":start,

    };

    _client.options.headers = {
      'Authorization': 'Bearer $token',
    };

    Response response = await _client.post(
      _baseUrl+AppConsts.addExperienceEndPoint,
      queryParameters: data,
      options: Options(
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status)=> true,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        receiveTimeout: const Duration(seconds: 60),
      ),
    );
    return AddExperienceModel.fromJson(response.data);
  }

}