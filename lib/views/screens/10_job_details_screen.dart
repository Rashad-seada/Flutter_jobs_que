import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/blocs/job_detail/job_detail_cubit.dart';
import 'package:jobs_que/views/widgets/custom_text.dart';
import 'package:jobs_que/views/widgets/main_button.dart';
import 'package:jobs_que/views/widgets/main_tabs.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_const.dart';
import '../components/job_details/job_details_app_bar.dart';
import '../components/job_details/job_details_chip.dart';
import '../widgets/company_image.dart';
import '../widgets/main_scaffold.dart';
import '../widgets/space.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Space(
                height: AppConsts.appbarSpace.h,
              ),

              const JobDetailsAppBar(),
              Space(
                height: 4.h,
              ),

              CompanyImage(
                width: 14.w,
                height: 14.w,
              ),
              Space(
                height: 1.h,
              ),

              CustomText(
                "Senior UI Designer",
                color: AppTheme.neutral900,
                fontSize: AppConsts.subHeadTextSize.sp,
              ),
              Space(
                height: 0.5.h,
              ),

              CustomText(
                "Apple • Jakarta, Indonesia ",
                color: AppTheme.neutral700,
                fontSize: AppConsts.subTextSize.sp - 2.sp,
              ),
              Space(
                height: 2.h,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  JobDetailsChip(
                    title: 'Full-time',
                  ),
                  Space(
                    width: 2.w,
                  ),
                  JobDetailsChip(
                    title: 'On-site',
                  ),
                  Space(
                    width: 2.w,
                  ),
                  JobDetailsChip(
                    title: 'Senior',
                  ),
                ],
              ),
              Space(
                height: 5.h,
              ),

              MainTabs(
                  onTapChange: (index) =>
                      context.read<JobDetailCubit>().onPageChange(index),
                  width: 85.w,
                  height: 5.h,
                  children: const [
                    AppStrings.description,
                    AppStrings.company,
                    AppStrings.people,
                  ]),
              BlocConsumer<JobDetailCubit, JobDetailState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: context
                        .read<JobDetailCubit>()
                        .pages[context.read<JobDetailCubit>().currentIndex],
                  );
                },
              ),
            ],
          ),
        ),

        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 7.w,vertical: 1.h),
          child: MainButton(
            onTap: ()=> context.read<JobDetailCubit>().onTap(context),
            width: 85.w,
            height: 6.h,
            child:  CustomText(
              AppStrings.applyNow,
              color: AppTheme.textClr,
              fontSize: AppConsts.textSize.sp,
            ),
          ),
        ),
      ),
    );
  }
}
