import 'package:dio/dio.dart';
import 'package:jobs_que/data/models/education/get_education_model.dart';

import '../../../../core/config/app_const.dart';
import '../../../models/education/add_education_model.dart';

abstract class EducationRemoteDataSource {

  Future<AddEducationModel> addEducation({
    required String universty,
    required String title,
    required String start,
    required String end,
    required int userId,
    required String token,
  });

  Future<GetEducationModel> showEducation({
    required int userId,
    required String token,
  });

}

class EducationRemoteDataSourceImpl implements EducationRemoteDataSource {
  final Dio _client = Dio();
  final String _baseUrl = AppConsts.baseUrl;

  @override
  Future<AddEducationModel> addEducation({
    required String universty,
    required String title,
    required String start,
    required String end,
    required int userId,
    required String token}) async {

    Map<String,dynamic> data = {
      "universty":universty,
      "title":title,
      "start":start,
      "end":end,
      "id":userId,
    };

    _client.options.headers = {
      'Authorization': 'Bearer $token',
    };

    Response response = await _client.post(
      _baseUrl+AppConsts.addEducationEndPoint,
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
    return AddEducationModel.fromJson(response.data);
  }

  @override
  Future<GetEducationModel> showEducation({required int userId, required String token}) async {

    _client.options.headers = {
      'Authorization': 'Bearer $token',
    };

    Response response = await _client.get(
      _baseUrl+AppConsts.showEducationEndPoint(userId),
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
    return GetEducationModel.fromJson(response.data);
  }

}