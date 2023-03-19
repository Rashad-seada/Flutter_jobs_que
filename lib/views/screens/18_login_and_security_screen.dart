import 'package:flutter/material.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';
import '../../core/config/app_strings.dart';
import '../components/profile/setting_card.dart';
import '../components/profile/setting_section.dart';
import '../widgets/main_back_button.dart';
import '../widgets/space.dart';
import '19_email_address_screen.dart';
import '20_change_password_screen.dart';
import '21_two_step_verification_screen.dart';

class LoginAndSecurityScreen extends StatelessWidget {
  const LoginAndSecurityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Column(
        children: [
          Space(height: AppConsts.appbarSpace.h,),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 3.5.w,right: 5.w),
              child: MainBackButton(label: AppStrings.loginAndSecurity),
            ),
          ),
          Space(height: 3.h,),
          SettingSection(
            title: AppStrings.accountAccess,
            settingsCards: [

              SettingCard(title: AppStrings.emailAddress, screenToGo: const EmailAddressScreen(),),
              SettingCard(title: AppStrings.changePassword,screenToGo: const ChangePasswordScreen(),),
              SettingCard(title: AppStrings.twoStepVerification,screenToGo: const TwoStepVerificationScreen(),),
              SettingCard(title: AppStrings.fingerPrintUnlock),

            ],
          ),
        ],
      ),
    );
  }
}
