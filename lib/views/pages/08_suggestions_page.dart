import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_images.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/core/config/app_enums.dart';
import 'package:jobs_que/core/config/app_theme.dart';
import 'package:jobs_que/views/blocs/suggestion/suggestion_cubit.dart';
import 'package:jobs_que/views/components/search/suggestions_section.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../widgets/custom_text.dart';

class SuggestionsPage extends StatefulWidget {
  const SuggestionsPage({Key? key}) : super(key: key);

  @override
  State<SuggestionsPage> createState() => _SuggestionsPageState();
}

class _SuggestionsPageState extends State<SuggestionsPage> {

  @override
  void initState() {
    context.read<SuggestionCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SuggestionCubit, SuggestionState>(
      listener: (context, state) {
        print(state);
      },
      builder: (context, state) {
        if (state is SuggestionIsSuccess) {

          if(SuggestionIsSuccess.jobs!.isEmpty){
            return Column(
              children: [
                Space(height: 6.h,),
                Image.asset(AppImages.notFoundPlaceHolder,width: 20.w,height: 10.h,),
                Space(height: 3.h,),
                Center(child: CustomText("there was no suggestions found!",color: AppTheme.neutral500,)),
              ],
            );
          }else {
            return SuggestionsSection(
            sectionTitle: AppStrings.popularSearches,
            suggestionType: Search.suggestions,
            suggestions: SuggestionIsSuccess.jobs!,
          );
          }

        } else if (state is SuggestionIsLoading){
          return Column(
            children: [
              Space(height: 2.h,),
              Center(child: CircularProgressIndicator()),
            ],
          );
        }else{
          return Column(
            children: [
              Space(height: 6.h,),
              Image.asset(AppImages.searchPlaceHolder,width: 20.w,height: 10.h,),
              Space(height: 3.h,),
              Center(child: CustomText("Please enter what job you are looking for",color: AppTheme.neutral500,)),
            ],
          );
        }
      },
    );
  }
}
