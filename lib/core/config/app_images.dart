
class AppImages {


  static const String arrow = "images/arrow.svg";
  static const String logo = "images/logo.svg";
  static const String google = "images/google.svg";
  static const String facebook = "images/facebook.svg";
  static const String saudi = "images/saudi.svg";

  static const String firstOnBoardingBackground = "images/first_on_boarding_background.svg";
  static const String secondOnBoardingBackground = "images/second_on_boarding_background.svg";
  static const String thirdOnBoardingBackground = "images/third_on_boarding_background.svg";

  static const String splashBackground = "images/splash_background.svg";

  static const String emailSent  = "images/email_illustration.svg";
  static const String passwordResetSuccessfully  = "images/password_successfully_illustration.svg";
  static const String accountCreatedSuccessfully = "images/success_account_illustration.svg";


  static String profileIcon({required bool active}){
    if(active) return "images/profile_active.svg";
    return "images/profile_inactive.svg";
  }

  static String emailIcon({required bool active}){
    if(active) return "images/sms_active.svg";
    return "images/sms_inactive.svg";
  }

  static String lockIcon({required bool active}){
    if(active) return "images/lock_active.svg";
    return "images/lock_inactive.svg";
  }

  static String eyeIcon({required bool active}){
    if(active) return "images/eye_active.svg";
    return "images/eye_inactive.svg";
  }



  static String appliedNavIcon({required bool active}){
    if(active) return "images/applied_active.svg";
    return "images/applied_inactive.svg";
  }

  static String homeNavIcon({required bool active}){
    if(active) return "images/home_active.svg";
    return "images/home_inactive.svg";
  }

  static String messageNavIcon({required bool active}){
    if(active) return "images/message_active.svg";
    return "images/message_inactive.svg";
  }

  static String savedNavIcon({required bool active}){
    if(active) return "images/saved_active.svg";
    return "images/saved_inactive.svg";
  }

  static String profileNavIcon({required bool active}){
    if(active) return "images/profile_bold.svg";
    return "images/profile_inactive.svg";
  }

}