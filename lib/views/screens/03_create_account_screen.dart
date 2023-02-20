import 'package:flutter/material.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/screens/04_message_screen.dart';
import 'package:jobs_que/views/widgets/custom_page_transition.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:jobs_que/views/widgets/main_button.dart';
import 'package:sizer/sizer.dart';
import '../../core/config/app_const.dart';
import '../../core/config/app_strings.dart';
import '../components/create_account/create_account_first_body.dart';
import '../components/create_account/create_account_second_body.dart';
import '../pages/01_create_account_page.dart';
import '../widgets/main_scaffold.dart';

class CreateAccountScreen extends StatefulWidget {
  CreateAccountScreen({Key? key}) : super(key: key);
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  PageController controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [

          PageView(
            onPageChanged: (index){
              setState(() {
                currentIndex = index;
              });
            },
            controller: controller,
            children: [
              CreateAccountPage(
                headText: AppStrings.createAccountSecondHeadText,
                subText: AppStrings.createAccountSecondBodyText,
                body: CreateAccountFirstBody(),
              ),
              CreateAccountPage(
                headText: AppStrings.createAccountThirdHeadText,
                subText: AppStrings.createAccountThirdBodyText1,
                body: const CreateAccountSecondBody(),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(bottom: 3.h),
            child: MainButton(
              onTap: (){

                if(currentIndex == 1){

                  Navigator.push(context, CustomPageTransition(
                      MessageScreen(
                        image: AppImages.accountCreatedSuccessfully,
                        headText: AppStrings.createAccountFourthHeadText,
                        subText: AppStrings.createAccountFourthBodyText1,
                        buttonLable: AppStrings.getStarted,
                        onTap: (){},
                      ),

                  ));
                }else{
                  controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.fastLinearToSlowEaseIn);
                }

              },
              width: 85.w,
              height: 6.5.h,
              child: CustomText(
                (currentIndex == 1)?AppStrings.done:AppStrings.next,
                color: AppTheme.textClr,
                fontSize: AppConsts.textSize.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
