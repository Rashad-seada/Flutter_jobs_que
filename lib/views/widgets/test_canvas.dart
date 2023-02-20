import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';
import '../../core/config/app_images.dart';
import '../../core/config/app_strings.dart';
import 'auth_button.dart';
import 'auth_field.dart';
import 'custom_text.dart';
import 'main_back_button.dart';
import 'main_button.dart';
import 'main_check_box.dart';
import 'main_switch.dart';
import 'main_tabs.dart';

class TestCanvas extends StatelessWidget {
  const TestCanvas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: EdgeInsets.all(3.w),
                child: MainBackButton(label: 'Header',),
              ),

              SvgPicture.asset(AppImages.profileIcon(active: true)),

              MainTabs(
                width: 350,
                height: 55,
                children: ['home','explore','profile'],
                onTapChange: (index) {
                  //print(index);
                },
              ),

              AuthButton(assetName: AppImages.google, authMethod: AppStrings.google),
              SizedBox(
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: AuthField(
                    hintText: AppStrings.username,

                    prefixIcon: SvgPicture.asset(AppImages.profileIcon(active: false),height: 10,width: 10,),
                  ),
                ),
              ),
              SizedBox(
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: AuthField(
                    hintText: AppStrings.email,

                    prefixIcon: SvgPicture.asset(AppImages.emailIcon(active: false),height: 10,width: 10,),
                  ),
                ),
              ),
              SizedBox(
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: AuthField(
                    hintText: AppStrings.password,

                    prefixIcon: SvgPicture.asset(AppImages.lockIcon(active: false),height: 10,width: 10,),
                  ),
                ),
              ),

              MainButton(width: 280,height: 50,child: CustomText('Login',color: Colors.white,),),

              MainCheckBox(isChecked: false,onChanged: (isChecked){
                print(isChecked);
              },),

              MainSwitch(isOn: true,)
            ]),
      ),
    );
  }
}
