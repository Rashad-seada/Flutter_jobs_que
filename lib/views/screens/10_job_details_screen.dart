import 'package:dartz/dartz.dart' as dartz;
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
import '../../domain/entities/jobs/recent_jobs_entity.dart';
import '../../domain/entities/jobs/suggested_jobs_entity.dart';
import '../components/job_details/job_details_app_bar.dart';
import '../components/job_details/job_details_chip.dart';
import '../pages/09_description_page.dart';
import '../pages/10_company_page.dart';
import '../pages/11_people_page.dart';
import '../widgets/company_image.dart';
import '../widgets/main_scaffold.dart';
import '../widgets/space.dart';

class JobDetailsScreen extends StatefulWidget {
  dartz.Either<SuggestedJob,RecentJob> job;

  JobDetailsScreen({
    required this.job,
    Key? key
  }) : super(key: key);

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {

  @override
  void dispose() {
    context.read<JobDetailCubit>().currentIndex = 0;
    super.dispose();
  }

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
                "${widget.job.fold((l) => l.name, (r) => r.name)}",
                color: AppTheme.neutral900,
                fontSize: AppConsts.subHeadTextSize.sp,
              ),
              Space(
                height: 0.5.h,
              ),

              CustomText(
                "${widget.job.fold((l) => l.compName, (r) => r.compName)} • ${widget.job.fold((l) => l.location, (r) => r.location)}",
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
                    title: '${widget.job.fold((l) => l.jobTimeType, (r) => r.jobTimeType)}',
                  ),
                  Space(
                    width: 2.w,
                  ),
                  JobDetailsChip(
                    title: '${widget.job.fold((l) => l.jobType, (r) => r.jobType)}',
                  ),
                  Space(
                    width: 2.w,
                  ),
                  JobDetailsChip(
                    title: '${widget.job.fold((l) => l.jobLevel, (r) => r.jobLevel)}',
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
                    child:
                    [
                      DescriptionPage(
                        jobDescription: '${widget.job.fold((l) => l.jobDescription, (r) => r.jobDescription)}',
                        skilledRequired: '${widget.job.fold((l) => l.jobSkill, (r) => r.jobSkill)}',
                      ),
                      CompanyPage(
                        email: '${widget.job.fold((l) => l.compEmail, (r) => r.compEmail)}',
                        website: '${widget.job.fold((l) => l.compWebsite, (r) => r.compWebsite)}',
                        aboutCompany: '${widget.job.fold((l) => l.aboutComp, (r) => r.aboutComp)}',
                      ),
                      PeoplePage(),
                    ][context.read<JobDetailCubit>().currentIndex],
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
