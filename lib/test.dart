import 'package:dio/dio.dart';
import 'package:jobs_que/core/config/app_const.dart';

import 'data/data_source/remote_data_source/auth/auth_remote_data_source.dart';

void main() async {

  AuthRemoteDataSourceImpl remotDataSourceImpl =
  AuthRemoteDataSourceImpl(client:Dio(),baseUrl:AppConsts.baseUrl);
  await remotDataSourceImpl.register(
      name:"AhmedEzzat1wq1",
      email: "AhmedEzzat1121@gmail.com",
      password: "AhmedEzzat11"
  ).then((value) => print(value.status));

}