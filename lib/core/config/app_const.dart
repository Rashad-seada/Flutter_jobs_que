class AppConsts {

  static const double appbarSpace = 2;
  static const double headTextSize = 24;
  static const double subHeadTextSize = 21;
  static const double textSize = 11;
  static const double subTextSize = 10;

  static const String prefDbName = "app_db";
  static const String sqfLiteDbName = "app_database.db";

  static const String profileKey = "profile";
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
  static String editProfileInterstedWorkEndPoint(int id) => "user/profile/$id";
  static const String recentJobEndPoint = "jobs";
  static String suggestedJobEndPoint(int id) => "jobs/sugest/$id";
  static const String searchJobEndPoint = "jobs/search";
  static const String filterEndPoint = "jobs/filter";
  static const String applyEndPoint = "apply";
  static const String addFavoriteEndPoint = "favorites";
  static String allFavoriteEndPoint(int id) => "favorites/$id";
  static String editProfileBioEndPoint(int id) => "user/profile/edit/$id";
  static String editProfileLanguageEndPoint(int id) => "user/profile/language/$id";
  static const String addEducationEndPoint = "education";
  static String showEducationEndPoint(int id) => "education/$id";
  static const String addExperienceEndPoint = "experince";



}