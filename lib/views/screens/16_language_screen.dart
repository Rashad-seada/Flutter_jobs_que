import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_const.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/views/blocs/language/language_cubit.dart';
import 'package:jobs_que/views/widgets/main_scaffold.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../../core/config/app_strings.dart';
import '../components/language/language_card.dart';
import '../components/language/language_section.dart';
import '../widgets/main_back_button.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      child: Column(
        children: [
          Space(height: AppConsts.appbarSpace.h,),
          Center(
            child: Padding(
              padding: EdgeInsets.only(left: 3.5.w,right: 5.w),
              child: MainBackButton(label: AppStrings.language),
            ),
          ),
          Space(height: 3.h,),

          BlocConsumer<LanguageCubit, LanguageState>(
            listener: (context, state) {},
            builder: (context, state) {
              return LanguageSection(
                      selectedIndex: context.read<LanguageCubit>().selectedIndex,
                      languageCards: [
                        LanguageCard(language: AppStrings.arabic,flagImage: AppImages.arabic,),
                        LanguageCard(language: AppStrings.english,flagImage: AppImages.english,),
                        LanguageCard(language: AppStrings.french,flagImage: AppImages.english,),

                      ],
                    );
            },
          )

        ],
      ),
    );
  }
}
