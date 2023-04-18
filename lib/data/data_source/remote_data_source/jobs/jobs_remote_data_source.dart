import 'package:dio/dio.dart';
import 'package:jobs_que/data/models/jobs/add_favorite_model.dart';
import 'package:jobs_que/data/models/jobs/all_favorite_model.dart';
import 'package:jobs_que/data/models/jobs/filter_search_model.dart';
import 'package:jobs_que/data/models/jobs/recent_jobs_model.dart';
import 'package:jobs_que/data/models/jobs/suggested_jobs_model.dart';

import '../../../../core/config/app_const.dart';
import '../../../models/jobs/search_job_model.dart';


abstract class JobsRemoteDataSource {

  Future<RecentJobsModel> getRecentJobs({required String token});

  Future<SuggestedJobsModel> getSuggestedJobs({required int id,required String token});

  Future<SearchJobsModel> getSearchJobs({required String token,required String search});

  Future<FilterSearchModel> filterFavoriteJob({required String search,required String location,required String salary,required String token});

  Future<AddFavoriteModel> addFavoriteJob({required int userId,required int jobId,required String token});

  Future<AllFavoriteJobsModel> getAllFavoriteJobs({required int id,required String token});

}

class JobsRemoteDataSourceImpl extends JobsRemoteDataSource{
  final Dio _client = Dio();
  final String _baseUrl = AppConsts.baseUrl;

  JobsRemoteDataSourceImpl();

  @override
  Future<RecentJobsModel> getRecentJobs({required String token}) async {
    _client.options.headers = {
      'Authorization': 'Bearer $token',
    };
    Response response = await _client.get(
      _baseUrl+AppConsts.recentJobEndPoint,
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
    return RecentJobsModel.fromJson(response.data);
  }

  @override
  Future<SuggestedJobsModel> getSuggestedJobs({required int id, required String token}) async {
    _client.options.headers = {
      'Authorization': 'Bearer $token',
    };
    Response response = await _client.get(
      _baseUrl+AppConsts.suggestedJobEndPoint(id),
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
    return SuggestedJobsModel.fromJson(response.data);
  }

  @override
  Future<SearchJobsModel> getSearchJobs({required String token, required String search}) async {

    Map<String,dynamic> data = {
      "name": search
    };

    _client.options.headers = {
      'Authorization': 'Bearer $token',
    };
    Response response = await  _client.get(
        _baseUrl+AppConsts.searchJobEndPoint,
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
    return SearchJobsModel.fromJson(response.data);
  }

  @override
  Future<AddFavoriteModel> addFavoriteJob({required int userId, required int jobId, required String token}) async {
    Map<String,dynamic> data = {
      "user_id": userId,
      "job_id": jobId,
    };

    _client.options.headers = {
      'Authorization': 'Bearer $token',
    };
    Response response = await  _client.post(
      _baseUrl+AppConsts.addFavoriteEndPoint,
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
    return AddFavoriteModel.fromJson(response.data);
  }

  @override
  Future<FilterSearchModel> filterFavoriteJob({required String search,required String location,required String salary,required String token}) async {
    Map<String,dynamic> data = {
      "name": search,
      "location": location,
      "salary": salary,
    };

    _client.options.headers = {
      'Authorization': 'Bearer $token',
    };

    Response response = await  _client.get(
      _baseUrl+AppConsts.filterEndPoint,
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
    return FilterSearchModel.fromJson(response.data);
  }

  @override
  Future<AllFavoriteJobsModel> getAllFavoriteJobs({required int id, required String token}) async {
    _client.options.headers = {
      'Authorization': 'Bearer $token',
    };

    Response response = await  _client.get(
      _baseUrl+AppConsts.allFavoriteEndPoint(id),
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
    return AllFavoriteJobsModel.fromJson(response.data);
  }

}