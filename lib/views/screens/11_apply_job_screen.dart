import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/views/blocs/apply_job/apply_job_cubit.dart';
import 'package:jobs_que/views/components/apply_job/CustomSteps.dart';
import 'package:jobs_que/views/widgets/main_button.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_theme.dart';
import '../widgets/custom_text.dart';
import '../widgets/main_back_button.dart';

class ApplyJobScreen extends StatefulWidget {
  const ApplyJobScreen({Key? key}) : super(key: key);

  @override
  State<ApplyJobScreen> createState() => _ApplyJobScreenState();
}

class _ApplyJobScreenState extends State<ApplyJobScreen> {

  @override
  void initState() {
    context.read<ApplyJobCubit>().onDispose();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    List<bool> steps = context.read<ApplyJobCubit>().steps;

    return MainScaffold(
      child: Scaffold(
        body: Column(
          children: [

            Space(height: AppConsts.appbarSpace.h,),

            Padding(
              padding: EdgeInsets.only(left: 3.w,right: 5.w),
              child: MainBackButton(
                label: AppStrings.applyJob,
              ),
            ),

            Space(height: 3.h,),

            BlocConsumer<ApplyJobCubit, ApplyJobState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSteps(
                        stepsTitles: context.read<ApplyJobCubit>().stepsTitles,
                        focusedIndex: context.read<ApplyJobCubit>().currentStep,
                        onStepTap: (index) => context.read<ApplyJobCubit>().onStepTap(index),
                        verifiedSteps: steps,
                        itemCount: steps.length,
                    ),
                  ],
                );
              },
            ),

            Space(height: 4.h,),

            BlocConsumer<ApplyJobCubit, ApplyJobState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Flexible(
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              child: context.read<ApplyJobCubit>().pages[context.read<ApplyJobCubit>().currentStep],
                            )
                        );
              },
            )
          ],
        ),



        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 2.h),
          child: MainButton(
            onTap: ()=> context.read<ApplyJobCubit>().onTap(context),
            width: 85.w,
            height: 6.h,
            child:  CustomText(
              AppStrings.next,
              color: AppTheme.textClr,
              fontSize: AppConsts.textSize.sp,
            ),
          ),
        ),

      ),
    );
  }
}
