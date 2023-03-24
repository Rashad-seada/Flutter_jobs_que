import 'package:dio/dio.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/data/models/auth/login_model.dart';
import 'package:jobs_que/data/models/auth/my_profile_model.dart';
import 'package:jobs_que/data/models/auth/otp_model.dart';
import 'package:jobs_que/data/models/auth/profile_model.dart';
import 'package:jobs_que/data/models/auth/registration_model.dart';

void main() async {
  AuthRemoteDataSourceImpl dataSourceImpl = AuthRemoteDataSourceImpl(client: Dio(), baseUrl: AppConsts.baseUrl);
  var r = await dataSourceImpl.register(name: '', email: '', password: '',);
  print(r);
}

abstract class AuthRemoteDataSource {

  Future<RegistrationModel> register({
    required String name,
    required String email,
    required String password,
  });

  Future<LoginModel> login({
    required String email,
    required String password,
  });

  Future<OtpModel> getOtp({
    required String email,
    required String token,
  });

  Future<ProfileModel> getUserProfile({
    required int id,
    required String token,
  });

  Future<MyProfileModel> getMyProfile({
    required int id,
    required String token,
  });


}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  Dio _client;
  String _baseUrl;
  AuthRemoteDataSourceImpl({required Dio client,required String baseUrl}) : _baseUrl = baseUrl, _client = client;

  @override
  Future<RegistrationModel> register({
    required String name,
    required String email,
    required String password}) async {

    Map<String,dynamic> data = {
      "name": name,
      "email": email,
      "password": password,
    };

    Response response = await _client.post(
        _baseUrl+AppConsts.registerEndPoint,
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
    return RegistrationModel.fromJson(response.data);
  }

  @override
  Future<LoginModel> login({
    required String email,
    required String password}) async {

    Map<String,dynamic> data = {
      "email": email,
      "password": password,
    };

    Response response = await _client.post(
        _baseUrl+AppConsts.loginEndPoint,
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
    return LoginModel.fromJson(response.data);
  }

  @override
  Future<OtpModel> getOtp({
    required String email,
    required String token}) async {

    _client.options.headers = {
      'Authorization': 'Bearer $token',
    };
    Response response = await _client.get(
      _baseUrl+AppConsts.otpEndPoint(email),
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
    return OtpModel.fromJson(response.data);
  }

  @override
  Future<MyProfileModel> getMyProfile({
    required int id,
    required String token}) async {

    _client.options.headers = {
      'Authorization': 'Bearer $token',
    };
    Response response = await _client.put(
      _baseUrl+AppConsts.myProfileEndPoint(id),
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
    return MyProfileModel.fromJson(response.data);
  }

  @override
  Future<ProfileModel> getUserProfile({
    required int id,
    required String token}) async {

    _client.options.headers = {
      'Authorization': 'Bearer $token',
    };
    Response response = await _client.get(
      _baseUrl+AppConsts.userProfileEndPoint(id),
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
    return ProfileModel.fromJson(response.data);
  }


}



