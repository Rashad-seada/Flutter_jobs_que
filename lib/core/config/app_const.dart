class AppConsts {

  static const double appbarSpace = 2;
  static const double headTextSize = 24;
  static const double subHeadTextSize = 21;
  static const double textSize = 11;
  static const double subTextSize = 10;

  static const String emailKey = "EMAIL";
  static const String userNameKey = "USERNAME";
  static const String idKey = "ID";
  static const String tokenKey = "TOKEN";
  static const String otpKey = "OTP";

  static const String baseUrl = "http://134.209.132.80/api/";
  static const String registerEndPoint = "auth/register";
  static const String loginEndPoint = "auth/login";
  static String otpEndPoint(String email) => "auth/otp/$email";
  static String myProfileEndPoint(int id) => "user/profile/$id";
  static String userProfileEndPoint(int id) => "auth/profile/$id";



}