import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobs_que/core/config/app_strings.dart';
import 'package:jobs_que/core/config/enums.dart';
import 'package:jobs_que/views/components/search/suggestions_section.dart';
import 'package:jobs_que/views/widgets/space.dart';
import 'package:sizer/sizer.dart';

import '../blocs/search/search_cubit.dart';

class SuggestionsPage extends StatelessWidget {
  const SuggestionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if(state is SearchGetRecentSearchs){

        }

      },
      builder: (context, state) {
        if(state is SearchGetSuggestions) {
          return SuggestionsSection(
            sectionTitle: AppStrings.popularSearches,
            suggestionType: Search.suggestions,
          );
        } else return Column(
          children: [
            SuggestionsSection(
              sectionTitle: AppStrings.recentSearches,
              suggestionType: Search.recent,
            ),
            SuggestionsSection(
              sectionTitle: AppStrings.popularSearches,
              suggestionType: Search.suggestions,
            )
          ],
        );
      },
    );
  }
}
