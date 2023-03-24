
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
    return "Please confirm your account by entering the authorization code sen to ****-****-7234 $email";
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

  //apply job
  static const String applyJob = "Apply Job";
  static const String bioData = "Bio Data";
  static const String fillYourBio = "Fill in your bio data correctly";
  static const String answerFewQuestion = "Answer Few Question";
  static const String answerCorrectly = "Please answer theses Question Correctly";
  static const String uploadCv = "Upload CV";
  static const String pleaseUploadCv = "Please upload a CV that related to this job";

  static const String fullName = "Full name*";
  static const String enterFullName = "Enter full name";
  static const String enterEmail = "Enter email";
  static const String phone = "No.mobile-phone*";
  static const String enterPhone = "Enter phone number";
  static const String question = "Questions";
  static const String uploadedCv = "Uploaded CV*";
  static const String otherFiles = "Other Files*";
  static const String addFile = "Add File";
  static const String uploadYourOtherFile = "Upload your other file";
  static const String maxFileSize = "Max. file size 10 MB";
  static const String doneText = "Your data has been successfully sent";
  static const String doneBodyText = "You will get a message from our team, about the announcement of employee acceptance";

  //apply job
  static const String jobSaved = "Job Saved";
  static const String beAnEarly = "Be an early applicant";
  static  String postDaysAgo(int numberOfPosts) => "Posted $numberOfPosts days ago";
  static const String shareVia = "Share via...";
  static const String cancelSave = "Cancel save";

  //notification
  static const String notification = "Notification";
  static const String today = "Today";
  static const String yesterday = "Yesterday";


  //messages
  static const String unread = "Unread";
  static const String spam = "Spam";
  static const String archived = "Archived";
  static const String messageFilters = "Message filters";
  static const String all = "All Chats";
  static const String writeMessage = "Write a message...";

  //profile
  static const String reviewed = "Reviewed";
  static const String contacted = "Contacted";
  static const String about = "About";
  static const String edit = "Edit";
  static const String general = "General";
  static const String editProfile = "Edit Profile";
  static const String portfolio = "Portfolio";
  static const String language = "Language";
  static const String loginAndSecurity = "Login and security";
  static const String others = "Others";
  static const String accessibility = "Accessibility";
  static const String helpCenter = "Help Center";
  static const String termsAndConditions = "Terms & Conditions";
  static const String privacyPolicy = "Privacy Policy";
  static String profilePercentCompleted(int percent) => "Your Profile is now $percent% complete";
  static const String improveHiring = "Complete your profile and help good recruiters to find your talent";

  //edit profile
  static const String name = "Name";
  static const String bio = "Bio";
  static const String address = "Address";
  static const String mobile = "No.Handphone";
  static const String enterYourInfo = "Enter Your Info";
  static const String save = "Save";

  //Portfolio
  static const String addPortfolioHere = "Add portfolio here";

  //language
  static const String arabic = "Arabic";
  static const String english = "English";
  static const String french = "French";

  //notification settings
  static const String jobNotification = "Job notification";
  static const String otherNotification = "Other notification";
  static const String searchAlert = "Your Job Search Alert";
  static const String applicationUpdate = "Job Application Update";
  static const String applicationReminder = "Job Application Reminders";
  static const String interestedIn = "Jobs You May Be Interested In";
  static const String seekerUpdates = "Job Seeker Updates";
  static const String showProfile = "Show Profile";
  static const String allMessages = "All Message";
  static const String messageNudges = "Message Nudges";

  //login and security
  static const String accountAccess = "Account access";
  static const String emailAddress = "Email address";
  static const String changePassword = "Change password";
  static const String twoStepVerification = "Two-step verification";
  static const String fingerPrintUnlock = "Fingerprint unlock";

  //email address
  static const String mainEmailAddress = "Main e-mail address";

  //change password
  static const String oldPass = "Old password*";
  static const String newPass = "New password*";
  static const String confirmPass = "Confirm password*";
  static const String enterOldPass = "Enter your old password";
  static const String enterNewPass = "Enter your new password";
  static const String confirmNewPass = "Confirm your new password";

  //two step verification
  static const String hint1 = "Two-step verification provides additional security by asking for a verification code every time you log in on another device.";
  static const String hint2 = "Adding a phone number or using an authenticator will help keep your account safe from harm.";

  //two step verification confirm
  static const String addPhoneNumber = "Add phone number";
  static const String weWillSendVerification = "We will send a verification code to this number";

  //complete profile
  static const String completeProfile = "Complete Profile";
  static String stepsCompleted(int stepsCompleted) => "$stepsCompleted/4 Completed";
  static const String completeYourProfile = "Complete your profile before applying for a job";
  static const String step1Head = "Personal Details";
  static const String step1SubText = "Full name, email, phone number, and your address";
  static const String step2Head = "Education";
  static const String step2SubText = "Enter your educational history to be considered by the recruiter";
  static const String step3Head = "Experience";
  static const String step3SubText = "Enter your work experience to be considered by the recruiter";
  static const String step4Head = "Portfolio";
  static const String step4SubText = "Create your portfolio. Applying for various types of jobs is easier.";

  //Education
  static const String education = "Education";
  static const String university = "University";
  static const String title = "Title";
  static const String startYear = "Start Year";
  static const String endYear = "End Year";

  //Experience
  static const String experience = "Experience";
  static const String position = "Position";
  static const String typeOfWork = "Type of work";
  static const String companyName = "Company name";
  static const String location = "Location";


}