
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

  static const String notification = "images/notification.svg";
  static const String search = "images/search.svg";

  static const String clock = "images/clock.svg";
  static const String delete = "images/delete.svg";
  static const String suggestions = "images/suggestions.svg";
  static const String enter = "images/enter.svg";
  static const String filter = "images/filter.svg";
  static const String clear = "images/clear.svg";
  static const String company = "images/company.svg";
  static const String profile = "images/profile.svg";
  static const String circleTick = "images/tick-circle.svg";
  static const String line = "images/Line.svg";
  static const String close = "images/close.svg";
  static const String edite = "images/edit.svg";
  static const String file = "images/file.svg";
  static const String fileUpload = "images/file_upload.svg";
  static const String upload = "images/upload.svg";
  static const String done = "images/data_illustration.svg";
  static const String more = "images/more.svg";
  static const String early = "images/early.svg";
  static const String rightArrow = "images/broken_arrow.svg";
  static const String applyJob = "images/apply_job.svg";
  static const String share = "images/share.svg";
  static const String send = "images/send.svg";
  static const String logout = "images/logout.svg";
  static const String profileBlue = "images/profile_blue.svg";
  static const String folderBlue = "images/folder_blue.svg";
  static const String languageBlue = "images/global_blue.svg";
  static const String notificationBlue = "images/notification_blue.svg";
  static const String loginAndSecurityBlue = "images/lock_blue.svg";
  static const String cameraWhite = "images/camera_white.svg";
  static const String arabic = "images/arabic.svg";
  static const String english = "images/english.svg";
  static const String security = "images/security.svg";
  static const String book = "images/book.svg";
  static const String circleTickGrey = "images/tick_circle_grey.svg";
  static const String calendar = "images/calendar.svg";
  static const String location = "images/location.svg";
  static const String education = "images/education.svg";
  static const String experience = "images/experience.svg";


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