
class  AppStrings {


  //on boarding Strings
  //
  //>> screen 1
  static const String skip = "Skip";
  static const String onBoardingFirstHeadText = "Find a job, and start building your career from now on";
  static const String onBoardingFirstBodyText = "Explore over 25,924 available job roles and upgrade your operator now.";
  //>> screen 2
  static const String onBoardingSecondHeadText = "Hundreds of jobs are waiting for you to join together";
  static const String onBoardingSecondBodyText = "Immediately join us and start applying for the job you are interested in.";
  //>> screen 3
  static const String getStarted = "Get Started";
  static const String onBoardingThirdHeadText = "Get the best choice for the job you've always dreamed of";
  static const String onBoardingThirdBodyText = "The better the skills you have, the greater the good job opportunities for you.";


  //creating account Strings
  //
  //>> screen 1
  static String enterAValid(String text) {
    return "please enter a valid $text";
  }
  static String enterYour(String text) {
      return "Enter your $text";
  }
  static const String createAccountFirstHeadText = "Create Account";
  static const String createAccountFirstBodyText1 = "Please create an account to find your dream job";
  static const String createAccountFirstBodyText2 = "Password must be at least 8 characters";
  static const String username = "Username";
  static const String email = "Email";
  static const String password = "Password";
  static const String login = "Login";
  static const String createAccountFirstBodyText3 = "Or Sign up With Account";
  static const String createAccountFirstBodyText4 = "Already have an account?";
  static const String google = "Google";
  static const String facebook = "Facebook";
  //>> screen 2
  static const String createAccountSecondHeadText = "What type of work are you interested in?";
  static const String createAccountSecondBodyText = "Tell us what you’re interested in so we can customise the app for your needs.";
  static const String next = "Next";
  //>> screen 3
  static const String createAccountThirdHeadText = "Where are you preferred Location?";
  static const String createAccountThirdBodyText1 = "Let us know, where is the work location you want at this time, so we can adjust it.";
  static const String createAccountThirdOption1 = "Work From Office";
  static const String createAccountThirdOption2 = "Remote Work";
  static const String createAccountThirdBodyText2 = "Select the country you want for your job";
  //>> screen 4
  static const String createAccountFourthHeadText = "Your account has been set up!";
  static const String createAccountFourthBodyText1 = "We have customized feeds according to your preferences";
  static const String createAccountFourthBodyText2 = "Get Started";


  //sign in Strings
  //
  //>> screen 1
  static const String signUp = "Sign up";
  static const String signInBodyText1 = "Please login to find your dream job";
  static const String signInBodyText2 = "Remember me";
  static const String signInBodyText3 = "Forgot Password?";
  static const String signInBodyText4 = "Don’t have an account?";
  static const String signInBodyText5 = "Or Login With Account";


  //forget password Strings
  //
  //>> screen 1
  static const String forgetPasswordFirstHeadText = "Reset Password";
  static const String forgetPasswordFirstBodyText1 = "Enter the email address you used when you joined and we’ll send you instructions to reset your password.";
  static const String forgetPasswordFirstBodyText2 = "Enter your email....";
  static const String forgetPasswordFirstBodyText3 = "You remember your password";
  static const String forgetPasswordFirstBodyText4 = "Request password reset";
  //>> screen 2
  static const String forgetPasswordSecondHeadText = "Check your Email";
  static const String forgetPasswordSecondBodyText = "We have sent a reset password to your email address";
  //>> screen 3
  static const String code = "CODE";
  static const String pinHeadText = "Verification";
  static String pinSubText(String email) {
    return "Enter the code that has been sent to $email";
  }
  static const String didntReciveIt = "didn't receive code?";
  static const String resendCode = "Resend code";


  //>> screen 4
  static const String forgetPasswordThirdHeadText = "Create new password";
  static const String forgetPasswordThirdBodyText1 = "Set your new password so you can login and access Jobsque";
  static const String forgetPasswordThirdBodyText2 = "Enter a new password";
  static const String forgetPasswordThirdBodyText3 = "Password must be at least 8 characters";
  static const String forgetPasswordThirdBodyText4 = "Re-enter the new password";
  static const String forgetPasswordThirdBodyText5 = "Both password must match";
  static const String forgetPasswordThirdBodyText6 = "Reset password";
  static const String forgetPasswordThirdBodyText7 = "Passwords must match";
  //>> screen 4
  static const String forgetPasswordFourthHeadText = "Password changed successfully!";
  static const String forgetPasswordFourthBodyText1 = "Your password has been changed successfully, we will let you know if there are more problems with your account";
  static const String done = "Done";

  //main main_layout Strings
  static const String home = "Home";
  static const String messages = "Messages";
  static const String applied = "Applied";
  static const String saved = "Saved";
  static const String profile = "Profile";


  //home page
  static String homePageAppBarHead(String name) => "Hi,$name 👋";
  static const String homePageAppBarSubHead = "Create a better future for yourself here";
  static const String search = "Search....";
  static const String viewAll = "View all";
  static const String suggestedJobs = "Suggested Jobs";
  static const String recentJobs = "Recent Jobs";
  static const String fullTime = "Full-time";
  static const String remote = "Remote";
  static const String design = "Design";
  static const String month = "/Month";
  static const String applyNow = "Apply now";

  //search page
  static const String recentSearches = "Recent searches";
  static const String popularSearches = "Popular searches";
  static String featuringJobs(int numberOfJobs) => "Featuring $numberOfJobs+ jobs";

  //Job screen
  static const String jobDetail = "Job Detail";
  static const String description = "Description";
  static const String company = "Company";
  static const String people = "People";
  static const String jobDescription = "Job Description";
  static const String skillRequired = "Skill Required";
  static const String contactUs = "Contact Us";
  static const String aboutCompany = "About Company";
  static const String showLess = "Show less";
  static const String showMore = "Show more";
  static const String website = "Website";
  static String years(int numberOfYears) => "$numberOfYears years";
  static String employeesFor(int numberOfEmployers) =>  "$numberOfEmployers Employees For";
  static const String workDuring = "Work during";

}