
import '../../../../core/config/app_const.dart';

abstract class AuthLocalDataSource {

  Future<void> setUserName(String userName);
  Future<String?> get getUserName;

  Future<void> setEmail(String email);
  Future<String?> get getEmail;

  Future<void> setOtp(int otp);
  Future<int?> get getOtp;

  Future<void> setId(int id);
  Future<int?> get getId;

  Future<void> setToken(String token);
  Future<String?> get getToken;

}


class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl(this.sharedPreferences);


  @override
  Future<String?> get getEmail async => sharedPreferences.getString(AppConsts.emailKey);

  @override
  Future<int?> get getId async => sharedPreferences.getInt(AppConsts.idKey);

  @override
  Future<int?> get getOtp async => sharedPreferences.getInt(AppConsts.otpKey);

  @override
  Future<String?> get getToken async => sharedPreferences.getString(AppConsts.tokenKey);

  @override
  Future<String?> get getUserName async => sharedPreferences.getString(AppConsts.userNameKey);

  @override
  Future<void> setEmail(String email) async {
    await sharedPreferences.setString(AppConsts.emailKey, email);
  }

  @override
  Future<void> setId(int id) async {
    await sharedPreferences.setInt(AppConsts.idKey, id);
  }

  @override
  Future<void> setOtp(int otp) async {
    await sharedPreferences.setInt(AppConsts.otpKey, otp);
  }

  @override
  Future<void> setToken(String token) async {
    await sharedPreferences.setString(AppConsts.tokenKey, token);
  }

  @override
  Future<void> setUserName(String userName) async {
    await sharedPreferences.setString(AppConsts.userNameKey, userName);
  }

}