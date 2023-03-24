import 'package:dio/dio.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/data/models/profile/edit_profile_bio_model.dart';
import '../../../models/profile/edit_profile_language_model.dart';
import '../../../models/profile/edit_profile_intersted_work_model.dart';

abstract class ProfileRemoteDataSource {

  Future<ProfileInterstedWorkModel> editProfileInterstedWork({
    String? interstedWork,
    String? offlinePlace,
    String? remotePlace,
    required int id,
    required String token,
  });

  Future<ProfileBioModel> editProfileBio({
    String? bio,
    String? address,
    String? mobile,
    required int id,
    required String token,
  });

  Future<ProfileLanguageModel> editProfileLanguage({
    String? language,
    required int id,
    required String token,
  });

}


class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {

  final Dio _client = Dio();
  final String _baseUrl = AppConsts.baseUrl;

  ProfileRemoteDataSourceImpl();

  @override
  Future<ProfileInterstedWorkModel> editProfileInterstedWork({
    String? interstedWork = "",
    String? offlinePlace = "",
    String? remotePlace = "",
    required int id,
    required String token,
  }) async {

    Map<String,dynamic> data = {
      "intersted_work": interstedWork,
      "offline_place": offlinePlace,
      "remote_place": remotePlace,
    };

    _client.options.headers = {
      'Authorization': 'Bearer $token',
    };

    Response response = await _client.put(
      _baseUrl+AppConsts.editProfileInterstedWorkEndPoint(id),
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
    return ProfileInterstedWorkModel.fromJson(response.data);

  }

  @override
  Future<ProfileBioModel> editProfileBio({
    String? bio = "",
    String? address = "",
    String? mobile = "",
    required int id,
    required String token}) async {

    Map<String,dynamic> data = {
      "bio": bio,
      "address": address,
      "mobile": mobile,
    };

    _client.options.headers = {
      'Authorization': 'Bearer $token',
    };

    Response response = await _client.put(
      _baseUrl+AppConsts.editProfileBioEndPoint(id),
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
    return ProfileBioModel.fromJson(response.data);
  }

  @override
  Future<ProfileLanguageModel> editProfileLanguage({
    String? language,
    required int id,
    required String token}) async {

    Map<String,dynamic> data = {
      "language": language,
    };

    _client.options.headers = {
      'Authorization': 'Bearer $token',
    };

    Response response = await _client.put(
      _baseUrl+AppConsts.editProfileLanguageEndPoint(id),
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
    return ProfileLanguageModel.fromJson(response.data);
  }


}
