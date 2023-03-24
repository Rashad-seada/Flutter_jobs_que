
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/blocs/create_account/create_account_cubit.dart';
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
            controller: context.read<CreateAccountCubit>().pageController,
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

          BlocConsumer<CreateAccountCubit,CreateAccountState>(
            listener: (context, state) {

            },
            builder: (context, state) {
              return Padding(
                      padding: EdgeInsets.only(bottom: 3.h),
                      child: MainButton(
                        isLoading: (state is CreateAccountIsLoading)? true : false,
                        onTap: () => context.read<CreateAccountCubit>().onButtonTap(currentIndex: currentIndex, context: context),
                        width: 85.w,
                        height: 6.5.h,
                        child: CustomText(
                          (currentIndex == 1)?AppStrings.done:AppStrings.next,
                          color: AppTheme.textClr,
                          fontSize: AppConsts.textSize.sp,
                        ),
                      ),
                    );
            },
          )
        ],
      ),
    );
  }
}
