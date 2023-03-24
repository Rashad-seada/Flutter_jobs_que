import 'package:dio/dio.dart';

import '../../../../core/config/app_const.dart';
import '../../../models/apply_job/apply_job_model.dart';

abstract class ApplyRemoteDataSource {

  Future<ApplyJobModel> applyForJob({
    required String cvFile,
    required String name,
    required String email,
    required String mobile,
    required String workType,
    required String otherFile,
    required int jobId,
    required int userId,
    required String token
  });

}


class ApplyRemoteDataSourceImpl implements ApplyRemoteDataSource{
  final Dio _client = Dio();
  final String _baseUrl = AppConsts.baseUrl;

  @override
  Future<ApplyJobModel> applyForJob({
    required String cvFile,
    required String name,
    required String email,
    required String mobile,
    required String workType,
    required String otherFile,
    required int jobId,
    required int userId,
    required String token
  }) async {

    Map<String,dynamic> data = {
      "cv_file":cvFile,
      "name":name,
      "email":email,
      "mobile":mobile,
      "work_type":workType,
      "other_file":otherFile,
      "job_id":"$jobId",
      "user_id":"$userId",
    };

    _client.options.headers = {
      'Authorization': 'Bearer $token',
    };

    Response response = await _client.post(
      _baseUrl+AppConsts.applyEndPoint,
      data: data,
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
    return ApplyJobModel.fromJson(response.data);
  }
  
}