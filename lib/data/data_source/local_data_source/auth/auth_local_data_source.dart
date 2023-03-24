
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/config/app_const.dart';
import 'dart:async';


abstract class AuthLocalDataSource {

  Future<void> setUserName(String? userName);
  Future<String?> get getUserName;

  Future<void> setEmail(String? email);
  Future<String?> get getEmail;

  Future<void> setOtp(int? otp);
  Future<int?> get getOtp;

  Future<void> setId(int? id);
  Future<int?> get getId;

  Future<void> setToken(String? token);
  Future<String?> get getToken;

}


class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl();

  Future<Box> get db {
    return dbInit();
  }

  Future<Box> dbInit() async {
    await Hive.initFlutter();
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);

    if(Hive.isBoxOpen(AppConsts.prefDbName) == false){
      return await Hive.openBox(AppConsts.prefDbName);
    }
    return await Hive.openBox(AppConsts.prefDbName);
  }

  Future<Box> get instance async {
    return await db;
  }

  @override
  Future<String?> get getEmail async => await instance.then((value) => value.get(AppConsts.emailKey));

  @override
  Future<int?> get getId async => await instance.then((value) => value.get(AppConsts.idKey));

  @override
  Future<int?> get getOtp async => await instance.then((value) => value.get(AppConsts.otpKey));

  @override
  Future<String?> get getToken async => await instance.then((value) => value.get(AppConsts.tokenKey));

  @override
  Future<String?> get getUserName async => await  instance.then((value) => value.get(AppConsts.userNameKey));

  @override
  Future<void> setEmail(String? email) async {
    await instance.then((value) {
      value.put(AppConsts.emailKey, email);
      value.flush();
    });
  }

  @override
  Future<void> setId(int? id) async {
    await instance.then((value) {
      value.put(AppConsts.idKey, id);
      value.flush();
    });
  }

  @override
  Future<void> setOtp(int? otp) async {
    await instance.then((value) {
      value.put(AppConsts.otpKey, otp);
      value.flush();
    });
  }

  @override
  Future<void> setToken(String? token) async {
    await instance.then((value) {
      value.put(AppConsts.tokenKey, token);
      value.flush();
    });
  }

  @override
  Future<void> setUserName(String? userName) async {
    await instance.then((value) {
      value.put(AppConsts.userNameKey, userName);
      value.flush();
    });
  }

}


