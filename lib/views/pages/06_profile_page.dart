import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/views/blocs/complete_profile/complete_profile_cubit.dart';
import 'package:jobs_que/views/screens/14_edit_profile_screen.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../components/profile/complete_profile_card.dart';
import '../components/profile/profile_about.dart';
import '../components/profile/profile_header.dart';
import '../components/profile/profile_info_section.dart';
import '../components/profile/setting_card.dart';
import '../components/profile/setting_section.dart';
import '../screens/15_portifolio_screen.dart';
import '../screens/16_language_screen.dart';
import '../screens/17_notification_settings_screen.dart';
import '../screens/18_login_and_security_screen.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: ListView(
        shrinkWrap: true,
        children: [

          const ProfileHeader(),
          Space(height: 8.h,),

          const ProfileInfoSection(),
          Space(height: 1.5.h,),

          const ProfileAbout(),
          Space(height: 4.h,),

          CompleteProfileCard(percent: context.read<CompleteProfileCubit>().totalSteps * 25,),
          Space(height: 4.h,),

          SettingSection(
            title: AppStrings.general,
            settingsCards: [
              SettingCard(title: AppStrings.editProfile,image: AppImages.profileBlue,screenToGo: const EditProfileScreen(),),
              SettingCard(title: AppStrings.portfolio,image: AppImages.folderBlue,screenToGo: const PortfolioScreen(),),
              SettingCard(title: AppStrings.language,image: AppImages.languageBlue,screenToGo: const LanguageScreen(),),
              SettingCard(title: AppStrings.notification,image: AppImages.notificationBlue,screenToGo:const NotificationSettingsScreen()),
              SettingCard(title: AppStrings.loginAndSecurity,image: AppImages.loginAndSecurityBlue,screenToGo: const LoginAndSecurityScreen(),),
            ],
          ),
          Space(height: 4.h,),

          SettingSection(
            title: AppStrings.others,
            settingsCards: [
              SettingCard(title: AppStrings.accessibility,),
              SettingCard(title: AppStrings.helpCenter,),
              SettingCard(title: AppStrings.termsAndConditions,),
              SettingCard(title: AppStrings.privacyPolicy,),
            ],
          ),


          Space(height: 10.h,),

        ],
      )

    );
  }
}